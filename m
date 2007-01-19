From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 19 Jan 2007 15:41:17 +0100
Subject: [Buildroot] build root error with nofpu
In-Reply-To: <02f701c73b97$144f4bb0$0c96a8c0@Thomas>
References: <02f701c73b97$144f4bb0$0c96a8c0@Thomas>
Message-ID: <20070119144117.GA16604@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 19, 2007 at 02:57:20PM +0800, thomas.luo wrote:
>>>do a rm -rf build_arm_nofpu/* toolchain_build_arm_nofpu/*
>>>then make sure that your BR2_JLEVEL=1 and invoke "make" again and paste
>>>the first error you get.
>>>
>>>Providing your .config and the uclibc.config would help, too.
>>
>>libc/libc_so.a(difftime.os): In function `difftime':
>>difftime.c:(.text+0x8): undefined reference to `__floatsidf'
>>difftime.c:(.text+0x2c): undefined reference to `__subdf3'
>>libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
>>_fpmaxtostr.c:(.text+0xd4): undefined reference to `__nedf2'
>>_fpmaxtostr.c:(.text+0xf8): undefined reference to `__eqdf2'
>>_fpmaxtostr.c:(.text+0x114): undefined reference to `__divdf3'
>>_fpmaxtostr.c:(.text+0x120): undefined reference to `__ltdf2'
>>_fpmaxtostr.c:(.text+0x1c4): undefined reference to `__muldf3'
>>_fpmaxtostr.c:(.text+0x388): undefined reference to `__gedf2'
>>_fpmaxtostr.c:(.text+0x430): undefined reference to `__adddf3'
>>libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
>>__psfs_do_numeric.c:(.text+0x51c): undefined reference to `__truncdfsf2'
>>libc/libc_so.a(strtof.os): In function `strtof':
>>strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
>>/mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/lib/gcc/arm-linux-uclibc/4.1.1/libgcc.a(_fixunsdfsi.o): In function 
>>`__fixunsdfsi':
>>libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
>>make[2]: *** [lib/libc.so] Error 1
>>make[1]: *** [lib/libc.so.0] ??? 2
>>make[1]: Leaving directory 
>>`/mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc'
>>make: *** 
>>[/mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc/lib/libc.a] ??? 2
>>[root at localhost buildroot]# 
>>

[snip inlined buildroot.config]
Looks like you did not send your uClibc.config?

Please attach them both, non-inlined, so i can save them away easily and
try to reproduce that problem.
thanks,
