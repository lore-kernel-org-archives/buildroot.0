From: Paul <pbor1234@zonnet.nl>
Date: Thu, 17 Jan 2008 21:56:05 +0100
Subject: [Buildroot] iconv (trying to add) gives 'libtool: compile: unable
	to infer tagged configuration'
Message-ID: <20080117205610.7F6F7C5CD@green.qinip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to add a module to proftpd which requires libiconv. Since its not
in the toolchain I'm trying to add it and have copied an existing lib
makefile (libcgi) and modified it for libiconv. I'm not sure how to fix this
error and also I'm not sure if the makefile is ok now. Any directions are
appreciated.

 

cd lib && /usr/bin/make all

make[3]: Entering directory
`/home/joep/buildroot/build_powerpc/libiconv-1.12/libcharset/lib'

/bin/sh ../libtool --mode=compile
/home/joep/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-
gcc -I. -I. -I.. -I./.. -I../include -g -O2 -fvisibility=hidden
-DLIBDIR=\"/lib\" -DBUILDING_LIBCHARSET -DBUILDING_DLL
-DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/lib\" -DNO_XMALLOC
-Dset_relocation_prefix=libcharset_set_relocation_prefix
-Drelocate=libcharset_relocate -DHAVE_CONFIG_H -c ./localcharset.c

libtool: compile: unable to infer tagged configuration

libtool: compile: specify a tag with `--tag'

make[3]: *** [localcharset.lo] Error 1

make[3]: Leaving directory
`/home/joep/buildroot/build_powerpc/libiconv-1.12/libcharset/lib'

make[2]: *** [all] Error 2

make[2]: Leaving directory
`/home/joep/buildroot/build_powerpc/libiconv-1.12/libcharset'

make[1]: *** [lib/localcharset.h] Error 2

make[1]: Leaving directory
`/home/joep/buildroot/build_powerpc/libiconv-1.12'

make: *** [/home/joep/buildroot/build_powerpc/libiconv-1.12/src/libiconv.so]
Error 2

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080117/1c02cc98/attachment.htm 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: libiconv.mk
Url: http://busybox.net/lists/buildroot/attachments/20080117/1c02cc98/attachment.diff 
