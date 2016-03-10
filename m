From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 10 Mar 2016 22:48:54 +0100
Subject: [Buildroot] [PATCH 2/3] psplash: indentation cleanup
In-Reply-To: <1457646535-976-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1457646535-976-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1457646535-976-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/psplash/psplash.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 85c0fb8..aa67341 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -14,13 +14,13 @@ define PSPLASH_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
 	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
 	ln -sf  ../../../../usr/lib/systemd/system/psplash-start.service \
-		 $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/
+		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/
 
 	$(INSTALL) -D -m 644 package/psplash/psplash-quit.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/psplash-quit.service
 	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf  ../../../../usr/lib/systemd/system/psplash-quit.service \
-		 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
 endef
 
 $(eval $(autotools-package))
-- 
1.9.1
