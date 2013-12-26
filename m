From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 18:44:35 +0100
Subject: [Buildroot] [git commit] inadyn: bump to version 1.99.6
Message-ID: <20131226175122.08CFE9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a671ce48cb9d16a7a334d04327339f86cd3cf3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch to github helper and install sample configuration file mode
600 - o+r is really bad for password-bearing configuration files.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/inadyn/inadyn.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

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
