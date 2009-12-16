From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] mtd-utils: fix dependency on host
	package
Message-ID: <20091216153057.D60B477738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e99f7cacef6becaabed74c07bfe5a05f52830ddb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
