From: Christopher McCrory <chrismcc@gmail.com>
Date: Tue, 27 Feb 2018 04:39:22 -0800
Subject: [Buildroot] [PATCH 1/3] bind BIND_PKGDIR
Message-ID: <20180227123924.20725-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

use BIND_PKGDIR instead of package/bind

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/bind/bind.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index bec902079c..392ef321c2 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -93,11 +93,11 @@ endef
 
 ifeq ($(BR2_PACKAGE_BIND_SERVER),y)
 define BIND_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/bind/S81named \
+	$(INSTALL) -m 0755 -D $(BIND_PKGDIR)/S81named \
 		$(TARGET_DIR)/etc/init.d/S81named
 endef
 define BIND_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/bind/named.service \
+	$(INSTALL) -D -m 644 $(BIND_PKGDIR)/named.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/named.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-- 
2.14.3
