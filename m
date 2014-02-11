From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Feb 2014 18:15:51 +0100
Subject: [Buildroot] [PATCH] iozone: needs thread support in toolchain
Message-ID: <1392138951-13421-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/2a3/2a33d2c7535a9d867d76dd5cf05e1bcc3f5cdc38//

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iozone/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index 26d4daa..8cf50b1 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IOZONE
 	bool "iozone"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  IOzone is a filesystem benchmark tool.
 	  The benchmark generates and measures a variety of file operations
-- 
1.8.3.2
