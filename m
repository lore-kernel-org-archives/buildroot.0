From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Jan 2021 07:31:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/sunxi-boards: needs host gcc >= 4.9
Message-ID: <20210115063149.2072523-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 8a26801c9fad1c7749200e22e9dfdeaeeb65f76e forgot to propagate the
host gcc dependency from host-sunxi-tools to sunxi-boards

Fixes:
 - http://autobuild.buildroot.org/results/22fc93746b45a197cd64bfd116edb33494756bda

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sunxi-boards/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/sunxi-boards/Config.in b/package/sunxi-boards/Config.in
index d9fd8529f3..eaf492f2b2 100644
--- a/package/sunxi-boards/Config.in
+++ b/package/sunxi-boards/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SUNXI_BOARDS
 	bool "sunxi script.bin board file"
 	depends on BR2_arm
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-sunxi-tools
 	select BR2_PACKAGE_HOST_SUNXI_TOOLS
 	help
 	  Sunxi-boards requires a compiled .fex files for hardware
@@ -23,3 +24,7 @@ config BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE
 	  See inside sys_config/ directory in sunxi-boards source code
 	  to see the list of valid .fex files.
 endif
+
+comment "sunxi script.bin board file needs a toolchain w/ host gcc >= 4.9"
+	depends on BR2_arm
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
-- 
2.29.2
