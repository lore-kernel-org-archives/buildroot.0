From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  9 Dec 2010 10:55:02 +0100
Subject: [Buildroot] [PATCH 04/16] cloop: ensure target directory exist
	before copying into
In-Reply-To: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291888514-31385-5-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/cloop/cloop.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 0ed9ff0..4c16098 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -10,9 +10,10 @@ define HOST_CLOOP_BUILD_CMDS
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
- install -m 755 $(@D)/create_compressed_fs $(HOST_DIR)/usr/bin
- install -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 0755 -d $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 755 $(@D)/create_compressed_fs $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
 endef
 
 $(eval $(call GENTARGETS,package,cloop))
-$(eval $(call GENTARGETS,package,cloop,host))
\ No newline at end of file
+$(eval $(call GENTARGETS,package,cloop,host))
-- 
1.7.2.3
