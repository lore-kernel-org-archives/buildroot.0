From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 29 Apr 2016 09:56:58 +0200
Subject: [Buildroot] [PATCH 1/3] mtd: install header files to staging
	directory
In-Reply-To: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
References: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1461916620-5170-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These header files are required by swupdate.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mtd/mtd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index adbf28d..bf90212 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -107,6 +107,9 @@ endef
 define MTD_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/lib/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
 	$(INSTALL) -D -m 0755 $(@D)/ubi-utils/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
+	$(INSTALL) -D -m 0644 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/mtd/libmtd.h
+	$(INSTALL) -D -m 0644 $(@D)/ubi-utils/include/libubi.h $(STAGING_DIR)/usr/include/mtd/libubi.h
+	$(INSTALL) -D -m 0644 $(@D)/include/mtd/ubi-media.h $(STAGING_DIR)/usr/include/mtd/ubi-media.h
 endef
 
 define MTD_INSTALL_TARGET_CMDS
-- 
2.8.0
