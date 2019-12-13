From: zhou qi <atmgnd@outlook.com>
Date: Fri, 13 Dec 2019 15:30:25 +0000
Subject: [Buildroot] PATCH 2019.11 stable release,
 glibc/gcc busybox incompatible
In-Reply-To: <87d0csgt79.fsf@dell.be.48ers.dk>
References: <TY2PR02MB3727097C4CD9FC2CE591C5C1C9540@TY2PR02MB3727.apcprd02.prod.outlook.com>,
 <87d0csgt79.fsf@dell.be.48ers.dk>
Message-ID: <TY2PR02MB3727BA639496E684AE9AF4F2C9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I build on ubuntu 19.04 64bit, intel i3 cpu.

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=550986> for Windows 10

________________________________
From: Peter Korsgaard <jacmet@gmail.com> on behalf of Peter Korsgaard <peter@korsgaard.com>
Sent: Friday, December 13, 2019 11:07:22 PM
To: zhou qi <atmgnd@outlook.com>
Cc: buildroot at busybox.net <buildroot@busybox.net>
Subject: Re: PATCH 2019.11 stable release, glibc/gcc busybox incompatible

>>>>> "zhou" == zhou qi <atmgnd@outlook.com> writes:

 > I may found a bug of 2019.11 release, plz someone (developers) test it.
 > I found use the 2019.11 release to build i386 image have following error for busybox/gcc

 > I downloaded 2019.11 stable release from https://buildroot.org/downloads/buildroot-2019.11.tar.gz
 > And use the following command to build a simple i386 image.

 >   1.  make pc_x86_64_defconfig
 >   2.  make menuconfig
 > # chang arch to i386, change libc to glibc save the config, then type

I take it you have left the CPU variant alone, E.G. still nocona?

 >   1.  make

 > use qemu to test:
 > sudo ~/opt/qemu-4.1.1/bin/qemu-system-x86_64 --enable-kvm output/images/disk.img -m 512 -boot d -usb -device usb-tablet -soundhw sb16 -monitor stdio -cpu qemu64 -vga std

On what hardware and OS are you running this?

--
Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191213/7e75e55d/attachment.html>
