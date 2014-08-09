From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Aug 2014 15:34:35 +0200
Subject: [Buildroot] [PATCH 1/1] xapp_rstart: Depends on MMU
Message-ID: <1407591275-8281-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
  CCLD   rstartd.real
auth.o: In function `_do_auth':
auth.c:(.text+0x6a): undefined reference to `_fork'
server.o: In function `_detach':
server.c:(.text+0x80a): undefined reference to `_fork'

To reproduce use this defconfig
http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/defconfig

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_rstart/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_rstart/Config.in b/package/x11r7/xapp_rstart/Config.in
index 1bf61b3..3c1d5a9 100644
--- a/package/x11r7/xapp_rstart/Config.in
+++ b/package/x11r7/xapp_rstart/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_RSTART
 	bool "rstart"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  X.Org rstart application
-- 
1.7.10.4
