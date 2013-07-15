From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jul 2013 00:06:29 +0200
Subject: [Buildroot] [git commit] powervr: add powervr virtual package
Message-ID: <20130715223349.87FF69A3F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61900d9245806ce1387fac730a5fd926bf032443
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sundareson, Prabindh <prabu@ti.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Sinan Akpolat <sinan@linkas.com.tr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/powervr/Config.in  |    2 ++
 package/powervr/powervr.mk |   20 ++++++++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index aac31bf..0ecd270 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -473,6 +473,7 @@ source "package/opengl/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
 source "package/poppler/Config.in"
+source "package/powervr/Config.in"
 source "package/tiff/Config.in"
 source "package/wayland/Config.in"
 source "package/webkit/Config.in"
diff --git a/package/powervr/Config.in b/package/powervr/Config.in
new file mode 100644
index 0000000..d09ce74
--- /dev/null
+++ b/package/powervr/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HAS_POWERVR
+	bool
diff --git a/package/powervr/powervr.mk b/package/powervr/powervr.mk
new file mode 100644
index 0000000..b63b0e6
--- /dev/null
+++ b/package/powervr/powervr.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# Virtual package for PowerVR driver
+#
+################################################################################
+
+POWERVR_SOURCE =
+
+ifeq ($(BR2_PACKAGE_TI_GFX),y)
+POWERVR_DEPENDENCIES += ti-gfx
+endif
+
+ifeq ($(POWERVR_DEPENDENCIES),)
+define POWERVR_CONFIGURE_CMDS
+	echo "No PowerVR implementation selected. Configuration error."
+	exit 1
+endef
+endif
+
+$(eval $(generic-package))
