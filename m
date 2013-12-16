From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 22:53:44 +0100
Subject: [Buildroot] [git commit] ti-uim: Add new package
Message-ID: <20131216215411.7EAEA9C0AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07a4accf5d743b5274108de8dfc32f58af077b43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: wrap help text, use full git hash, fix file header, drop license file]
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/ti-uim/Config.in |    8 ++++++++
 package/ti-uim/ti-uim.mk |   20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 78a9e16..3685807 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -330,6 +330,7 @@ source "package/sunxi-mali/Config.in"
 source "package/sunxi-mali-prop/Config.in"
 source "package/sysstat/Config.in"
 source "package/ti-gfx/Config.in"
+source "package/ti-uim/Config.in"
 source "package/ti-utils/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
diff --git a/package/ti-uim/Config.in b/package/ti-uim/Config.in
new file mode 100644
index 0000000..451aad1
--- /dev/null
+++ b/package/ti-uim/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TI_UIM
+	bool "ti-uim"
+	help
+	  User Mode Initialization Manager for TI wl12xx connectivity
+	  chip shared transport drivers. This daemon is needed to get
+	  the btwilink driver to work.
+
+	  http://omappedia.org/wiki/Device_Driver_Interface_of_WiLink_Solution
diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
new file mode 100644
index 0000000..b498180
--- /dev/null
+++ b/package/ti-uim/ti-uim.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# ti-uim
+#
+################################################################################
+
+TI_UIM_VERSION = c73894456df5def97111cb33d2106b684b8b7959
+TI_UIM_SITE = git://gitorious.org/uim/uim.git
+TI_UIM_LICENSE = GPLv2+
+
+define TI_UIM_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define TI_UIM_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/uim \
+		$(TARGET_DIR)/usr/sbin/uim
+endef
+
+$(eval $(generic-package))
