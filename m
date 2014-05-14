From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 May 2014 23:56:41 +0200
Subject: [Buildroot] [PATCH] package/cairo: uses fork(), so requires an MMU
Message-ID: <1400104601-31625-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes:
    http://autobuild.buildroot.net/results/038/038371cc8548b3d39d8174289bedc9aae4076303/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/cairo/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 0c87a29..2742855 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include
-- 
1.8.3.2
