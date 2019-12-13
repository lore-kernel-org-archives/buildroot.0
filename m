From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 16:07:22 +0100
Subject: [Buildroot] PATCH 2019.11 stable release,
 glibc/gcc busybox incompatible
In-Reply-To: <TY2PR02MB3727097C4CD9FC2CE591C5C1C9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
 (zhou qi's message of "Fri, 13 Dec 2019 14:55:39 +0000")
References: <TY2PR02MB3727097C4CD9FC2CE591C5C1C9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
Message-ID: <87d0csgt79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
