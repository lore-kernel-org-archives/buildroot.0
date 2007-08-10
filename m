From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 10 Aug 2007 03:08:57 +0300
Subject: [Buildroot] xorg compilation for arm fails
Message-ID: <46BBAC99.6060908@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Now got errors for xorg compilation (arm target):


making all in programs/Xserver/hw/xfree86/os-support/linux/int10...
make[9]: Entering directory `/root/buildroot/build_arm/xc/programs/Xserver/hw/xfree86/os-support/linux/int10'
making all in programs/Xserver/hw/xfree86/os-support/linux/int10/vm86...
make[10]: Entering directory `/root/buildroot/build_arm/xc/programs/Xserver/hw/xfree86/os-support/linux/int10/vm86'
rm -f linux_vm86.o
/root/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -ansi -pedantic -Wall -Wpointer-arith -Wundef     -I. -I../../../../../../../../programs/Xserver/hw/xfree86/common 
-I../../../../../../../../programs/Xserver/hw/xfree86/int10            -I../../../../../../../../programs/Xserver/hw/xfree86/os-support            -I../../../../../../../../programs/Xserver/include 
-I../../../../../../../../exports/include/X11 -I  -I../../../../../../../.. -I../../../../../../../../exports/include   -Dlinux -D__arm__ -D_POSIX_SOURCE                           -D_BSD_SOURCE 
-D_GNU_SOURCE -DX_LOCALE -DSHAPE -DXINPUT -DXKB  -DXAPPGROUP  -DXCSECURITY -DTOGCUP   -DXF86BIGFONT -DDPMSExtension    -DPIXPRIV -DPANORAMIX   -DRENDER -DRANDR       -DXFIXES -DDAMAGE -DCOMPOSITE 
-DXEVIE        -DGCCUSESGAS -DAVOID_GLYPHBLT -DPIXPRIV -DSINGLEDEPTH                          -DXFreeXDGA -DXvExtension                               -DXFree86LOADER  -DXFree86Server 
           -DXF86VIDMODE                           -DXvMCExtension                                 -DSMART_SCHEDULE   -DBUILDDEBUG -DXResExtension 
-DX_BYTE_ORDER=X_LITTLE_ENDIAN                          -DXORG_VERSION_CURRENT="(((6) * 10000000) + ((8) * 100000) + ((2) * 1000) + 0)" -DNDEBUG   -DFUNCPROTO=15 -DNARROWPROTO  -DIN_MODULE 
-DXFree86Module -DHAVE_SYSV_IPC     -D_VM86_LINUX -c linux_vm86.c
In file included from linux_vm86.c:14:
../../../../../../../../programs/Xserver/hw/xfree86/os-support/int10Defines.h:34:22: error: asm/vm86.h: No such file or directory
linux_vm86.c:16: warning: ?struct vm86_struct? declared inside parameter list
linux_vm86.c:16: warning: its scope is only this definition or declaration, which is probably not what you want
linux_vm86.c: In function ?xf86Int10ExecSetup?:
linux_vm86.c:25: error: dereferencing pointer to incomplete type
linux_vm86.c:26: error: dereferencing pointer to incomplete type
linux_vm86.c:27: error: dereferencing pointer to incomplete type
linux_vm86.c:27: error: ?CPU_586? undeclared (first use in this function)
linux_vm86.c:27: error: (Each undeclared identifier is reported only once
linux_vm86.c:27: error: for each function it appears in.)
linux_vm86.c:28: error: dereferencing pointer to incomplete type
linux_vm86.c:28: error: dereferencing pointer to incomplete type
linux_vm86.c:29: error: dereferencing pointer to incomplete type
linux_vm86.c:29: error: dereferencing pointer to incomplete type

-----------------

build_arm/xc/config/cf/cross.def has #define Arm32Architecture

Best regards,
Ivan
