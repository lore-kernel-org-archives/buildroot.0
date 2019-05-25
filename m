From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 May 2019 16:17:26 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/gpsd: add skytraq option
Message-ID: <20190525141726.27814-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

skytraq support has been added in version 3.17 with
https://git.savannah.gnu.org/cgit/gpsd.git/commit/SConstruct?id=1456c9f50e718a394f2b633cf0773f3fd792cdaa

Allow the user to enable/disable it through an option and disable it by
default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gpsd/Config.in | 5 +++++
 package/gpsd/gpsd.mk   | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index e951c0154e..b32e778068 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -222,6 +222,11 @@ config BR2_PACKAGE_GPSD_SIRF
 	help
 	  SiRF binary support
 
+config BR2_PACKAGE_GPSD_SKYTRAQ
+	bool "skytraq"
+	help
+	  Skytraq support
+
 config BR2_PACKAGE_GPSD_SUPERSTAR2
 	bool "SuperStarII"
 	help
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index d2c7612526..29ffbd5cf2 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -144,6 +144,9 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_SIRF),y)
 GPSD_SCONS_OPTS += sirf=no
 endif
+ifneq ($(BR2_PACKAGE_GPSD_SKYTRAQ),y)
+GPSD_SCONS_OPTS += skytraq=no
+endif
 ifneq ($(BR2_PACKAGE_GPSD_SUPERSTAR2),y)
 GPSD_SCONS_OPTS += superstar2=no
 endif
-- 
2.20.1
