From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 24 Aug 2017 14:41:50 -0700
Subject: [Buildroot] [PATCH 1/3] package/minidlna: Do not mark .service file
	executable
Message-ID: <20170824214152.5742-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not mark .service file executable, otherwise systemd
will give us a warning about it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/minidlna/minidlna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index d0d9136b44..d2bc9f50c7 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -29,7 +29,7 @@ define MINIDLNA_INSTALL_INIT_SYSV
 endef
 
 define MINIDLNA_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0755 package/minidlna/minidlnad.service \
+	$(INSTALL) -D -m 0644 package/minidlna/minidlnad.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/minidlnad.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-- 
2.13.5
