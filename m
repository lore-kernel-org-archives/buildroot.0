From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 14:50:08 +0200
Subject: [Buildroot] [git commit branch/next] package/gpsd: add skytraq
 option
Message-ID: <20190526124414.DED8E817AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f7a15cbe59ff21691769fd667425ff08a518d74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

skytraq support has been added in version 3.17 with
https://git.savannah.gnu.org/cgit/gpsd.git/commit/SConstruct?id=1456c9f50e718a394f2b633cf0773f3fd792cdaa

Allow the user to enable/disable it through an option and disable it
by default.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/Config.in | 5 +++++
 package/gpsd/gpsd.mk   | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index e951c0154e..c1bebc30d7 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -222,6 +222,11 @@ config BR2_PACKAGE_GPSD_SIRF
 	help
 	  SiRF binary support
 
+config BR2_PACKAGE_GPSD_SKYTRAQ
+	bool "Skytraq"
+	help
+	  Skytraq support
+
 config BR2_PACKAGE_GPSD_SUPERSTAR2
 	bool "SuperStarII"
 	help
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 0a17ddc93e..6fe3d7388b 100644
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
