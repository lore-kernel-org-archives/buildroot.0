From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Mar 2012 17:46:25 +0200
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.4p4
Message-ID: <20120329154644.B0407969A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61d3d740dba46f469ea368b9080091ce614455a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
