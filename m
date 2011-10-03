From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon,  3 Oct 2011 12:10:31 +0200
Subject: [Buildroot] [PATCH 1/4] Add the picocom package
In-Reply-To: <cover.1317636624.git.maxime.ripard@free-electrons.com>
References: <cover.1317636624.git.maxime.ripard@free-electrons.com>
Message-ID: <b1bcdc61348588f371f00063e571c4d78cd8f4ae.1317636624.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime@free-electrons.com>

Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
---
 package/Config.in          |    1 +
 package/picocom/Config.in  |    9 +++++++++
 package/picocom/picocom.mk |   19 +++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
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
index 0000000..11c7d7a
--- /dev/null
+++ b/package/picocom/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PICOCOM
+	bool "picocom"
+	help
+	   picocom is a minimal dumb-terminal emulation program. It
+	   is, in principle, very much like minicom, only it's pico
+	   instead of mini!
+
+	   http://code.google.com/p/picocom/
+
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
new file mode 100644
index 0000000..b797381
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
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define PICOCOM_INSTALL_TARGET_CMDS
+	install -D -m 0755 $(@D)/picocom $(TARGET_DIR)/usr/bin/picocom
+endef
+
+$(eval $(call GENTARGETS,package,picocom))
+
-- 
1.7.4.1
