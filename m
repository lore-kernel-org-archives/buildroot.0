From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:30 +0100
Subject: [Buildroot] [PATCH 06/40] xapp_mkfontscale: enable compilation for
	the host and fix deps
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1786b39f0b85f2efa383ca8714ca88fdecafba84.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mkfontscale on the host is required to build xfonts-encoding for the
target.

We also fix the dependencies. xlib_libX11 is not needed to compile
xapp_mkfontscale. However, xproto_xproto is needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 05a3f81..1cbe0b4 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -8,6 +8,8 @@ XAPP_MKFONTSCALE_VERSION = 1.0.5
 XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_AUTORECONF = NO
-XAPP_MKFONTSCALE_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
+XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
+HOST_XAPP_MKFONTSCALE_DEPENDENCIES = host-zlib host-freetype host-xlib_libfontenc host-xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_mkfontscale))
+$(eval $(call AUTOTARGETS,package/x11r7,xapp_mkfontscale,host))
-- 
1.6.3.3
