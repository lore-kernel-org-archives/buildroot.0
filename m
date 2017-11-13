From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 22:03:51 +0100
Subject: [Buildroot] [PATCH] Linux: Clear CONFIG_INITRAMFS_SOURCE if
 BR2_TARGET_ROOTFS_INITRAMFS is not set
In-Reply-To: <1510592834.6361.73.camel@synopsys.com> (Alexey Brodkin's message
 of "Mon, 13 Nov 2017 17:07:14 +0000")
References: <20171113043416.43750-1-didin@synopsys.com>
 <878tfas2b6.fsf@dell.be.48ers.dk>
 <1510592834.6361.73.camel@synopsys.com>
Message-ID: <87zi7p3n7s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

Hi,

 > Well a couple of things I was thinking about:
 > 1. This would be [in my view] just a complimentary option to setting BR's rootfs.
 > 2. Usage of prebuilt initramf with BR might be quite a tricky thing because
 > ? ?different toolchain could be used with different ABI, libc etc so chances
 > ? ?are quite high that user-space stuff built with BR will be incompatible with
 > ? ?contents of prebuilt rootfs. But I guess we cannot stop people from doing that.

Correct, but that is in reality not so difficult to do as the kernel ABI
is stable, and most architectures have stable ABIs. Libc doesn't enter
the question as the initramfs typically will not use files from the
rootfs or the other way around.


 >> Couldn't you fix these arc specific defconfig issues with a small
 >> kconfig fragment instead?

 > So maybe this is indeed a bit better solution even though we know nobody
 > who'd do such a trick with pre-built initramfs.

I do ;) I am using an external initramfs instead of built into the
kernel though, but that is just a minor detail.

-- 
Bye, Peter Korsgaard
