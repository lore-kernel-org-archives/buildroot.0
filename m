From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Aug 2014 13:55:20 +0200
Subject: [Buildroot] [PATCH] xapp_xfs: needs MMU
Message-ID: <1409140520-10975-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/7a89f79499e167cc98449a045604d25d4fc88484/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xfs/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
index e71d89f..8b72445 100644
--- a/package/x11r7/xapp_xfs/Config.in
+++ b/package/x11r7/xapp_xfs/Config.in
@@ -3,5 +3,6 @@ config BR2_PACKAGE_XAPP_XFS
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	depends on BR2_USE_MMU # fork()
 	help
 	  X font server
-- 
2.0.0
