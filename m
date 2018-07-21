From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 16:16:35 +0200
Subject: [Buildroot] [PATCH v4 05/18] package/libvdpau: switch to xorgproto
In-Reply-To: <20180721141648.29939-1-bernd.kuhls@t-online.de>
References: <20180721141648.29939-1-bernd.kuhls@t-online.de>
Message-ID: <20180721141648.29939-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libvdpau/libvdpau.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
index f29da1e406..93446dbf28 100644
--- a/package/libvdpau/libvdpau.mk
+++ b/package/libvdpau/libvdpau.mk
@@ -18,8 +18,8 @@ LIBVDPAU_DEPENDENCIES = host-pkgconf xlib_libX11 xlib_libXext
 
 LIBVDPAU_CONF_OPTS = --with-module-dir=/usr/lib/vdpau
 
-ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
-LIBVDPAU_DEPENDENCIES += xproto_dri2proto
+ifeq ($(BR2_PACKAGE_XORGPROTO),y)
+LIBVDPAU_DEPENDENCIES += xorgproto
 LIBVDPAU_CONF_OPTS += --enable-dri2
 else
 LIBVDPAU_CONF_OPTS += --disable-dri2
-- 
2.18.0
