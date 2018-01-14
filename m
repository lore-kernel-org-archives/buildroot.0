From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 15:17:04 +0100
Subject: [Buildroot] [PATCH 08/17] fs: define per-rootfs directory
In-Reply-To: <cover.1515939400.git.yann.morin.1998@free.fr>
References: <cover.1515939400.git.yann.morin.1998@free.fr>
Message-ID: <e241dd5f10f251aeb161ae92bfcd50a17a8fe3e8.1515939400.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will serve in future commits to store pre-rootfs files, like
fakeroot script...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
