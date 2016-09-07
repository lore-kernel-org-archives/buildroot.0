From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Sep 2016 12:04:32 +0200
Subject: [Buildroot] [git commit] libpng: bump to version 1.6.25
Message-ID: <20160907100558.CFA3382263@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cd3e4bf8a09c322f91cdb955017bf1a78c579c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1.6.23 tarballs have moved so, while we are at modifying libpng.mk, bump to 1.6.25.

[Peter: add back upstream sha1 hash]
Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch        | 5 ++++-
 ...2-Don-t-append-prefix-to-symbol-names-in-version-script.patch | 9 ++++++---
 package/libpng/libpng.hash                                       | 7 ++++---
 package/libpng/libpng.mk                                         | 2 +-
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
index 30c3623..d232e4d 100644
--- a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
+++ b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
@@ -7,6 +7,9 @@ Disable the new pngfix and png-fix-itxt tools: they take up space, fail
 to build on some oddball toolchain configurations and aren't
 expected/needed in a non-interactive embedded system.
 
+[Julien: update for 1.6.25]
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  Makefile.am | 2 +-
@@ -32,7 +35,7 @@ index a66f6aa..4e67782 100644
 +++ b/Makefile.in
 @@ -104,7 +104,7 @@ check_PROGRAMS = pngtest$(EXEEXT) pngunknown$(EXEEXT) \
  	pngstest$(EXEEXT) pngvalid$(EXEEXT) pngimage$(EXEEXT) \
- 	$(am__EXEEXT_1)
+ 	pngcp$(EXEEXT) $(am__EXEEXT_1)
  @HAVE_CLOCK_GETTIME_TRUE at am__append_1 = timepng
 -bin_PROGRAMS = pngfix$(EXEEXT) png-fix-itxt$(EXEEXT)
 +bin_PROGRAMS =
diff --git a/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch b/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
index 0754e21..2a9bfd1 100644
--- a/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
+++ b/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
@@ -12,6 +12,9 @@ Original patch by: Sonic Zhang <sonic.zhang@analog.com>
 [Gustavo: update for 1.6.22]
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
+[Julien: update for 1.6.25]
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  Makefile.am | 2 +-
@@ -22,7 +25,7 @@ diff --git a/Makefile.am b/Makefile.am
 index 3430dca..db6a7a2 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -236,7 +236,7 @@ contrib/tools/pngfix.o: pnglibconf.h
+@@ -245,7 +245,7 @@ contrib/tools/pngfix.o: pnglibconf.h
  # interfering with the symbol file format.
  SYMBOL_CFLAGS = -DPNGLIB_LIBNAME='PNG at PNGLIB_MAJOR@@PNGLIB_MINOR at _0'\
  		-DPNGLIB_VERSION='@PNGLIB_VERSION@'\
@@ -35,13 +38,13 @@ diff --git a/Makefile.in b/Makefile.in
 index 4e67782..5f468d9 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -754,7 +754,7 @@ SUFFIXES = .chk .out
+@@ -766,7 +766,7 @@ SUFFIXES = .chk .out
  # interfering with the symbol file format.
  SYMBOL_CFLAGS = -DPNGLIB_LIBNAME='PNG at PNGLIB_MAJOR@@PNGLIB_MINOR at _0' \
  	-DPNGLIB_VERSION='@PNGLIB_VERSION@' \
 -	-DSYMBOL_PREFIX='$(SYMBOL_PREFIX)' -DPNG_NO_USE_READ_MACROS \
 +	-DSYMBOL_PREFIX='' -DPNG_NO_USE_READ_MACROS \
- 	-DPNG_BUILDING_SYMBOL_TABLE $(am__append_6)
+ 	-DPNG_BUILDING_SYMBOL_TABLE $(am__append_7)
  
  # EXT_LIST is a list of the possibly library directory extensions, this exists
 -- 
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 04e8e40..cc4bde2 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,4 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.23/
-md5	9b320a05ed4db1f3f0865c8a951fd9aa	libpng-1.6.23.tar.xz
-sha1	4857fb8dbd5ca7ddacc40c183e340b9ffa34a097	libpng-1.6.23.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.25/
+sha1 fb471b7732d886b5adf10b4d689a90c88f005aa5 libpng-1.6.25.tar.xz
+# Locally computed:
+sha256 09fe8d8341e8bfcfb3263100d9ac7ea2155b28dd8535f179111c1672ac8d8811  libpng-1.6.25.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 0dfc535..c577cd5 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.23
+LIBPNG_VERSION = 1.6.25
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
