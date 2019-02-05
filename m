From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 10:18:02 +0100
Subject: [Buildroot] [PATCH] support/testing: add docker /
 docker-compose tests
In-Reply-To: <5c58db4159d1d_290e2ab5f55cf3201186d@ultri5.mail> (ricardo
 martincoski's message of "Mon, 04 Feb 2019 22:39:29 -0200")
References: <CANQCQpZziEBsTFH_Vi8u9gGWpfCTxaJ+RSzcz9PKFy47eqdq7Q@mail.gmail.com>
 <5c58db4159d1d_290e2ab5f55cf3201186d@ultri5.mail>
Message-ID: <87sgx2pp9x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ricardo" == ricardo martincoski <ricardo.martincoski@gmail.com> writes:

 > Hello,
 > On Mon, Feb 04, 2019 at 03:11 PM, Matthew Weber wrote:

 >> On Mon, Feb 4, 2019 at 10:56 AM Peter Korsgaard wrote:
 >>> 
 >>> Build for x86-64 as public containers in general are only available for
 >>> x86-64.  Docker needs a number of kernel options enabled, so use a custom
 >>> kernel config based on the qemu one.
 >>> 
 >>> Docker needs entropy at startup, so enable the virtio-rng-pci device to
 >>> expose entropy to the guest.
 >> 
 >> Another option is enabling BR2_PACKAGE_HAVEGED to let the target compensate.

 > This is already used for 2 python test cases (pynacl and crossbar).
 > I don't have specific knowledge to say which is the best approach. For the
 > python test cases I just searched for *any* way to have enough entropy.

I don't think it is really clear cut. Haveged is probably not something
you should be using on a real system, and it only starts up relatively
late so there could be issues with early user space (E.G. I have had
issues with running mkfs.ext4 very early), but the virtio-rng-pci device
is only available for a limited set of qemu targets (E.G. the ones that
emulate a PCI bus).

-- 
Bye, Peter Korsgaard
