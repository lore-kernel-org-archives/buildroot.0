From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 May 2010 14:35:04 +0200
Subject: [Buildroot] [git commit master] Add a <fs>-root-show-depends target
Message-ID: <20100527123559.86AC612E2B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=949db6ac05e42a90ee82e3f979805d98c41fa4f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index a3248c1..50dc974 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -57,6 +57,9 @@ ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
 	$(LZMA) -9 -c $$@ > $$@.lzma
 endif
 
+$(1)-root-show-depends:
+	@echo $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot host-makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
+
 $(1)-root: $(BINARIES_DIR)/rootfs.$(1)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
-- 
1.6.3.3
