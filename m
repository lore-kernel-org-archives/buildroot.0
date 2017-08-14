From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 21:52:43 +0200
Subject: [Buildroot] [git commit] skeleton: Rename skeleton-none to
	skeleton-init-none
Message-ID: <20170814194941.0E49881F88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4a8ba8c8be2a471a2bb9d42961f90438b1056b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The skeletons are based on the selection of BR2_INIT_*, so add init- to
the package name to make this clearer. The name skeleton-none implies no
skeleton at all, not a base skeleton with no init-specific files.

Signed-off-by: Cam Hutchison <camh@xdna.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                              |  2 +-
 package/{skeleton-none => skeleton-init-none}/Config.in        |  4 ++--
 .../skeleton-init-none.mk}                                     | 10 +++++-----
 system/Config.in                                               |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b5170b0..b48eac6 100644
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
index 43fb3f2..426954c 100644
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
diff --git a/package/skeleton-none/skeleton-none.mk b/package/skeleton-init-none/skeleton-init-none.mk
similarity index 67%
rename from package/skeleton-none/skeleton-none.mk
rename to package/skeleton-init-none/skeleton-init-none.mk
index 9e95798..04e38c9 100644
--- a/package/skeleton-none/skeleton-none.mk
+++ b/package/skeleton-init-none/skeleton-init-none.mk
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
index 59d8eab..45326f0 100644
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
 
