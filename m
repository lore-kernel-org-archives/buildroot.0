From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 23 Nov 2013 11:35:25 +0000
Subject: [Buildroot] [PATCH] gpsd: bump version to 3.10
Message-ID: <1385206525-26557-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gpsd/gpsd-02-sconstruct-disable-rpath.patch | 15 +++++++--------
 package/gpsd/gpsd.mk                                |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
index 5476450..eca3cbf 100644
--- a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
+++ b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
@@ -2,14 +2,13 @@ Disable addition of RPATH to the generated libraries
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: b/SConstruct
-===================================================================
---- a/SConstruct
-+++ b/SConstruct
-@@ -273,8 +273,6 @@
-     env.Prepend(LIBPATH=[installdir('libdir')])
- else:
-     env.Prepend(LIBPATH=[env["sysroot"] + installdir('libdir')])
+diff -Nurp a/SConstruct b/SConstruct
+--- a/SConstruct	2013-11-22 13:10:01.000000000 +0000
++++ b/SConstruct	2013-11-23 11:26:57.698486777 +0000
+@@ -287,8 +287,6 @@ def installdir(dir, add_destdir=True):
+ # Honor the specified installation prefix in link paths.
+ if env["sysroot"]:
+     env.Prepend(LIBPATH=[env["sysroot"] + installdir('libdir', add_destdir=False)])
 -if env["shared"]:
 -    env.Prepend(RPATH=[installdir('libdir')])
  
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index be2e681..92db00e 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.9
+GPSD_VERSION = 3.10
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd/
 GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING
-- 
1.8.3.2
