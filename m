From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:21:08 +0200
Subject: [Buildroot] [git commit] fs/jffs2: split commands
Message-ID: <20160607202530.2C43781F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e725848c3b33e6b2045b96b1088c0ea41cbd4bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we can properly printf a multi-line command, there is no need
to use a single command to gnerate the jffs2 image.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
