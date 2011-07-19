From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Jul 2011 12:26:27 +0200
Subject: [Buildroot] [git commit] uboot-tools: enable fw_printenv by default
Message-ID: <20110719114043.C6DA68B2EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cfb54ef515dc6043ffdca14424307791c14f2a18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Normally people want to atleast use fw_printenv if they are using u-boot
tools, so default to 'y'.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uboot-tools/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index f197391..9cc837c 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 
 config BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
 	bool "fw_printenv"
+	default y
 	help
 	  The fw_printenv / fw_setenv tools from Das U-Boot
 	  bootloader, which allows access to the U-Boot environment
-- 
1.7.3.4
