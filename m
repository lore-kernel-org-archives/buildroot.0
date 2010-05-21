From: Thomas <tokant@gmx.net>
Date: Fri, 21 May 2010 08:19:45 +0200
Subject: [Buildroot] buildroot-2010.05-rc2, problem with binutils-2.20.1
Message-ID: <1274422785.5719.8.camel@bernd-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tried buildroot-2010.05-rc2:
make at91rm9200df_defconfig
make menuconfig
make

buildroot terminates with:

checking for zlib.h... yes
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function ?fibheap_union?:checking linker --as-needed support...
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:151: warning: implicit declaration of function ?free?
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function ?fibheap_replace_key_data?:
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:220: error: ?LONG_MIN? undeclared (first use in this function)
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:220: error: (Each undeclared identifier is reported only once
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:220: error: for each function it appears in.)
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function ?fibheap_delete_node?:
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:261: error: ?LONG_MIN? undeclared (first use in this function)
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:265: warning: implicit declaration of function ?abort?
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:265: warning: incompatible implicit declaration of built-in function ?abort?
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c: In function ?fibheap_consolidate?:
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:368: warning: implicit declaration of function ?memset?
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/fibheap.c:368: warning: incompatible implicit declaration of built-in function ?memset?
make[3]: *** [fibheap.o] Error 1
make[3]: Leaving directory
`/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1-build/libiberty'
make[2]: *** [all-libiberty] Error 2
make[2]: *** Waiting for unfinished jobs....
yes
checking for cos in -lm... yes
checking for ftello... yes
checking for ftello64... yes
checking for fseeko... yes
checking for fseeko64... yes
checking for fopen64... yes
checking size of off_t... 8
checking file_ptr type... BFD_HOST_64_BIT
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
checking for getpagesize... (cached) yes
checking for working mmap... yes
checking for madvise... yes
checking for mprotect... yes
configure: updating cache ./config.cache
configure: creating ./config.status
config.status: creating Makefile
config.status: creating doc/Makefile
config.status: creating bfd-in3.h
config.status: creating po/Makefile.in
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing default-1 commands
config.status: executing bfd_stdint.h commands
config.status: executing default commands
make[2]: Leaving directory
`/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1-build'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1-build'
make: ***
[/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1-build/binutils/objdump] Error 2
bernd at bernd-desktop:/media/disk/br1005rc2/buildroot-2010.05-rc2$

earlier in the terminal output, I can see a lot of warnings about
implicit/incompatible declaration of functions:

warning: implicit declaration of function ?strcpy?
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/dyn-string.c:193: warning: incompatible implicit declaration of built-in function ?strcpy?
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/dyn-string.c: In function ?dyn_string_copy_cstr?:
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/dyn-string.c:206: warning: implicit declaration of function ?strlen?
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/dyn-string.c:206: warning: incompatible implicit declaration of built-in function ?strlen?
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/dyn-string.c:211: warning: incompatible implicit declaration of built-in function ?strcpy?
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/binutils-2.20.1/libiberty/dyn-string.c: In function ?dyn_string_insert?:

My host system is Ubuntu 8.04/32 Bit.

Thanks, Thomas.
