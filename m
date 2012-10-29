From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Mon, 29 Oct 2012 09:41:12 +0100
Subject: [Buildroot] [PATCH 5/6] Add init script files for snowball board
In-Reply-To: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1351500073-4351-6-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in                      |    1 +
 package/snowball-init/Config.in        |    7 +++++++
 package/snowball-init/snowball-init.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/snowball-init/Config.in
 create mode 100644 package/snowball-init/snowball-init.mk

diff --git a/package/Config.in b/package/Config.in
index fd5281f..bfe1d3b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -533,6 +533,7 @@ source "package/hdmiservice/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/snowball-firmware/Config.in"
+source "package/snowball-init/Config.in"
 source "package/sound-theme-borealis/Config.in"
 source "package/sound-theme-freedesktop/Config.in"
 endmenu
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
new file mode 100644
index 0000000..f3cefbd
--- /dev/null
+++ b/package/snowball-init/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SNOWBALL_INIT
+	bool "snowball-init"
+	help
+	  Snowball init scripts
+
+	  http://www.igloocommunity.org/gitweb/?p=bsp/snowball-init.git
+
diff --git a/package/snowball-init/snowball-init.mk b/package/snowball-init/snowball-init.mk
new file mode 100644
index 0000000..03c1cf5
--- /dev/null
+++ b/package/snowball-init/snowball-init.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# snowball-init
+#
+#############################################################
+SNOWBALL_INIT_VERSION = b064be21de25729039e5e54037bbdd2e25cfd5b7
+SNOWBALL_INIT_SITE = git://igloocommunity.org/git/bsp/snowball-init.git
+
+define SNOWBALL_INIT_INSTALL_TARGET_CMDS
+	cp $(@D)/snowball $(TARGET_DIR)/etc/init.d/S50snowball
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
