From: jing han <jing_han_66@yahoo.com>
Date: Thu, 25 Jun 2009 11:40:35 -0700 (PDT)
Subject: [Buildroot] Compilation error in _fpmaxtostr.c when buildroot
Message-ID: <368484.78687.qm@web53510.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,
 
I experienced 
the Compilation error in _fpmaxtostr.c
 
I 
downloaded the latest buildroot tarball  buildroot-2009.05.tar.gz
on my Fedora core 5 
machine, and installed the tarball, did make menuconfig, then when I did 
make
I encountered the following error:
 
/mips-linux-uclibc/4.2.4/libgcc.a(_floatunditf.o)
libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
_fpmaxtostr.c:(.text+0xcc): undefined reference to `__netf2'
_fpmaxtostr.c:(.text+0xfc): undefined reference to `__eqtf2'
_fpmaxtostr.c:(.text+0x124): undefined reference to `__lttf2'
_fpmaxtostr.c:(.text+0x12c): undefined reference to `__divtf3'
_fpmaxtostr.c:(.text+0x200): undefined reference to `__multf3'
_fpmaxtostr.c:(.text+0x408): undefined reference to `__getf2'
_fpmaxtostr.c:(.text+0x4e0): undefined reference to `__subtf3'
libc/libc_so.a(_vfprintf_internal.os): In function `_vfprintf_internal':
_vfprintf_internal.c:(.text+0x554): undefined reference to 
`__extenddftf2'
libc/libc_so.a(__psfs_do_numeric.os): In function 
`__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x614): undefined 
reference to `__trunctfdf2'
__psfs_do_numeric.c:(.text+0x62c): undefined 
reference to `__trunctfsf2'
libc/libc_so.a(strtof.os): In function 
`strtof':
strtof.c:(.text+0x54): undefined reference to 
`__extendsftf2'
libc/libc_so.a(__strtofpmax.os): In function 
`__strtofpmax':
__strtofpmax.c:(.text+0x15c): undefined reference to 
`__floatsitf'
__strtofpmax.c:(.text+0x1a8): undefined reference to 
`__addtf3'
/home/jhan/Desktop/buildroot-2009.05/build_mips/staging_dir/usr/lib/gcc/mips-linux-uclibc/4.2.4/libgcc.a(_fixunstfdi.o): 
In function `__fixunstfdi':
/home/jhan/Desktop/buildroot-2009.05/toolchain_build_mips/gcc-4.2.4/gcc/libgcc2.c:1166: 
relocation truncated to fit: R_MIPS_GOT_PAGE against `.rodata.cst16'
/home/jhan/Desktop/buildroot-2009.05/toolchain_build_mips/gcc-4.2.4/gcc/libgcc2.c:1173: 
relocation truncated to fit: R_MIPS_GOT_OFST against `.rodata.cst16'
/home/jhan/Desktop/buildroot-2009.05/toolchain_build_mips/gcc-4.2.4/gcc/libgcc2.c:1173: 
relocation truncated to fit: R_MIPS_GOT_OFST against `$LC0'+8
/home/jhan/Desktop/buildroot-2009.05/toolchain_build_mips/gcc-4.2.4/gcc/libgcc2.c:1176: 
relocation truncated to fit: R_MIPS_CALL16 against `__floatunditf'
collect2: ld returned 1 exit status
make[1]: *** [lib/libc.so] Error 1
make[1]: Leaving directory 
`/home/jhan/Desktop/buildroot-2009.05/toolchain_build_mips/uClibc-0.9.30.1'
make: *** 
[/home/jhan/Desktop/buildroot-2009.05/toolchain_build_mips/uClibc-0.9.30.1/lib/libc.a] 
Error 2
 
After browse online,  I found that 
at the following website:
http://lists.uclibc.org/pipermail/uclibc/2005-March/032197.html
 
you mentioned that this problem was fixed in March, 2005, 
but it come back again. Can you tell me how to get around this problem or 
can you fix it?
 
By the way, When I did make 
menuconfig, I select MIPS64 as the Target Architecture Variant, and Target 
ABI is n32.
 
Thank you in advance.
 
Best 
Regards
jing


      __________________________________________________________________
Yahoo! Canada Toolbar: Search from anywhere on the web, and bookmark your favourite sites. Download it now
http://ca.toolbar.yahoo.com.
