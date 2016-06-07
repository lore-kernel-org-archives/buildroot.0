From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Jun 2016 22:09:41 +0200
Subject: [Buildroot] [PATCH] fs: add sha-bang to fakeroot script
Message-ID: <1465330181-4010-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We directly running this script, so it should start with a sha-bang (not
sure why/how it works today...).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/common.mk b/fs/common.mk
index 46e097b..63aa46c 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -76,6 +76,7 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	rm -f $$(FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
 	rm -f $$(USERS_TABLE)
+	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_USERS_TABLES),)
-- 
2.7.4
