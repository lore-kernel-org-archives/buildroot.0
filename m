From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jan 2010 00:13:59 +0100
Subject: [Buildroot] [git commit master] package/mtd: mtd-utils: fix fec.c
	build (bcopy reference)
Message-ID: <20100117231609.0E15377699@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6a772086b7c4d7df75da3d7ab046242bc4d8ec51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needs similar fix as what we already have for mtd-utils.git

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd-utils/mtd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
index 9b114de..a1aef16 100644
--- a/package/mtd/mtd-utils/mtd.mk
+++ b/package/mtd/mtd-utils/mtd.mk
@@ -99,6 +99,7 @@ $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		BUILDDIR=$(MTD_DIR) \
+		CPPFLAGS="-DNEED_BCOPY -Dbcmp=memcmp" \
 		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
-- 
1.6.3.3
