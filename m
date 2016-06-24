From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 12:38:45 -0400
Subject: [Buildroot] [PATCH 1/1] libsemanage: bump version to 2.5
Message-ID: <1466786328-7860-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001-execption-lib-path-fix.patch is no longer needed. The newer version of
libsemanage contains the fixes in that patch by default.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsemanage/0001-execption-lib-path-fix.patch      | 14 --------------
 ...in-issue.patch => 0001-workaround-blackfin-issue.patch} |  4 ++--
 package/libsemanage/libsemanage.hash                       |  2 +-
 package/libsemanage/libsemanage.mk                         |  4 ++--
 4 files changed, 5 insertions(+), 19 deletions(-)
 delete mode 100644 package/libsemanage/0001-execption-lib-path-fix.patch
 rename package/libsemanage/{0002-workaround-blackfin-issue.patch => 0001-workaround-blackfin-issue.patch} (94%)

diff --git a/package/libsemanage/0001-execption-lib-path-fix.patch b/package/libsemanage/0001-execption-lib-path-fix.patch
deleted file mode 100644
index cbcbea5..0000000
--- a/package/libsemanage/0001-execption-lib-path-fix.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Patch to correct a missing header file issue.
-
-Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>
-
---- a/src/exception.sh	2011-12-21 11:46:04.000000000 -0600
-+++ b/src/exception.sh	2012-08-27 11:29:58.000000000 -0500
-@@ -9,6 +9,6 @@
- }
- "
- }
--gcc -x c -c - -aux-info temp.aux < ../include/semanage/semanage.h
-+gcc -x c -c - -aux-info temp.aux -I../include < ../include/semanage/semanage.h
- for i in `awk '/extern int/ { print $6 }' temp.aux`; do except $i ; done
- rm -f -- temp.aux -.o
diff --git a/package/libsemanage/0002-workaround-blackfin-issue.patch b/package/libsemanage/0001-workaround-blackfin-issue.patch
similarity index 94%
rename from package/libsemanage/0002-workaround-blackfin-issue.patch
rename to package/libsemanage/0001-workaround-blackfin-issue.patch
index 5d00c69..af28a63 100644
--- a/package/libsemanage/0002-workaround-blackfin-issue.patch
+++ b/package/libsemanage/0001-workaround-blackfin-issue.patch
@@ -14,8 +14,8 @@ Index: b/src/dso.h
 --- a/src/dso.h
 +++ b/src/dso.h
 @@ -1,7 +1,7 @@
- #ifndef _SELINUX_DSO_H
- #define _SELINUX_DSO_H	1
+ #ifndef _SEPOL_DSO_H
+ #define _SEPOL_DSO_H	1
  
 -#ifdef SHARED
 +#if defined(SHARED) && !defined(__bfin__)
diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index d4204d1..69f7c8d 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 de2e8077245581e94576276f54e80a53c23c28d6961d2dfbe2f004eaba452e91 libsemanage-2.1.10.tar.gz
+sha256 46e2f36254369b6e91d1eea0460c262b139361b055a3a67d3ceea2d8ef72e006 libsemanage-2.5.tar.gz
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 197c14e..35bbdcf 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.1.10
-LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+LIBSEMANAGE_VERSION = 2.5
+LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
 LIBSEMANAGE_LICENSE = LGPLv2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex libselinux ustr bzip2
-- 
2.7.4
