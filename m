From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Sep 2019 19:07:45 +0200
Subject: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init script
 survive 'console=' kernel argument
In-Reply-To: <dde1b129-f7fd-a444-fbd3-f1c017a311fd@exertus.fi> (Timo Ketola's
 message of "Mon, 23 Sep 2019 19:46:58 +0300")
References: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
 <87tv93w43e.fsf@dell.be.48ers.dk>
 <dde1b129-f7fd-a444-fbd3-f1c017a311fd@exertus.fi>
Message-ID: <87pnjrvt3y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Timo" == Timo Ketola <timo@exertus.fi> writes:

 > On 23.9.2019 16.10, Peter Korsgaard wrote:
 >>>>>>> "Timo" == Timo Ketola <Timo.Ketola@exertus.fi> writes:
 >> 
 >> > When booting with 'console=<empty>' in the kernel command line (as e.g.
 >> > U-Boot does with silent flags in effect), opening /dev/console fails.
 >> > That is fatal in the /init script and kernel will panic. It is also
 >> > needless, because the kernel tries to open it anyway (well, as long as
 >> > we have console node in initramfs /dev; cpio.mk creates that alright).
 >> 
 >> Also when devtmpfs is used? We manually mount devtmpfs in the initramfs,
 >> so the kernel presumably cannot have opened /dev/console before
 >> executing /init, and we do not add a static device node for
 >> /dev/console.

 > But I thought BR does just that here:

 > https://git.busybox.net/buildroot/tree/fs/cpio/cpio.mk

 > line 24, 25

Heh, indeed - I forgot about that logic. Then I guess it is good, unless
something else in the boot sequence doesn't like a missing
stdin/stdout/stderr.

-- 
Bye, Peter Korsgaard
