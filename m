From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 31 Jan 2011 16:40:25 -0300
Subject: [Buildroot] [PATCH] fbset: ensure it builds after busybox if both
	are enabled
Message-ID: <1296502825-30254-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fbset/fbset.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 8926f4c..b5b5ab8 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -3,10 +3,16 @@
 # fbset
 #
 #############################################################
+
 FBSET_VERSION = 2.1
 FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
 
+# Make sure full fbset wins over busybox fbset
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+FBSET_DEPENDENCIES += busybox
+endif
+
 define FBSET_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
-- 
1.7.3.4
