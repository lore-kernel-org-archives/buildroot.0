From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 22:14:57 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_mkfontscale: select
 dependencies
Message-ID: <20180714201635.0D2D3883D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f99659d314d535f35e21f2d1003b8c813a7adfc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xapp_mkfontscale depends on xproto_xproto & zlib but did not select
them.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
