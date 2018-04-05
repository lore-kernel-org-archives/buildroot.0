From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:32 +0200
Subject: [Buildroot] [PATCH 18/23] libpng: remove Blackfin patch
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-19-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-prefix-to-symbol-names-in-version-script.patch | 55 ----------------------
 1 file changed, 55 deletions(-)
 delete mode 100644 package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch

diff --git a/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch b/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
deleted file mode 100644
index de772225ba..0000000000
--- a/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 473fdecd9a580b45251480b8ccbbb1927c598310 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 26 May 2016 16:27:13 -0300
-Subject: [PATCH] Don't append prefix to symbol names in version script
-
-Even if Blackfin GNU toolchain add prefix '_' to all symbols,
-symbol prefix is not accepted in the link flag --version-script.
-Don't append prefix in the symbols in the version script file.
-
-Original patch by: Sonic Zhang <sonic.zhang@analog.com>
-
-[Gustavo: update for 1.6.22]
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-[Julien: update for 1.6.25]
-Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
-
-[Bernd: update for 1.6.29]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile.am | 2 +-
- Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 3430dca..db6a7a2 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -245,7 +245,7 @@ contrib/tools/pngfix.o: pnglibconf.h
- # interfering with the symbol file format.
- SYMBOL_CFLAGS = -DPNGLIB_LIBNAME='PNG at PNGLIB_MAJOR@@PNGLIB_MINOR at _0'\
- 		-DPNGLIB_VERSION='@PNGLIB_VERSION@'\
--		-DSYMBOL_PREFIX='$(SYMBOL_PREFIX)'\
-+		-DSYMBOL_PREFIX=''\
- 		-DPNG_NO_USE_READ_MACROS -DPNG_BUILDING_SYMBOL_TABLE
- 
- if DO_PNG_PREFIX
-diff --git a/Makefile.in b/Makefile.in
-index 4e67782..5f468d9 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -766,7 +766,7 @@ SUFFIXES = .chk .out
- # interfering with the symbol file format.
- SYMBOL_CFLAGS = -DPNGLIB_LIBNAME='PNG at PNGLIB_MAJOR@@PNGLIB_MINOR at _0' \
- 	-DPNGLIB_VERSION='@PNGLIB_VERSION@' \
--	-DSYMBOL_PREFIX='$(SYMBOL_PREFIX)' -DPNG_NO_USE_READ_MACROS \
-+	-DSYMBOL_PREFIX='' -DPNG_NO_USE_READ_MACROS \
- 	-DPNG_BUILDING_SYMBOL_TABLE $(am__append_9)
- 
- # EXT_LIST is a list of the possibly library directory extensions, this exists
--- 
-2.7.3
-
-- 
2.14.3
