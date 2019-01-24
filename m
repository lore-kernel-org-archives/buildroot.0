From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 20:04:34 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] sunxi-cedarx: needs -fPIC
Message-ID: <20190124190349.755DE8179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8e130e5d13716754414d2f8ffd01456e26ac7b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:
 - http://autobuild.buildroot.org/results/c17062e1558f26c2db837883a0c33ef39dd031a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 838b9b6979496d297b1f6c64d9942cc3e9cfcef4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
