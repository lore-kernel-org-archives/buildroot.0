From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:11 +0200
Subject: [Buildroot] [PATCH 15/34] reproducibility/gzip: avoid gzip
	timestamp in rootfs.tar.gz
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-15-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 528e194..ea248bb 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -48,7 +48,7 @@ ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
-ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c $(if $(BR2_REPRODUCIBLE),-n)
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
 ROOTFS_$(2)_COMPRESS_EXT = .bz2
-- 
2.7.4
