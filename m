From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  7 Apr 2015 09:51:23 +0300
Subject: [Buildroot] [PATCH] lirc-tools: needs threads
Message-ID: <cb6cb178ff004d5c7cad4497fbdacdd83193f967.1428389483.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/c20/c20a98dfacfa79579a0d401e081f2cca13a7a7b0/
http://autobuild.buildroot.net/results/0fe/0fe9b4a3a5128844886e4bf89b5bc0d3008b43aa/
http://autobuild.buildroot.net/results/482/4826409b3d3177eff3e7f2c3b7360058c73fd406/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lirc-tools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
index 0f58662c371c..8ce83a05153d 100644
--- a/package/lirc-tools/Config.in
+++ b/package/lirc-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIRC_TOOLS
 	bool "lirc-tools"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  LIRC is a package that supports receiving and sending IR
 	  signals of the most common IR remote controls. It contains a
@@ -13,3 +14,7 @@ config BR2_PACKAGE_LIRC_TOOLS
 	  enable the kernel drivers to support your hardware.
 
 	  http://www.lirc.org/
+
+comment "lirc-tools needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.1.4
