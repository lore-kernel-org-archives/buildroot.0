From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Aug 2014 15:28:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/tar: Depends on MMU
Message-ID: <1407590919-23046-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
misc.o: In function `_xfork':
misc.c:(.text+0x614): undefined reference to `_fork'
../lib/libtar.a(rtapelib.o): In function `_rmt_open__':
rtapelib.c:(.text+0x6d2): undefined reference to `_fork'

To reproduce use this defconfig
http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/defconfig

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tar/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tar/Config.in b/package/tar/Config.in
index 06a5825..74b0219 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TAR
 	bool "tar"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  A program that saves many files together into a single tape or disk
 	  archive, and can restore individual files from the archive.
-- 
1.7.10.4
