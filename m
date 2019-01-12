From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jan 2019 10:24:59 +0100
Subject: [Buildroot] [PATCH 1/1] sunxi-cedarx: needs -fPIC
Message-ID: <20190112092459.21382-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/c17062e1558f26c2db837883a0c33ef39dd031a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sunxi-cedarx/sunxi-cedarx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-cedarx/sunxi-cedarx.mk b/package/sunxi-cedarx/sunxi-cedarx.mk
index 219f1bc74b..5b99f04181 100644
--- a/package/sunxi-cedarx/sunxi-cedarx.mk
+++ b/package/sunxi-cedarx/sunxi-cedarx.mk
@@ -19,7 +19,7 @@ SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armel2
 endif
 
 define SUNXI_CEDARX_BUILD_AVHEAP
-	$(TARGET_CC) $(TARGET_CFLAGS) \
+	$(TARGET_CC) $(TARGET_CFLAGS) -fPIC \
 		-c $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.c \
 		-o $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap/avheap.o \
 		-I $(SUNXI_CEDARX_BIN_DIR)/adapter/avheap \
-- 
2.14.1
