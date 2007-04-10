From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 10 Apr 2007 12:39:01 +0200
Subject: [Buildroot] [patch] sysroot support in toolchain,
	use correct pathes in staging_dir
Message-ID: <20070410103901.GC15274@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is a heads-up that i mean to correct the pathes to includes and
libs in the staging dir as suggested in bug 
http://busybox.net/bugs/view.php?id=1290
Doing so is ment to ease moving the staging-dir (and it's
cross-compiler) to a different machine for re-use.

The theory of operation is that we aim to keep the positions of "normal"
desktop machines for the directory layout and also build the toolchain
with full sysroot-support to avoid trouble with hardcoded search pathes
to headers and libraries.

A preliminary incarnation which only takes care of gcc-4.x is here:

http://uclibc.org/~aldot/buildroot.mine.cow.20070406-1957.diff.bz2
(134688 Bytes)
diffstat:
 toolchain/sstrip/sstrip.mk                             |   10 
 toolchain/binutils/binutils.mk                         |   38 
 toolchain/gcc/gcc-uclibc-3.x.mk                        |    6 
 toolchain/gcc/gcc-uclibc-4.x.mk                        |  451 
 toolchain/uClibc/uclibc.mk                             |   65 
 Config.in                                              |   27 
 package/ncurses/ncurses.mk                             |   38 
 package/openssh/openssh.mk                             |   10 
 package/openssl/openssl.mk                             |   55 
 package/m4/m4.mk                                       |   11 
 package/mpfr/mpfr.mk                                   |   47 
 package/ltrace/ltrace-svn-20070406.01.autoreconf.patch | 5948 +++++
 package/ltrace/ltrace.mk                               |   37 
 package/ltrace/ltrace-svn-20070406.00.patch            |19000 +++++++++++++++++
 package/Makefile.in                                    |   54 
 package/zlib/zlib.mk                                   |   56 
 package/gmp/gmp.mk                                     |   49 
 Makefile                                               |    7 
 18 files changed, 25681 insertions(+), 228 deletions(-)

The ltrace patch is not strictly related to the patch but i had to
pickup the latest version of it locally, fwiw.
