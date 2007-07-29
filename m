From: Shai Lifshitz <ShaiL@visonic.com>
Date: Sun, 29 Jul 2007 16:33:55 +0400
Subject: [Buildroot] fail running the 'makeboard.sh' script
Message-ID: <OF3338098B.EEF707AE-ONC2257327.00424FA7-C3257327.003F2BA7@visonic.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dir Sir,

I have tried to run the make_boards-2007105-21.sh. first problem was that 
I had to change the 'BUILDROOT_VERS=2007-06-07.
I have done another change in the script, I have removed three lines:
# make_board at91rm9201ekf $1
# make_board at91rm9200df $1
# make_board at91rm9203ek $1

and left only one line:
make_board at91rm9260dfc $1
(I run armsam9260ek)

the flags I used:
BR2_arm=y
BR2_arm926t=y
BR2_ARM_EABI=y

after running the 'make menuconfig' and 'make' the following error 
appeared:

...
...
/bin/sh 
/home/shail/downloads/tt2/buildroot-atmel/toolchain_build_arm_small/gcc-4.1.2/gcc/../move-if-change 
tmp-macro_list macro_list
echo timestamp > s-macro_list
The directory that should contain system headers does not exist:
 
/home/shail/downloads/tt2/buildroot-atmel/toolchain_build_arm_small/uClibc_dev//usr/include
make[2]: *** [stmp-fixinc] Error 1
make[2]: Leaving directory 
`/home/shail/downloads/tt2/buildroot-atmel/toolchain_build_arm_small/gcc-4.1.2-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory 
`/home/shail/downloads/tt2/buildroot-atmel/toolchain_build_arm_small/gcc-4.1.2-initial'
make: *** 
[/home/shail/downloads/tt2/buildroot-atmel/toolchain_build_arm_small/gcc-4.1.2-initial/.compiled] 
Error 2
Makefile:112: warning: overriding commands for target 
`/home/shail/downloads/tt2/buildroot-atmel/binaries/at91sam9260'
target/ext2/ext2root.mk:90: warning: ignoring old commands for target 
`/home/shail/downloads/tt2/buildroot-atmel/binaries/at91sam9260'
cp      -f .config      configs/at91sam9260-2007-07-29.config


my questions are as follows:

1) what to do to eliminate this error.
2) do I have to run 'make' all from the beginning, or can I continue at 
the point the 'make' stopped due to the error (it is a few hours run).

Sincerely

Shai Lifshitz
email: shail at visonic.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070729/cf230700/attachment.htm 
