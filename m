From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 22:01:58 +0200
Subject: [Buildroot] [PATCH 1/1] libgeotiff: bump to version 1.4.2
Message-ID: <20180430200158.8259-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add patch to fix autoheader issue: "missing template:
  GEO_NORMALIZE_DISABLE_TOWGS84"
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...02-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch | 20 ++++++++++++++++++++
 package/libgeotiff/libgeotiff.hash                   |  3 ++-
 package/libgeotiff/libgeotiff.mk                     |  2 +-
 3 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 package/libgeotiff/0002-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch

diff --git a/package/libgeotiff/0002-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch b/package/libgeotiff/0002-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch
new file mode 100644
index 0000000000..a8a2d257cb
--- /dev/null
+++ b/package/libgeotiff/0002-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch
@@ -0,0 +1,20 @@
+Fix GEO_NORMALIZE_DISABLE_TOWGS84 definition
+
+Fix "missing template: GEO_NORMALIZE_DISABLE_TOWGS84" error by adding
+a non-empty description of GEO_NORMALIZE_DISABLE_TOWGS84 in AC_DEFINE
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Index: libgeotiff/configure.ac
+===================================================================
+--- libgeotiff/configure.ac	(r??vision 2818)
++++ libgeotiff/configure.ac	(copie de travail)
+@@ -317,7 +317,7 @@
+ AM_CONDITIONAL([CSV_IS_CONFIG], [test ! x$CSV_CONFIG = xno])
+ 
+ 
+-AC_ARG_ENABLE(towgs84, [  --disable-towgs84       Disable WGS84 parameters for binary compatibility with pre-1.4.1], AC_DEFINE(GEO_NORMALIZE_DISABLE_TOWGS84))
++AC_ARG_ENABLE(towgs84, [  --disable-towgs84       Disable WGS84 parameters for binary compatibility with pre-1.4.1], AC_DEFINE(GEO_NORMALIZE_DISABLE_TOWGS84, [], [Disable WGS84 parameters]))
+ 
+ dnl #########################################################################
+ dnl Doxygen settings
diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index 66b8cb74b2..a2b16ac0b2 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha1 4c6f405869826bb7d9f35f1d69167e3b44a57ef0 libgeotiff-1.4.0.tar.gz
+sha256 ad87048adb91167b07f34974a8e53e4ec356494c29f1748de95252e8f81a5e6e libgeotiff-1.4.2.tar.gz
+sha256 16b83cf7c3bbfd20bffa768b9bfdb16506ca50f5c140a9f3431e740b155359c1 LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 96f04c2e09..a1f234b33b 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.4.0
+LIBGEOTIFF_VERSION = 1.4.2
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_LICENSE = X11-style, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
-- 
2.14.1
