From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 06:02:55 +0200
Subject: [Buildroot] [PATCH 3/6] cramfs/jffs2: use the new
	ROOTFS_DEVICE_TABLE variable
In-Reply-To: <cover.1271476803.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271476803.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d25c560ab2c33a75194c68fd282d1b24119128c7.1271476803.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/cramfs/cramfs.mk |    4 ++--
 fs/jffs2/jffs2.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index ccd316f..e0deb7e 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -9,8 +9,8 @@ else
 CRAMFS_OPTS=-l
 endif
 
-ifneq ($(TARGET_DEVICE_TABLE),)
-CRAMFS_OPTS += -D $(TARGET_DEVICE_TABLE)
+ifneq ($(ROOTFS_DEVICE_TABLE),)
+CRAMFS_OPTS += -D $(ROOTFS_DEVICE_TABLE)
 endif
 
 define ROOTFS_CRAMFS_CMD
diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index a0a563d..36be037 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -32,8 +32,8 @@ JFFS2_OPTS += -n
 SUMTOOL_OPTS += -n
 endif
 
-ifneq ($(TARGET_DEVICE_TABLE),)
-JFFS2_OPTS += -D $(TARGET_DEVICE_TABLE)
+ifneq ($(ROOTFS_DEVICE_TABLE),)
+JFFS2_OPTS += -D $(ROOTFS_DEVICE_TABLE)
 endif
 
 ROOTFS_JFFS2_DEPENDENCIES = host-mtd
-- 
1.6.3.3
