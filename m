From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:36:29 +0200
Subject: [Buildroot] [git commit] mtd: install header files to staging
	directory
Message-ID: <20160501203644.7FE36817E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a61c2cc775263ba7c4814b92d35b923ad0617a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These header files are required by swupdate.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
