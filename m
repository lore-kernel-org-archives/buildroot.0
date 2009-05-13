From: root <thiago.correa@gmail.com>
Date: Wed, 13 May 2009 18:43:24 -0300
Subject: [Buildroot] [PATCH] Fix avahi build
In-Reply-To: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
Message-ID: <1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
---
 package/avahi/avahi.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 7c463b6..0af7105 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -150,6 +150,7 @@ ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
 	$(INSTALL) -D -m 0755 package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
 	$(INSTALL) -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
 	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
+	mkdir -p $(TARGET_DIR)/var/lib/
 	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
 endif
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
-- 
1.6.0.6
