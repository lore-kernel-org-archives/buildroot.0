From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 11:05:52 +0200
Subject: [Buildroot] [PATCH 06/15 v4] fs: define per-rootfs directory
In-Reply-To: <cover.1522487149.git.yann.morin.1998@free.fr>
References: <cover.1522487149.git.yann.morin.1998@free.fr>
Message-ID: <a1357b405525c1bd3544045915643fde7c24f20b.1522487149.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will serve in future commits to store pre-rootfs files, like
fakeroot script...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/common.mk b/fs/common.mk
index af6799bb83..eebe83d6e5 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -40,6 +40,7 @@ ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 define inner-rootfs
 
 ROOTFS_$(2)_NAME = $(1)
+ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
 
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
-- 
2.14.1
