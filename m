From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Dec 2013 09:16:35 -0300
Subject: [Buildroot] [PATCH] inadyn: bump to version 1.99.6
Message-ID: <1388060195-12033-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch to github helper and install sample configuration file mode
600 - o+r is really bad for password-bearing configuration files.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/inadyn/inadyn.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 12f8acc..dc443f9 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-INADYN_VERSION = 1.98.1
-INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.bz2
-INADYN_SITE = https://github.com/downloads/troglobit/inadyn
+INADYN_VERSION = 1.99.6
+INADYN_SITE = $(call github,troglobit,inadyn,$(INADYN_VERSION))
 INADYN_LICENSE = GPLv2+
 INADYN_LICENSE_FILES = COPYING LICENSE
 
@@ -16,7 +15,7 @@ endef
 
 define INADYN_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/src/inadyn $(TARGET_DIR)/usr/sbin/inadyn
-	$(INSTALL) -D -m 0644 package/inadyn/inadyn.conf \
+	$(INSTALL) -D -m 0600 package/inadyn/inadyn.conf \
 		$(TARGET_DIR)/etc/inadyn.conf
 	$(INSTALL) -D -m 0755 package/inadyn/S70inadyn \
 		$(TARGET_DIR)/etc/init.d/S70inadyn
-- 
1.8.3.2
