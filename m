From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 21:45:35 +0200
Subject: [Buildroot] [git commit] Add the picocom package
Message-ID: <20111005202141.05E698E226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08540f43b63abccfc243834c637a5624ef69952f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix Config.in help text indentation]
Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/picocom/Config.in  |    8 ++++++++
 package/picocom/picocom.mk |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8b9c816..7dfcc55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -193,6 +193,7 @@ source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
 source "package/openocd/Config.in"
 source "package/pciutils/Config.in"
+source "package/picocom/Config.in"
 source "package/rng-tools/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
diff --git a/package/picocom/Config.in b/package/picocom/Config.in
new file mode 100644
index 0000000..bd584e2
--- /dev/null
+++ b/package/picocom/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PICOCOM
+	bool "picocom"
+	help
+	  picocom is a minimal dumb-terminal emulation program. It
+	  is, in principle, very much like minicom, only it's pico
+	  instead of mini!
+
+	  http://code.google.com/p/picocom/
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
new file mode 100644
index 0000000..fa02594
--- /dev/null
+++ b/package/picocom/picocom.mk
@@ -0,0 +1,18 @@
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
