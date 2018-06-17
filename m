From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jun 2018 16:01:28 +0200
Subject: [Buildroot] [PATCH 09/13] package/x11r7/xkeyboard-config: switch to
 xorgproto
In-Reply-To: <20180617140132.2752-1-bernd.kuhls@t-online.de>
References: <20180617140132.2752-1-bernd.kuhls@t-online.de>
Message-ID: <20180617140132.2752-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xkeyboard-config/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
index 5d1d6a72ed..c941742421 100644
--- a/package/x11r7/xkeyboard-config/Config.in
+++ b/package/x11r7/xkeyboard-config/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_XKEYBOARD_CONFIG
 	# Runtime dependencies
 	select BR2_PACKAGE_XAPP_XKBCOMP if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XPROTO_XPROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7
 	help
 	  keyboard configuration database for X
 
-- 
2.17.1
