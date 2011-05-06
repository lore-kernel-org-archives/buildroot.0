From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 May 2011 11:04:45 -0300
Subject: [Buildroot] [PATCH] bridge-utils: bump to version 1.5
Message-ID: <1304690685-19754-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bridge-utils/Config.in |    2 +-
 package/bridge-utils/bridge.mk |   18 ++++++++----------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/bridge-utils/Config.in b/package/bridge-utils/Config.in
index 9feb230..c2e8ca0 100644
--- a/package/bridge-utils/Config.in
+++ b/package/bridge-utils/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_BRIDGE
 	  Manage ethernet bridging; a way to connect networks together to
 	  form a larger network.
 
-	  http://bridge.sourceforge.net/
+	  http://linux-net.osdl.org/index.php/Bridge
diff --git a/package/bridge-utils/bridge.mk b/package/bridge-utils/bridge.mk
index f8736b1..8f3f741 100644
--- a/package/bridge-utils/bridge.mk
+++ b/package/bridge-utils/bridge.mk
@@ -1,20 +1,18 @@
 #############################################################
 #
-# bridge-utils - User Space Program For Controlling Bridging
+# bridge-utils
 #
 #############################################################
-#
-BRIDGE_VERSION:=1.4
-BRIDGE_SOURCE:=bridge-utils-$(BRIDGE_VERSION).tar.gz
-BRIDGE_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge/
-BRIDGE_AUTORECONF:=YES
-BRIDGE_INSTALL_STAGING:=NO
-BRIDGE_INSTALL_TARGET:=YES
-BRIDGE_CONF_OPT:=--with-linux-headers=$(LINUX_HEADERS_DIR)
+
+BRIDGE_VERSION = 1.5
+BRIDGE_SOURCE = bridge-utils-$(BRIDGE_VERSION).tar.gz
+BRIDGE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bridge
+BRIDGE_AUTORECONF = YES
+BRIDGE_CONF_OPT = --with-linux-headers=$(LINUX_HEADERS_DIR)
 
 define BRIDGE_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
-		include/libbridge.h man/man8/brctl.8 sbin/brctl)
+		include/libbridge.h share/man/man8/brctl.8 sbin/brctl)
 endef
 
 $(eval $(call AUTOTARGETS,package,bridge))
-- 
1.7.3.4
