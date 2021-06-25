From: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
Date: Fri, 25 Jun 2021 11:19:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix env image help text
Message-ID: <20210625091900.811972-1-mirza.kapetanovic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE is passed almost as is to mkenvimage
which, looking at the help text and source code of the tool, doesn't seem to support
mulitple files as input.

I tried providing multiple files (space separated) and only the last file was included
in the resulting environment image.

Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
---
 package/uboot-tools/Config.in.host | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index 431cc8631d..7e5c5084c0 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -56,15 +56,13 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
 if BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
 
 config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE
-	string "Source files for environment"
+	string "Source file for environment"
 	default BR2_TARGET_UBOOT_ENVIMAGE_SOURCE if BR2_TARGET_UBOOT_ENVIMAGE_SOURCE != "" # legacy
 	help
-	  Text files describing the environment. Files should have
+	  Text file describing the environment. File should have
 	  lines of the form var=value, one per line. Blank lines and
 	  lines starting with a # are ignored.
 
-	  Multiple source files are concatenated in the order listed.
-
 	  Leave empty to generate image from compiled-in env if a U-boot
 	  target build is configured (BR2_TARGET_UBOOT)
 
-- 
2.25.1
