From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Jul 2018 21:51:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_mkfontscale: select
 dependencies
Message-ID: <20180713195136.7213-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xapp_mkfontscale depends on xproto_xproto & zlib but did not select
them.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_mkfontscale/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xapp_mkfontscale/Config.in b/package/x11r7/xapp_mkfontscale/Config.in
index 540dd455ff..0cfee6ad05 100644
--- a/package/x11r7/xapp_mkfontscale/Config.in
+++ b/package/x11r7/xapp_mkfontscale/Config.in
@@ -3,5 +3,7 @@ config BR2_PACKAGE_XAPP_MKFONTSCALE
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_ZLIB
 	help
 	  create an index of scalable font files for X
-- 
2.18.0
