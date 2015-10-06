From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Oct 2015 08:20:01 +0200
Subject: [Buildroot] [git commit] fs/romfs: remove redunant ROMFS_TARGET
	definition
Message-ID: <20151006062424.1245B81E75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03f18925a04119e984442bff41e461baa663a623
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Probably a leftover from our last fs infra reworking a couple of years
ago.

Incidentally, also added a newline at the end of the file.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/romfs/romfs.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index e0ac65f..2738b6b 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-ROMFS_TARGET = $(IMAGE).romfs
-
 ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
 
 define ROOTFS_ROMFS_CMD
 	$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $@
 endef
 
-$(eval $(call ROOTFS_TARGET,romfs))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,romfs))
