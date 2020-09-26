From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 26 Sep 2020 21:53:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/ipmiutil: bump to version 3.1.7
Message-ID: <20200926195335.771505-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (not needed since
  https://github.com/arcress0/ipmiutil/commit/32b6e5634d773150338b60585e9c258cd575e3d9)
- Drop autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmiutil/0001-no-build-doc.patch | 31 ------------------------
 package/ipmiutil/ipmiutil.hash           |  8 +++---
 package/ipmiutil/ipmiutil.mk             |  4 +--
 3 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 package/ipmiutil/0001-no-build-doc.patch

diff --git a/package/ipmiutil/0001-no-build-doc.patch b/package/ipmiutil/0001-no-build-doc.patch
deleted file mode 100644
index ea7da97249..0000000000
--- a/package/ipmiutil/0001-no-build-doc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-configure: do not build doc
-
-Fixes:
-    http://autobuild.buildroot.org/results/2ec/2ecfb1143ba89ffa5cdc8096bb175b2c396c4670/
-    http://autobuild.buildroot.org/results/c49/c497fc446140694084922d51fe6be308ce5c1c1a/
-    http://autobuild.buildroot.org/results/434/434b156b5c9b5c7b65ffe6174cf4e029e7e3ffd8/
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/configure.ac b/configure.ac
-index 344b27a71a35..41b6ea89167a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -56,7 +56,7 @@ LIB_DIR="/usr/lib"
- isredhat=0
- init_scripts="scripts/ipmi_port.sh scripts/ipmiutil_evt scripts/ipmiutil_asy scripts/ipmiutil_wdt"
- projdir=`pwd`
--SUBDIR_S="doc scripts lib util"
-+SUBDIR_S="scripts lib util"
- os=Linux
- 
- # ltmain.sh, config.sub, et al should have been created, but check to be sure.
-@@ -162,7 +162,7 @@ AC_ARG_ENABLE([standalone],
- 	LANPLUS_SAM="no"
- 	LD_SAMX=""
- 	CFLAGS="-O2"
--        SUBDIR_S="doc scripts util"
-+        SUBDIR_S="scripts util"
- 	if test "x$cross_compiling" = "xyes"; then
- 	   # cross-compiling, so link with -static (e.g. Android ARM)
- 	   CROSS_LFLAGS="-static"
diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index 3f89b9049c..f87c2762de 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ipmiutil/files/
-md5 0d448d14726e2fda0eb9451fb2866a5c  ipmiutil-3.1.3.tar.gz
-sha1 d20cb3194f4c5cb8c9fd64b3693d5b53dc9510d4  ipmiutil-3.1.3.tar.gz
+md5  fab260bc834a0f3f9324a6365fc26eca  ipmiutil-3.1.7.tar.gz
+sha1  a0cd29820b15166120eb4a51e6239bfa6f9c65dd  ipmiutil-3.1.7.tar.gz
 # Locally computed
-sha256 b80303b6f05cbe48e728dd925fef201e9604a90cd3fc9c8af113367e8d6dbe57  ipmiutil-3.1.3.tar.gz
-sha256 7e0ec8238aa1431e95a4950032a4483fe33fec3fac348eaade5856cdc5ae3e39  COPYING
+sha256  911fd6f8b33651b98863d57e678d2fc593bc43fcd2a21f5dc7d5db8f92128a9a  ipmiutil-3.1.7.tar.gz
+sha256  7e0ec8238aa1431e95a4950032a4483fe33fec3fac348eaade5856cdc5ae3e39  COPYING
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 9633914e11..d85b9643f0 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 3.1.3
+IPMIUTIL_VERSION = 3.1.7
 IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
-# We're patching configure.ac
-IPMIUTIL_AUTORECONF = YES
 
 IPMIUTIL_MAKE = $(MAKE1)
 
-- 
2.28.0
