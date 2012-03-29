From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Mar 2012 23:25:03 -0300
Subject: [Buildroot] [PATCH 7/7] sudo: bump to version 1.8.4p4
In-Reply-To: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332987903-12378-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sudo/sudo.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index f10d294..71d7a20 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.7.8p1
+SUDO_VERSION = 1.8.4p4
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
-
 SUDO_CONF_OPT = \
 		--without-lecture \
 		--without-sendmail \
@@ -16,9 +15,11 @@ SUDO_CONF_OPT = \
 		--without-pam
 
 define SUDO_INSTALL_TARGET_CMDS
-	install -m 4555 -D $(@D)/sudo $(TARGET_DIR)/usr/bin/sudo
-	install -m 0555 -D $(@D)/visudo $(TARGET_DIR)/usr/sbin/visudo
-	install -m 0440 -D $(@D)/sudoers $(TARGET_DIR)/etc/sudoers
+	install -m 4555 -D $(@D)/src/sudo $(TARGET_DIR)/usr/bin/sudo
+	install -m 0555 -D $(@D)/plugins/sudoers/visudo  \
+		$(TARGET_DIR)/usr/sbin/visudo
+	install -m 0440 -D $(@D)/plugins/sudoers/sudoers \
+		$(TARGET_DIR)/etc/sudoers
 endef
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
