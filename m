From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Jun 2016 22:43:43 +0200
Subject: [Buildroot] [PATCH 6/7] fs/ubifs: fix the UBI commands
In-Reply-To: <cover.1465245732.git.yann.morin.1998@free.fr>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
Message-ID: <43c10df53fc2ae67d8ab9b6106446ed192b7c9c1.1465245732.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can now properly use multi-line commands, so use that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ubifs/ubi.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index aba3bea..cda4bf4 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -21,9 +21,9 @@ UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
 endif
 
 define ROOTFS_UBI_CMD
-	$(INSTALL) -m 0644 $(UBINIZE_CONFIG_FILE_PATH) $(BUILD_DIR)/ubinize.cfg ;\
-	$(SED) 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' $(BUILD_DIR)/ubinize.cfg ;\
-	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg ;\
+	$(INSTALL) -m 0644 $(UBINIZE_CONFIG_FILE_PATH) $(BUILD_DIR)/ubinize.cfg
+	$(SED) 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' $(BUILD_DIR)/ubinize.cfg
+	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
 	rm $(BUILD_DIR)/ubinize.cfg
 endef
 
-- 
2.7.4
