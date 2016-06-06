From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Jun 2016 22:43:41 +0200
Subject: [Buildroot] [PATCH 4/7] fs/jffs2: split commands
In-Reply-To: <cover.1465245732.git.yann.morin.1998@free.fr>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
Message-ID: <9f09e4f4d7338f4fdd0d0ad015b741adf41ead6c.1465245732.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we can properly printf a multi-line command, there is no need
to use a single command to gnerate the jffs2 image.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/jffs2/jffs2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index a9cd414..9a36a75 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -39,8 +39,8 @@ ROOTFS_JFFS2_DEPENDENCIES = host-mtd
 
 ifneq ($(BR2_TARGET_ROOTFS_JFFS2_SUMMARY),)
 define ROOTFS_JFFS2_CMD
-	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $@.nosummary && \
-	$(SUMTOOL) $(SUMTOOL_OPTS) -i $@.nosummary -o $@ && \
+	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $@.nosummary
+	$(SUMTOOL) $(SUMTOOL_OPTS) -i $@.nosummary -o $@
 	rm $@.nosummary
 endef
 else
-- 
2.7.4
