From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] cloop: ensure target directory
	exist before copying into
Message-ID: <20101212234309.547BF8E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e826187355173dca850a89838f0ab43b58caf4de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.2.2
