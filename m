From: Cam Hutchison <camh@xdna.net>
Date: Sat, 12 Aug 2017 22:35:02 +1000
Subject: [Buildroot] [PATCH 1/4] skeleton: Rename skeleton-none to
	skeleton-init-none
In-Reply-To: <20170812123505.14714-1-camh@xdna.net>
References: <20170812123505.14714-1-camh@xdna.net>
Message-ID: <20170812123505.14714-2-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The skeletons are based on the selection of BR2_INIT_*, so add init- to
the package name to make this clearer. The name skeleton-none implies no
skeleton at all, not a base skeleton with no init-specific files.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 package/Config.in                                              |  2 +-
 package/{skeleton-none => skeleton-init-none}/Config.in        |  4 ++--
 package/{skeleton-none => skeleton-init-none}/skeleton-none.mk | 10 +++++-----
 system/Config.in                                               |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename package/{skeleton-none => skeleton-init-none}/Config.in (52%)
 rename package/{skeleton-none => skeleton-init-none}/skeleton-none.mk (67%)

diff --git a/package/Config.in b/package/Config.in
index b5170b044c..b48eac65ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -4,7 +4,7 @@ menu "Target packages"
 	source "package/skeleton/Config.in"
 	source "package/skeleton-common/Config.in"
 	source "package/skeleton-custom/Config.in"
-	source "package/skeleton-none/Config.in"
+	source "package/skeleton-init-none/Config.in"
 	source "package/skeleton-systemd/Config.in"
 	source "package/skeleton-sysv/Config.in"
 
diff --git a/package/skeleton-none/Config.in b/package/skeleton-init-none/Config.in
similarity index 52%
rename from package/skeleton-none/Config.in
rename to package/skeleton-init-none/Config.in
index 43fb3f277c..426954ca4c 100644
--- a/package/skeleton-none/Config.in
+++ b/package/skeleton-init-none/Config.in
@@ -1,7 +1,7 @@
-config BR2_PACKAGE_SKELETON_NONE
+config BR2_PACKAGE_SKELETON_INIT_NONE
 	bool
 	select BR2_PACKAGE_HAS_SKELETON
 	select BR2_PACKAGE_SKELETON_COMMON
 
 config BR2_PACKAGE_PROVIDES_SKELETON
-	default "skeleton-none" if BR2_PACKAGE_SKELETON_NONE
+	default "skeleton-init-none" if BR2_PACKAGE_SKELETON_INIT_NONE
diff --git a/package/skeleton-none/skeleton-none.mk b/package/skeleton-init-none/skeleton-none.mk
similarity index 67%
rename from package/skeleton-none/skeleton-none.mk
rename to package/skeleton-init-none/skeleton-none.mk
index 9e9579866a..04e38c98d9 100644
--- a/package/skeleton-none/skeleton-none.mk
+++ b/package/skeleton-init-none/skeleton-none.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# skeleton-none
+# skeleton-init-none
 #
 ################################################################################
 
@@ -8,11 +8,11 @@
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
 # on skeleton.
-SKELETON_NONE_ADD_TOOLCHAIN_DEPENDENCY = NO
-SKELETON_NONE_ADD_SKELETON_DEPENDENCY = NO
+SKELETON_INIT_NONE_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_INIT_NONE_ADD_SKELETON_DEPENDENCY = NO
 
-SKELETON_NONE_DEPENDENCIES = skeleton-common
+SKELETON_INIT_NONE_DEPENDENCIES = skeleton-common
 
-SKELETON_NONE_PROVIDES = skeleton
+SKELETON_INIT_NONE_PROVIDES = skeleton
 
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 59d8eab271..45326f0985 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -12,7 +12,7 @@ config BR2_ROOTFS_SKELETON_DEFAULT
 	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
 	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
 	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD
-	select BR2_PACKAGE_SKELETON_NONE if BR2_INIT_NONE
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_INIT_NONE
 	help
 	  Use default target skeleton
 
-- 
2.11.0
