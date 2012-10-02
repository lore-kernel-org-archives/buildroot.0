From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 2 Oct 2012 08:47:53 +0200
Subject: [Buildroot] [git commit] connman: bump to version 1.7
Message-ID: <20121002065915.9E2B899795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d0277001f368ecf77ebb47a0a9344de94c43298
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: command line client needs readline]
Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in  |    1 +
 package/connman/connman.mk |    5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 082b0ca..b67b540 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_CONNMAN_DEBUG
 
 config BR2_PACKAGE_CONNMAN_CLIENT
 	bool "enable command line client"
+	select BR2_PACKAGE_READLINE
 
 endif # BR2_PACKAGE_CONNMAN
 
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index ed83ebc..7a52071 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 #######################################################
 
-CONNMAN_VERSION = 1.6
+CONNMAN_VERSION = 1.7
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
@@ -25,9 +25,10 @@ CONNMAN_POST_INSTALL_TARGET_HOOKS = CONNMAN_INSTALL_INITSCRIPT
 
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
 CONNMAN_CONF_OPT += --enable-client
+CONNMAN_DEPENDENCIES += readline
 
 define CONNMAN_INSTALL_CM
-	$(INSTALL) -m 0755 -D $(@D)/client/cm $(TARGET_DIR)/usr/bin/cm
+	$(INSTALL) -m 0755 -D $(@D)/client/connmanctl $(TARGET_DIR)/usr/bin/connmanctl
 endef
 
 CONNMAN_POST_INSTALL_TARGET_HOOKS += CONNMAN_INSTALL_CM
