From: Jonathan Liu <net147@gmail.com>
Date: Fri, 21 Sep 2012 22:54:19 +1000
Subject: [Buildroot] [PATCH] connman: bump to version 1.7
Message-ID: <1348232059-1055-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/connman/connman.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index ed83ebc..07122df 100644
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
@@ -27,7 +27,7 @@ ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
 CONNMAN_CONF_OPT += --enable-client
 
 define CONNMAN_INSTALL_CM
-	$(INSTALL) -m 0755 -D $(@D)/client/cm $(TARGET_DIR)/usr/bin/cm
+	$(INSTALL) -m 0755 -D $(@D)/client/connmanctl $(TARGET_DIR)/usr/bin/connmanctl
 endef
 
 CONNMAN_POST_INSTALL_TARGET_HOOKS += CONNMAN_INSTALL_CM
-- 
1.7.12.1
