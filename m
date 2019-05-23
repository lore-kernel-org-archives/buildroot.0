From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 23 May 2019 20:21:34 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/tcl: bump to version 8.6.9
Message-ID: <20190523182134.10860-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update first patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcl/0001-dont-build-compat.patch | 11 ++---------
 package/tcl/tcl.hash                     |  2 +-
 package/tcl/tcl.mk                       |  2 +-
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/tcl/0001-dont-build-compat.patch b/package/tcl/0001-dont-build-compat.patch
index 85c5c57df4..c0d5d85da7 100644
--- a/package/tcl/0001-dont-build-compat.patch
+++ b/package/tcl/0001-dont-build-compat.patch
@@ -7,20 +7,13 @@ anything buildroot is using as a standard C library will be good enough
 to not have broken behavior.
 
 Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
+[Fabrice: Update for 8.6.9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
 
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
-@@ -2466,7 +2466,7 @@ AC_DEFUN([SC_BUGGY_STRTOD], [
- 		    }
- 		    exit(0);
- 		}], tcl_cv_strtod_buggy=ok, tcl_cv_strtod_buggy=buggy,
--		    tcl_cv_strtod_buggy=buggy)])
-+		    tcl_cv_strtod_buggy=ok)])
- 	if test "$tcl_cv_strtod_buggy" = buggy; then
- 	    AC_LIBOBJ([fixstrtod])
- 	    USE_COMPAT=1
 @@ -2725,7 +2725,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
      if test ["$tcl_ok"] = 1; then
  	AC_CACHE_CHECK([proper ]$1[ implementation], [tcl_cv_]$1[_unbroken],
diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index 359b5433c2..913190b95c 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a265409781e4b3edcc4ef822533071b34c3dc6790b893963809b9fe221befe07  tcl8.6.6-src.tar.gz
+sha256 ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d5f53ccbba3feb915f4e  tcl8.6.9-src.tar.gz
 sha256 c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index b9fb7afbc6..6d750b3cd2 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).6
+TCL_VERSION = $(TCL_VERSION_MAJOR).9
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
-- 
2.20.1
