From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 16:44:18 -0500
Subject: [Buildroot] [PATCH v6 1/3] powervr: add powervr virtual package
In-Reply-To: <1373924660-1391-1-git-send-email-spenser@gillilanding.com>
References: <1373924660-1391-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373924660-1391-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sundareson, Prabindh <prabu@ti.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Sinan Akpolat <sinan@linkas.com.tr>
---
 package/Config.in          |  1 +
 package/powervr/Config.in  |  2 ++
 package/powervr/powervr.mk | 20 ++++++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/powervr/Config.in
 create mode 100644 package/powervr/powervr.mk

diff --git a/package/Config.in b/package/Config.in
index 6d5ff01..d2ad489 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -472,6 +472,7 @@ source "package/opengl/Config.in"
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
index 0000000..c6dd968
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
-- 
1.8.1.2
