From: Martin Hicks <mort@bork.org>
Date: Tue, 1 Feb 2011 20:53:05 +0100
Subject: [Buildroot] [git commit master 1/1] Enable ccache for u-boot compile
Message-ID: <20110201203534.A71C68EE4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3fb2ce122055fd34df7e1712700e5d72bdb40e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just needed to pass in ccache as a prefix to the CROSS_TARGET variable.

Signed-off-by: Martin Hicks <mort@bork.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
