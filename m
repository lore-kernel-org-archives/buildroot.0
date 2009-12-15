From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:31:02 +0100
Subject: [Buildroot] [PATCH 31/39] mtd-utils: fix dependency on host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e99f7cacef6becaabed74c07bfe5a05f52830ddb.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd-utils/mtd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
index a686661..ddae44e 100644
--- a/package/mtd/mtd-utils/mtd.mk
+++ b/package/mtd/mtd-utils/mtd.mk
@@ -34,7 +34,7 @@ $(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
 	touch $@
 
 
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked $(STAMP_DIR)/host_lzo_installed
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked host-lzo
 	CC="$(HOSTCC)" CROSS= LDFLAGS=-L$(HOST_DIR)/usr/lib \
 		$(MAKE) CFLAGS='-I$(HOST_DIR)/usr/include -I./include' \
 		LINUXDIR=$(LINUX_DIR) BUILDDIR=$(MTD_HOST_DIR) \
-- 
1.6.3.3
