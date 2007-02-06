From: F.Roch <f.roch@ibsdisplay.de>
Date: Tue, 06 Feb 2007 08:59:39 +0100
Subject: [Buildroot] Building Xorg for arm926t softfloat fails with error at
	linux_vm86.c
Message-ID: <45C8356B.4030107@ibsdisplay.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

i'm trying to build a graphical environment for my board with buildroot.
i tryed with tinyx + gtk2 but my cairo build fails because it depends on
newer Xrender header files that tinyx don't provide.

so i tryed with xorg and i get the following build error:

[snip]
make[10]: Entering directory 
`/home/frank/linux-at91sam9261/buildroot/build_arm_nofpu/xc/programs/Xserver/hw/xfree86/os-support/linux/int10/vm86'
rm -f linux_vm86.o
/home/frank/linux-at91sam9261/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc 
-Os -ansi -pedantic -Wall -Wpointer-arith -Wundef     -I. 
-I../../../../../../../../programs/Xserver/hw/xfree86/common 
-I../../../../../../../../programs/Xserver/hw/xfree86/int10            
-I../../../../../../../../programs/Xserver/hw/xfree86/os-support            
-I../../../../../../../../programs/Xserver/include 
-I../../../../../../../../exports/include/X11 -I  
-I../../../../../../../.. -I../../../../../../../../exports/include   
-Dlinux -D__arm__ -D_POSIX_SOURCE                               
-D_BSD_SOURCE -D_GNU_SOURCE -DX_LOCALE -DSHAPE -DXINPUT -DXKB  
-DXAPPGROUP    -DXCSECURITY -DTOGCUP   -DXF86BIGFONT -DDPMSExtension    
-DPIXPRIV -DPANORAMIX   -DRENDER -DRANDR       -DXFIXES -DDAMAGE 
-DCOMPOSITE -DXEVIE          -DGCCUSESGAS -DAVOID_GLYPHBLT -DPIXPRIV 
-DSINGLEDEPTH                          -DXFreeXDGA 
-DXvExtension                    -DXFree86LOADER  
-DXFree86Server                                 
-DXF86VIDMODE                           
-DXvMCExtension                                 
-DSMART_SCHEDULE                              -DBUILDDEBUG 
-DXResExtension                            
-DX_BYTE_ORDER=X_LITTLE_ENDIAN                          
-DXORG_VERSION_CURRENT="(((6) * 10000000) + ((8) * 100000) + ((2) * 
1000) + 0)" -DNDEBUG   -DFUNCPROTO=15 -DNARROWPROTO  -DIN_MODULE 
-DXFree86Module -DHAVE_SYSV_IPC     -D_VM86_LINUX -c linux_vm86.c
In file included from linux_vm86.c:14:
../../../../../../../../programs/Xserver/hw/xfree86/os-support/int10Defines.h:34:24: 
asm/vm86.h: No such file or directory
[snip]

when i do a find for this missing file i get:

find ./ -name vm86.h
./toolchain_build_arm_nofpu/linux-libc-headers-2.4.31/include/asm-i386/vm86.h
./toolchain_build_arm_nofpu/uClibc-0.9.28.1/libc/sysdeps/linux/i386/sys/vm86.h

and i think the script searches for this file in the "asm-arm" folder, 
right ?
has someone managed to build xorg (or tinyx + gtk2) for arm-nofpu ?

i'm using :

linux 2.4.31 headers
uClibc 0.9.28.1
binutils 2.17
gcc 3.4.6
busybox 1.2.2.1

thank you for your help,
Frank Roch
