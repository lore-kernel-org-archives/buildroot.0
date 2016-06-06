From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Jun 2016 22:43:40 +0200
Subject: [Buildroot] [PATCH 3/7] fs/cloop: split long line
In-Reply-To: <cover.1465245732.git.yann.morin.1998@free.fr>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
Message-ID: <17f1e5dd2ddb461d2f78a3ea2549171b13d484dc.1465245732.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

.. and add the missing newline-at-end-of-file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/cloop/cloop.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/cloop/cloop.mk b/fs/cloop/cloop.mk
index f783ade..9e42a3a 100644
--- a/fs/cloop/cloop.mk
+++ b/fs/cloop/cloop.mk
@@ -7,7 +7,8 @@
 ROOTFS_CLOOP_DEPENDENCIES = host-cloop host-cdrkit
 
 define ROOTFS_CLOOP_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | $(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $@
+	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | \
+		$(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $@
 endef
 
-$(eval $(call ROOTFS_TARGET,cloop))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,cloop))
-- 
2.7.4
