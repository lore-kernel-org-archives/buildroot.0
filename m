From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Nov 2018 14:15:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix systemd support
Message-ID: <20181124131526.30319-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/a09/a09a065c523931c1892e81a99c57521fbe095d8b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index d95b4edfa4..075c018eb4 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -162,11 +162,11 @@ define SAMBA4_INSTALL_INIT_SYSV
 endef
 
 define SAMBA4_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/nmb.service \
+	$(INSTALL) -D -m 644 $(@D)/bin/default/packaging/systemd/nmb.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/nmb.service
-	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/smb.service \
+	$(INSTALL) -D -m 644 $(@D)/bin/default/packaging/systemd/smb.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/smb.service
-	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/winbind.service \
+	$(INSTALL) -D -m 644 $(@D)/bin/default/packaging/systemd/winbind.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/winbind.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../usr/lib/systemd/system/nmb.service \
-- 
2.19.1
