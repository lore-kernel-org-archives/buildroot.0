From: Claudio Leonel <cls@elaxys.com.br>
Date: Sun, 17 Jun 2007 11:28:24 -0300
Subject: [Buildroot] Toolchain for i386 with floating point emulation
In-Reply-To: <1182015829.13620.3.camel@localhost>
References: <4673E35E.70905@elaxys.com.br> <1182015829.13620.3.camel@localhost>
Message-ID: <46754508.2020606@elaxys.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for the tip.
I have done that but I got an error when linking uClibc.
I seems that the floating point functions were not found.
I supplied the option "-msoft-float" in buildroot target optimization 
options.

These floating point emulation functions are part of uClibc ?
Any suggestions to solve this problem ?


Best regards,
Claudio Leonel


-----------------------------------------------------------------
LD libuClibc-0.9.29.so
libc/libc_so.a(difftime.os): In function `difftime':
difftime.c:(.text+0x16): undefined reference to `__floatsidf'
difftime.c:(.text+0x2e): undefined reference to `__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
_fpmaxtostr.c:(.text+0xc5): undefined reference to `__nexf2'
_fpmaxtostr.c:(.text+0xef): undefined reference to `__eqxf2'
_fpmaxtostr.c:(.text+0x114): undefined reference to `__divxf3'
_fpmaxtostr.c:(.text+0x125): undefined reference to `__ltxf2'
_fpmaxtostr.c:(.text+0x208): undefined reference to `__mulxf3'
_fpmaxtostr.c:(.text+0x499): undefined reference to `__gexf2'
_fpmaxtostr.c:(.text+0x54d): undefined reference to `__floatsixf'
_fpmaxtostr.c:(.text+0x566): undefined reference to `__addxf3'
_fpmaxtostr.c:(.text+0x57a): undefined reference to `__subxf3'
libc/libc_so.a(vfprintf.os): In function `vfprintf':
vfprintf.c:(.text+0x438): undefined reference to `__extenddfxf2'
libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x511): undefined reference to `__truncxfdf2'
__psfs_do_numeric.c:(.text+0x532): undefined reference to `__truncxfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x42): undefined reference to `__extendsfxf2'
libc/libc_so.a(__strtofpmax.os): In function `__strtofpmax':
__strtofpmax.c:(.text+0x1d4): undefined reference to `__divdf3'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory 
`/home/s/exlinux_86sx/rootfs/buildroot/toolchain_build_i486/uClibc-0.9.29'
make: *** 
[/home/s/exlinux_86sx/rootfs/buildroot/toolchain_build_i486/uClibc-0.9.29/lib/libc.a] 
Error 2
-----------------------------------------------------------------------

Mats Erik Andersson wrote:
> l?r 2007-06-16 klockan 10:19 -0300 skrev Claudio Leonel:
>> Hi
>>
>> I need to build a buildroot toolchain for the Vortex86SX chip.
>> This is a new low power chip from DMP which was shown in the
>> latest COMPUTEX (www.vortex86sx.com).
>> This chip is a 486 without the floating point coprocessor.
>>
>> I didn't find any options in buildroot to build a toolchain for
>> the i386 architecture with floating point emulation.
> 
> Run
> 
> $ make uclibc-menuconfig
> 
>     Target Architecture Features and Options  -->
>       Enable floating point support
>         Target CPU has a floating point unit
> 
> Switch the latter tick off!
> 
> Good luck!   Mats E A 
> 
> 
