From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:08 +0200
Subject: [Buildroot] [PATCH 39/69] xapp_mkfontscale: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-40-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index b99a64604473..d7abf6c5bbe4 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -10,6 +10,8 @@ XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_LICENSE = MIT
 XAPP_MKFONTSCALE_LICENSE_FILES = COPYING
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
+HOST_XAPP_MKFONTSCALE_DEPENDENCIES = \
+	host-zlib host-freetype host-xlib_libfontenc host-xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
