From: Christopher Reder <creder@digitalcpt.com>
Date: Wed, 06 Jun 2007 18:14:45 -0500
Subject: [Buildroot] asm/vm86.h no such file when building X.org
Message-ID: <1181171685.18972.4.camel@engineering5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am sure someone has run into the following issue but I have not been
able to find anyone with a solution.  There was a post I found on google
referring to lnx_video.c but that was not the solution for this.  No
other results helped.

I am building X instead of tiny-x because of wanting Matchbox and it
needs some libraries that are not available as far as i can tell (in the
Xext library).  

When I build that for the arm architecture (nothing else above defaults
for arm, I get the following error which I am hoping someone can help me
with.



rm -f linux_vm86.o
/home/christopher/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -Os -ansi -pedantic -Wall -Wpointer-arith -Wundef     -I. -I../../../../../../../../programs/Xserver/hw/xfree86/common -I../../../../../../../../programs/Xserver/hw/xfree86/int10            -I../../../../../../../../programs/Xserver/hw/xfree86/os-support            -I../../../../../../../../programs/Xserver/include -I../../../../../../../../exports/include/X11 -I  -I../../../../../../../.. -I../../../../../../../../exports/include   -Dlinux -D__arm__ -D_POSIX_SOURCE              -D_BSD_SOURCE -D_GNU_SOURCE -DX_LOCALE -DSHAPE -DXINPUT -DXKB  -DXAPPGROUP      -DXCSECURITY -DTOGCUP    -DXF86BIGFONT -DDPMSExtension    -DPIXPRIV -DPANORAMIX -DRENDER -DRANDR        -DXFIXES -DDAMAGE -DCOMPOSITE -DXEVIE    -DGCCUSESGAS -DAVOID_GLYPHBLT -DPIXPRIV -DSINGLEDEPTH                          -DXFreeXDGA -DXvExtension                               -DXFree86LOADER  -DXFree86Server       -DXF86VIDMODE                            -DXvMCExtension                        -DSMART_SCHEDULE                                 -DBUILDDEBUG -DXResExtension   -DX_BYTE_ORDER=X_LITTLE_ENDIAN                           -DXORG_VERSION_CURRENT="(((6) * 10000000) + ((8) * 100000) + ((2) * 1000) + 0)" -DNDEBUG   -DFUNCPROTO=15 -DNARROWPROTO  -DIN_MODULE -DXFree86Module -DHAVE_SYSV_IPC     -D_VM86_LINUX -c linux_vm86.c
In file included from linux_vm86.c:14:
../../../../../../../../programs/Xserver/hw/xfree86/os-support/int10Defines.h:34:22: error: asm/vm86.h: No such file or directory
linux_vm86.c:16: warning: ?struct vm86_struct? declared inside parameter
list
linux_vm86.c:16: warning: its scope is only this definition or
declaration, which is probably not what you want
linux_vm86.c: In function ?xf86Int10ExecSetup?:
linux_vm86.c:25: error: dereferencing pointer to incomplete type
linux_vm86.c:26: error: dereferencing pointer to incomplete type
linux_vm86.c:27: error: dereferencing pointer to incomplete type
linux_vm86.c:27: error: ?CPU_586? undeclared (first use in this
function)
linux_vm86.c:27: error: (Each undeclared identifier is reported only
once
linux_vm86.c:27: error: for each function it appears in.)
linux_vm86.c:28: error: dereferencing pointer to incomplete type
linux_vm86.c:28: error: dereferencing pointer to incomplete type
linux_vm86.c:29: error: dereferencing pointer to incomplete type
linux_vm86.c:29: error: dereferencing pointer to incomplete type
linux_vm86.c: In function ?vm86_GP_fault?:
linux_vm86.c:48: error: dereferencing pointer to incomplete type
linux_vm86.c:48: error: dereferencing pointer to incomplete type
linux_vm86.c:60: error: dereferencing pointer to incomplete type
linux_vm86.c:61: error: dereferencing pointer to incomplete type
linux_vm86.c:62: error: dereferencing pointer to incomplete type
linux_vm86.c:63: error: dereferencing pointer to incomplete type
linux_vm86.c:64: error: dereferencing pointer to incomplete type
linux_vm86.c:65: error: dereferencing pointer to incomplete type
linux_vm86.c:73: error: dereferencing pointer to incomplete type
linux_vm86.c:74: error: dereferencing pointer to incomplete type
linux_vm86.c:81: error: dereferencing pointer to incomplete type
linux_vm86.c:81: error: dereferencing pointer to incomplete type
linux_vm86.c:81: error: dereferencing pointer to incomplete type
linux_vm86.c:81: error: dereferencing pointer to incomplete type
linux_vm86.c:82: error: dereferencing pointer to incomplete type
linux_vm86.c:82: error: dereferencing pointer to incomplete type
linux_vm86.c:82: error: dereferencing pointer to incomplete type
linux_vm86.c:83: error: dereferencing pointer to incomplete type
linux_vm86.c:83: error: dereferencing pointer to incomplete type
linux_vm86.c:84: error: dereferencing pointer to incomplete type
linux_vm86.c:91: error: dereferencing pointer to incomplete type
linux_vm86.c:91: error: dereferencing pointer to incomplete type
linux_vm86.c:91: error: dereferencing pointer to incomplete type
linux_vm86.c:91: error: dereferencing pointer to incomplete type
linux_vm86.c:92: error: dereferencing pointer to incomplete type
linux_vm86.c:92: error: dereferencing pointer to incomplete type
linux_vm86.c:92: error: dereferencing pointer to incomplete type
linux_vm86.c:95: error: dereferencing pointer to incomplete type
linux_vm86.c:95: error: dereferencing pointer to incomplete type
linux_vm86.c:95: error: dereferencing pointer to incomplete type
linux_vm86.c:95: error: dereferencing pointer to incomplete type
linux_vm86.c:96: error: dereferencing pointer to incomplete type
linux_vm86.c:96: error: dereferencing pointer to incomplete type
linux_vm86.c:96: error: dereferencing pointer to incomplete type
linux_vm86.c:98: error: dereferencing pointer to incomplete type
linux_vm86.c:98: error: dereferencing pointer to incomplete type
linux_vm86.c:99: error: dereferencing pointer to incomplete type
linux_vm86.c:103: error: dereferencing pointer to incomplete type
linux_vm86.c:105: error: dereferencing pointer to incomplete type
linux_vm86.c:105: error: dereferencing pointer to incomplete type
linux_vm86.c:105: error: dereferencing pointer to incomplete type
linux_vm86.c:106: error: dereferencing pointer to incomplete type
linux_vm86.c:106: error: dereferencing pointer to incomplete type
linux_vm86.c:106: error: dereferencing pointer to incomplete type
linux_vm86.c:107: error: dereferencing pointer to incomplete type
linux_vm86.c:107: error: dereferencing pointer to incomplete type
linux_vm86.c:108: error: dereferencing pointer to incomplete type
linux_vm86.c:112: error: dereferencing pointer to incomplete type
linux_vm86.c:115: error: dereferencing pointer to incomplete type
linux_vm86.c:115: error: dereferencing pointer to incomplete type
linux_vm86.c:115: error: dereferencing pointer to incomplete type
linux_vm86.c:116: error: dereferencing pointer to incomplete type
linux_vm86.c:116: error: dereferencing pointer to incomplete type
linux_vm86.c:116: error: dereferencing pointer to incomplete type
linux_vm86.c:119: error: dereferencing pointer to incomplete type
linux_vm86.c:119: error: dereferencing pointer to incomplete type
linux_vm86.c:119: error: dereferencing pointer to incomplete type
linux_vm86.c:120: error: dereferencing pointer to incomplete type
linux_vm86.c:120: error: dereferencing pointer to incomplete type
linux_vm86.c:120: error: dereferencing pointer to incomplete type
linux_vm86.c:122: error: dereferencing pointer to incomplete type
linux_vm86.c:122: error: dereferencing pointer to incomplete type
linux_vm86.c:123: error: dereferencing pointer to incomplete type
linux_vm86.c:127: error: dereferencing pointer to incomplete type
linux_vm86.c:128: error: dereferencing pointer to incomplete type
linux_vm86.c:129: error: dereferencing pointer to incomplete type
linux_vm86.c:133: error: dereferencing pointer to incomplete type
linux_vm86.c:134: error: dereferencing pointer to incomplete type
linux_vm86.c:138: error: dereferencing pointer to incomplete type
linux_vm86.c:138: error: dereferencing pointer to incomplete type
linux_vm86.c:139: error: dereferencing pointer to incomplete type
linux_vm86.c:139: error: dereferencing pointer to incomplete type
linux_vm86.c:140: error: dereferencing pointer to incomplete type
linux_vm86.c:144: error: dereferencing pointer to incomplete type
linux_vm86.c:144: error: dereferencing pointer to incomplete type
linux_vm86.c:145: error: dereferencing pointer to incomplete type
linux_vm86.c:149: error: dereferencing pointer to incomplete type
linux_vm86.c:150: error: dereferencing pointer to incomplete type
linux_vm86.c:151: error: dereferencing pointer to incomplete type
linux_vm86.c:155: error: dereferencing pointer to incomplete type
linux_vm86.c:156: error: dereferencing pointer to incomplete type
linux_vm86.c:160: error: dereferencing pointer to incomplete type
linux_vm86.c:160: error: dereferencing pointer to incomplete type
linux_vm86.c:161: error: dereferencing pointer to incomplete type
linux_vm86.c:161: error: dereferencing pointer to incomplete type
linux_vm86.c:162: error: dereferencing pointer to incomplete type
linux_vm86.c:166: error: dereferencing pointer to incomplete type
linux_vm86.c:166: error: dereferencing pointer to incomplete type
linux_vm86.c:167: error: dereferencing pointer to incomplete type
linux_vm86.c:178: error: dereferencing pointer to incomplete type
linux_vm86.c:178: error: dereferencing pointer to incomplete type
linux_vm86.c: In function ?do_vm86?:
linux_vm86.c:200: warning: passing argument 1 of ?vm86_rep? from
incompatible pointer type
linux_vm86.c:212: warning: implicit declaration of function ?VM86_TYPE?
linux_vm86.c:213: error: ?VM86_UNKNOWN? undeclared (first use in this
function)
linux_vm86.c:216: error: ?VM86_STI? undeclared (first use in this
function)
linux_vm86.c:222: error: ?VM86_INTx? undeclared (first use in this
function)
linux_vm86.c:223: warning: implicit declaration of function ?VM86_ARG?
linux_vm86.c:234: error: ?VM86_SIGNAL? undeclared (first use in this
function)
linux_vm86.c: At top level:
linux_vm86.c:267: error: conflicting types for ?vm86_rep?
linux_vm86.c:16: error: previous declaration of ?vm86_rep? was here
make[10]: *** [linux_vm86.o] Error 1
make[10]: Leaving directory
`/home/christopher/buildroot/build_arm/xc/programs/Xserver/hw/xfree86/os-support/linux/int10/vm86'
make[9]: *** [all] Error 2
make[9]: Leaving directory
`/home/christopher/buildroot/build_arm/xc/programs/Xserver/hw/xfree86/os-support/linux/int10'
make[8]: *** [all] Error 2
make[8]: Leaving directory
`/home/christopher/buildroot/build_arm/xc/programs/Xserver/hw/xfree86/os-support/linux'
make[7]: *** [linux] Error 2
make[7]: Leaving directory
`/home/christopher/buildroot/build_arm/xc/programs/Xserver/hw/xfree86/os-support'
make[6]: *** [all] Error 2
make[6]: Leaving directory
`/home/christopher/buildroot/build_arm/xc/programs/Xserver/hw/xfree86'
make[5]: *** [hw/xfree86] Error 2
make[5]: Leaving directory
`/home/christopher/buildroot/build_arm/xc/programs/Xserver'
make[4]: *** [all] Error 2
make[4]: Leaving directory
`/home/christopher/buildroot/build_arm/xc/programs'
make[3]: *** [all] Error 2
make[3]: Leaving directory `/home/christopher/buildroot/build_arm/xc'
make[2]: *** [World] Error 2
make[2]: Leaving directory `/home/christopher/buildroot/build_arm/xc'
make[1]: *** [World] Error 2
make[1]: Leaving directory `/home/christopher/buildroot/build_arm/xc'
make: ***
[/home/christopher/buildroot/build_arm/xc/programs/Xserver/Xorg] Error 2
engineering5:/home/christopher/buildroot#
