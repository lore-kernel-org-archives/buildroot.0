From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 28 Sep 2011 13:48:31 +0200
Subject: [Buildroot] [PATCH 1/4] Add the picocom package
In-Reply-To: <cover.1317210509.git.maxime.ripard@free-electrons.com>
References: <cover.1317210509.git.maxime.ripard@free-electrons.com>
Message-ID: <a43c69b7a1a524be05e8b42d86404b6f116a6a3e.1317210509.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime@free-electrons.com>

Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
---
 package/Config.in          |    1 +
 package/picocom/Config.in  |    8 ++++++++
 package/picocom/picocom.mk |   19 +++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/picocom/Config.in
 create mode 100644 package/picocom/picocom.mk

diff --git a/package/Config.in b/package/Config.in
index d95e7b5..6065773 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -192,6 +192,7 @@ source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
 source "package/pciutils/Config.in"
+source "package/picocom/Config.in"
 source "package/rng-tools/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
diff --git a/package/picocom/Config.in b/package/picocom/Config.in
new file mode 100644
index 0000000..1f9a40e
--- /dev/null
+++ b/package/picocom/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PICOCOM
+	bool "picocom"
+	help
+	   picocom is a minimal dumb-terminal emulation program. It
+	   is, in principle, very much like minicom, only it's pico
+	   instead of mini!
+
+	   http://code.google.com/p/picocom/
\ No newline at end of file
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
new file mode 100644
index 0000000..e2eb3e4
--- /dev/null
+++ b/package/picocom/picocom.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# picocom
+#
+#############################################################
+
+PICOCOM_VERSION = 1.6
+PICOCOM_SITE    = http://picocom.googlecode.com/files/
+
+define PICOCOM_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D)
+endef
+
+define PICOCOM_INSTALL_TARGET_CMDS
+	install -D -m 0755 $(@D)/picocom $(TARGET_DIR)/usr/bin/picocom
+endef
+
+$(eval $(call GENTARGETS,package,picocom))
\ No newline at end of file
-- 
1.7.4.1
