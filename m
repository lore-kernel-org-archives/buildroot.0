From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 May 2017 21:14:29 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/stella: bump version to 4.7.3
In-Reply-To: <20170529191429.11102-1-bernd.kuhls@t-online.de>
References: <20170529191429.11102-1-bernd.kuhls@t-online.de>
Message-ID: <20170529191429.11102-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/stella-emu/stella/commit/be2f6f5b64266f4d68af6a2236bd4b59a7e6638d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...gnu-11-standard-to-prevent-errors-on-PPC.patch} |  0
 ...figure-Add-CXXFLAGS-for-test-compilations.patch | 44 ----------------------
 package/stella/stella.hash                         |  2 +-
 package/stella/stella.mk                           |  2 +-
 4 files changed, 2 insertions(+), 46 deletions(-)
 rename package/stella/{0004-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch => 0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch} (100%)
 delete mode 100644 package/stella/0003-configure-Add-CXXFLAGS-for-test-compilations.patch

diff --git a/package/stella/0004-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch b/package/stella/0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch
similarity index 100%
rename from package/stella/0004-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch
rename to package/stella/0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch
diff --git a/package/stella/0003-configure-Add-CXXFLAGS-for-test-compilations.patch b/package/stella/0003-configure-Add-CXXFLAGS-for-test-compilations.patch
deleted file mode 100644
index c548d0825..000000000
--- a/package/stella/0003-configure-Add-CXXFLAGS-for-test-compilations.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 28f0c20302e5c64712899848cae3d0a48a9dc952 Mon Sep 17 00:00:00 2001
-From: Vlad Zakharov <vzakhar@synopsys.com>
-Date: Wed, 10 Aug 2016 18:02:59 +0300
-Subject: [PATCH] configure: Add $CXXFLAGS for test compilations
-
-Why we are passing only linker flags when compiling test code?
-Loosing compiler flags leads to errors.
-
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
----
- configure | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index 0d90a4f..618fe78 100755
---- a/configure
-+++ b/configure
-@@ -63,9 +63,9 @@ cc_check() {
- 	echo >> "$TMPLOG"
- 	cat "$TMPC" >> "$TMPLOG"
- 	echo >> "$TMPLOG"
--	echo "$CXX $TMPC $LDFLAGS -o $TMPO$EXEEXT $@" >> "$TMPLOG"
-+	echo "$CXX $TMPC $CXXFLAGS $LDFLAGS -o $TMPO$EXEEXT $@" >> "$TMPLOG"
- 	rm -f "$TMPO$EXEEXT"
--	( $CXX "$TMPC" $LDFLAGS -o "$TMPO$EXEEXT" "$@" ) >> "$TMPLOG" 2>&1
-+	( $CXX "$TMPC" $CXXFLAGS $LDFLAGS -o "$TMPO$EXEEXT" "$@" ) >> "$TMPLOG" 2>&1
- 	TMP="$?"
- 	echo >> "$TMPLOG"
- 	return "$TMP"
-@@ -107,9 +107,9 @@ EOF
- 
- if test -n "$_host"; then
- 	# In cross-compiling mode, we cannot run the result
--	eval "$1 $LDFLAGS -o tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp 2> /dev/null" && rm -f tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp
-+	eval "$1 $CXXFLAGS $LDFLAGS -o tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp 2> /dev/null" && rm -f tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp
- else
--	eval "$1 $LDFLAGS -o tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp 2> /dev/null" && eval "./tmp_cxx_compiler 2> /dev/null" && rm -f tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp
-+	eval "$1 $CXXFLAGS $LDFLAGS -o tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp 2> /dev/null" && eval "./tmp_cxx_compiler 2> /dev/null" && rm -f tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp
- fi
- }
- 
--- 
-2.5.5
-
diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 71defd28d..e6f146fd9 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 b2727a0e2d3b112d35dcb89b4bdc789e2c7f15e9d9c7054a69a2f67facd7416e  stella-4.7.2-src.tar.xz
+sha256 93a75d1b343b1e66b6dc526c0f9d8a0c3678d346033f7cdfe76dc93f14d956ad  stella-4.7.3-src.tar.xz
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index fbf7809a1..e610a9bdf 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 4.7.2
+STELLA_VERSION = 4.7.3
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/release-$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.11.0
