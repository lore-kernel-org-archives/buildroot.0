From: thomas.luo <thomas.luo@ieee.org>
Date: Fri, 19 Jan 2007 14:56:10 +0800
Subject: [Buildroot] build root error with nofpu
References: <005501c739d4$a189ef90$0696a8c0@Thomas>
	<20070117181855.GB29900@aon.at>
Message-ID: <02f101c73b96$eaf7a5a0$0c96a8c0@Thomas>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: "thomas.luo" <thomas.luo@ieee.org>
Cc: <buildroot@uclibc.org>
Sent: Thursday, January 18, 2007 2:18 AM
Subject: Re: [Buildroot] build root error with nofpu


> On Wed, Jan 17, 2007 at 09:03:13AM +0800, thomas.luo wrote:
>>[root at localhost buildroot]# make
>>
>>Checking build system dependencies:
>>CC clean:                                       Ok
>>CXX clean:                                      Ok
>>CPP clean:                                      Ok
>>CFLAGS clean:                                   Ok
>>CXXFLAGS clean:                                 Ok
>>sed works:                                      Ok
>>which installed:                                Ok
>>GNU make version '3.80':                        Ok
>>C compiler '/usr/bin/gcc'
>>C compiler version '3.4.6':                     Ok
>>bison installed:                                Ok
>>flex installed:                                 Ok
>>gettext installed:                              Ok
>>Build system dependencies:                      Ok
>>
>>make -C /mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc \
>>       PREFIX= \
>>       DEVEL_PREFIX=/mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/ \
>>       RUNTIME_PREFIX=/mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/ \
>>       install_runtime install_dev
>>make[1]: Entering directory
>>`/mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc'
>>install -d /mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/lib
>>install -m 644 lib/lib*-0.9.29.so \
>>       /mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/lib
>>install: cannot stat `lib/lib*-0.9.29.so': No such file or directory
>
> do a rm -rf build_arm_nofpu/* toolchain_build_arm_nofpu/*
> then make sure that your BR2_JLEVEL=1 and invoke "make" again and paste
> the first error you get.
>
> Providing your .config and the uclibc.config would help, too.

libc/libc_so.a(difftime.os): In function `difftime':
difftime.c:(.text+0x8): undefined reference to `__floatsidf'
difftime.c:(.text+0x2c): undefined reference to `__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
_fpmaxtostr.c:(.text+0xd4): undefined reference to `__nedf2'
_fpmaxtostr.c:(.text+0xf8): undefined reference to `__eqdf2'
_fpmaxtostr.c:(.text+0x114): undefined reference to `__divdf3'
_fpmaxtostr.c:(.text+0x120): undefined reference to `__ltdf2'
_fpmaxtostr.c:(.text+0x1c4): undefined reference to `__muldf3'
_fpmaxtostr.c:(.text+0x388): undefined reference to `__gedf2'
_fpmaxtostr.c:(.text+0x430): undefined reference to `__adddf3'
libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x51c): undefined reference to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
/mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/lib/gcc/arm-linux-uclibc/4.1.1/libgcc.a(_fixunsdfsi.o): In function 
`__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] ??? 2
make[1]: Leaving directory `/mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc'
make: *** [/mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc/lib/libc.a] ??? 2
[root at localhost buildroot]# 
