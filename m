From: Martin Hicks <mort@bork.org>
Date: Tue,  1 Feb 2011 12:13:01 -0500
Subject: [Buildroot] [PATCH] Enable ccache for u-boot compile
In-Reply-To: <1296580381-4658-1-git-send-email-mort@bork.org>
References: <1296580381-4658-1-git-send-email-mort@bork.org>
Message-ID: <1296580381-4658-2-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just needed to pass in ccache as a prefix to the CROSS_TARGET variable.

Signed-off-by: Martin Hicks <mort@bork.org>
---
 boot/u-boot/u-boot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index d520bb8..2f890fa 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -130,7 +130,7 @@ $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		$(U_BOOT_CONFIGURE_OPTS) \
-		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
+		$(MAKE) CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
 		$(U_BOOT_MAKE_OPT) -C $(U_BOOT_DIR)
 
 # Copy the result to the images/ directory
-- 
1.5.6.5
