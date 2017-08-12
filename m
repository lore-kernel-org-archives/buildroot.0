From: Cam Hutchison <camh@xdna.net>
Date: Sat, 12 Aug 2017 22:35:04 +1000
Subject: [Buildroot] [PATCH 3/4] skeleton: Rename skeleton-sysv to
	skeleton-init-sysv
In-Reply-To: <20170812123505.14714-1-camh@xdna.net>
References: <20170812123505.14714-1-camh@xdna.net>
Message-ID: <20170812123505.14714-4-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The skeletons are based on the selection of BR2_INIT_*, so add init- to
the package name to make this clearer. While skeleton-sysv is relatively
clear, skeleton-common and skeleton-none are less clear on their
relationship to BR2_INIT_*. So rename skeleton-sysv to conform to a
clearer pattern.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 package/Config.in                                          |  2 +-
 package/{skeleton-sysv => skeleton-init-sysv}/Config.in    |  4 ++--
 .../skeleton-init-sysv.mk}                                 | 14 +++++++-------
 .../{skeleton-sysv => skeleton-init-sysv}/skeleton/dev/log |  0
 .../skeleton/dev/pts/.empty                                |  0
 .../skeleton/dev/shm/.empty                                |  0
 .../skeleton/etc/fstab                                     |  0
 .../skeleton/var/cache                                     |  0
 .../skeleton/var/lib/misc                                  |  0
 .../skeleton/var/lock                                      |  0
 .../{skeleton-sysv => skeleton-init-sysv}/skeleton/var/log |  0
 .../{skeleton-sysv => skeleton-init-sysv}/skeleton/var/run |  0
 .../skeleton/var/spool                                     |  0
 .../{skeleton-sysv => skeleton-init-sysv}/skeleton/var/tmp |  0
 system/Config.in                                           |  4 ++--
 15 files changed, 12 insertions(+), 12 deletions(-)
 rename package/{skeleton-sysv => skeleton-init-sysv}/Config.in (52%)
 rename package/{skeleton-sysv/skeleton-sysv.mk => skeleton-init-sysv/skeleton-init-sysv.mk} (57%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/dev/log (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/dev/pts/.empty (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/dev/shm/.empty (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/etc/fstab (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/cache (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/lib/misc (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/lock (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/log (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/run (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/spool (100%)
 rename package/{skeleton-sysv => skeleton-init-sysv}/skeleton/var/tmp (100%)

diff --git a/package/Config.in b/package/Config.in
index 4bdfeeaedd..ed2a472cef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -6,7 +6,7 @@ menu "Target packages"
 	source "package/skeleton-custom/Config.in"
 	source "package/skeleton-init-none/Config.in"
 	source "package/skeleton-init-systemd/Config.in"
-	source "package/skeleton-sysv/Config.in"
+	source "package/skeleton-init-sysv/Config.in"
 
 menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
diff --git a/package/skeleton-sysv/Config.in b/package/skeleton-init-sysv/Config.in
similarity index 52%
rename from package/skeleton-sysv/Config.in
rename to package/skeleton-init-sysv/Config.in
index 2f6dbd9673..60000e0e92 100644
--- a/package/skeleton-sysv/Config.in
+++ b/package/skeleton-init-sysv/Config.in
@@ -1,7 +1,7 @@
-config BR2_PACKAGE_SKELETON_SYSV
+config BR2_PACKAGE_SKELETON_INIT_SYSV
 	bool
 	select BR2_PACKAGE_HAS_SKELETON
 	select BR2_PACKAGE_SKELETON_COMMON
 
 config BR2_PACKAGE_PROVIDES_SKELETON
-	default "skeleton-sysv" if BR2_PACKAGE_SKELETON_SYSV
+	default "skeleton-init-sysv" if BR2_PACKAGE_SKELETON_INIT_SYSV
diff --git a/package/skeleton-sysv/skeleton-sysv.mk b/package/skeleton-init-sysv/skeleton-init-sysv.mk
similarity index 57%
rename from package/skeleton-sysv/skeleton-sysv.mk
rename to package/skeleton-init-sysv/skeleton-init-sysv.mk
index b5fa396ac2..dcff2b8edf 100644
--- a/package/skeleton-sysv/skeleton-sysv.mk
+++ b/package/skeleton-init-sysv/skeleton-init-sysv.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# skeleton-sysv
+# skeleton-init-sysv
 #
 ################################################################################
 
@@ -8,15 +8,15 @@
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
 # on skeleton.
-SKELETON_SYSV_ADD_TOOLCHAIN_DEPENDENCY = NO
-SKELETON_SYSV_ADD_SKELETON_DEPENDENCY = NO
+SKELETON_INIT_SYSV_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_INIT_SYSV_ADD_SKELETON_DEPENDENCY = NO
 
-SKELETON_SYSV_DEPENDENCIES = skeleton-common
+SKELETON_INIT_SYSV_DEPENDENCIES = skeleton-common
 
-SKELETON_SYSV_PROVIDES = skeleton
+SKELETON_INIT_SYSV_PROVIDES = skeleton
 
-define SKELETON_SYSV_INSTALL_TARGET_CMDS
-	$(call SYSTEM_RSYNC,$(SKELETON_SYSV_PKGDIR)/skeleton,$(TARGET_DIR))
+define SKELETON_INIT_SYSV_INSTALL_TARGET_CMDS
+	$(call SYSTEM_RSYNC,$(SKELETON_INIT_SYSV_PKGDIR)/skeleton,$(TARGET_DIR))
 endef
 
 $(eval $(generic-package))
diff --git a/package/skeleton-sysv/skeleton/dev/log b/package/skeleton-init-sysv/skeleton/dev/log
similarity index 100%
rename from package/skeleton-sysv/skeleton/dev/log
rename to package/skeleton-init-sysv/skeleton/dev/log
diff --git a/package/skeleton-sysv/skeleton/dev/pts/.empty b/package/skeleton-init-sysv/skeleton/dev/pts/.empty
similarity index 100%
rename from package/skeleton-sysv/skeleton/dev/pts/.empty
rename to package/skeleton-init-sysv/skeleton/dev/pts/.empty
diff --git a/package/skeleton-sysv/skeleton/dev/shm/.empty b/package/skeleton-init-sysv/skeleton/dev/shm/.empty
similarity index 100%
rename from package/skeleton-sysv/skeleton/dev/shm/.empty
rename to package/skeleton-init-sysv/skeleton/dev/shm/.empty
diff --git a/package/skeleton-sysv/skeleton/etc/fstab b/package/skeleton-init-sysv/skeleton/etc/fstab
similarity index 100%
rename from package/skeleton-sysv/skeleton/etc/fstab
rename to package/skeleton-init-sysv/skeleton/etc/fstab
diff --git a/package/skeleton-sysv/skeleton/var/cache b/package/skeleton-init-sysv/skeleton/var/cache
similarity index 100%
rename from package/skeleton-sysv/skeleton/var/cache
rename to package/skeleton-init-sysv/skeleton/var/cache
diff --git a/package/skeleton-sysv/skeleton/var/lib/misc b/package/skeleton-init-sysv/skeleton/var/lib/misc
similarity index 100%
rename from package/skeleton-sysv/skeleton/var/lib/misc
rename to package/skeleton-init-sysv/skeleton/var/lib/misc
diff --git a/package/skeleton-sysv/skeleton/var/lock b/package/skeleton-init-sysv/skeleton/var/lock
similarity index 100%
rename from package/skeleton-sysv/skeleton/var/lock
rename to package/skeleton-init-sysv/skeleton/var/lock
diff --git a/package/skeleton-sysv/skeleton/var/log b/package/skeleton-init-sysv/skeleton/var/log
similarity index 100%
rename from package/skeleton-sysv/skeleton/var/log
rename to package/skeleton-init-sysv/skeleton/var/log
diff --git a/package/skeleton-sysv/skeleton/var/run b/package/skeleton-init-sysv/skeleton/var/run
similarity index 100%
rename from package/skeleton-sysv/skeleton/var/run
rename to package/skeleton-init-sysv/skeleton/var/run
diff --git a/package/skeleton-sysv/skeleton/var/spool b/package/skeleton-init-sysv/skeleton/var/spool
similarity index 100%
rename from package/skeleton-sysv/skeleton/var/spool
rename to package/skeleton-init-sysv/skeleton/var/spool
diff --git a/package/skeleton-sysv/skeleton/var/tmp b/package/skeleton-init-sysv/skeleton/var/tmp
similarity index 100%
rename from package/skeleton-sysv/skeleton/var/tmp
rename to package/skeleton-init-sysv/skeleton/var/tmp
diff --git a/system/Config.in b/system/Config.in
index cbde411895..b9714923c4 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -9,8 +9,8 @@ choice
 
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
-	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
-	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
+	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_SYSV
+	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_BUSYBOX
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_INIT_NONE
 	help
-- 
2.11.0
