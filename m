From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 15 Jul 2014 21:19:00 +0200
Subject: [Buildroot] [PATCH v14 05/20] mesa3d: Add dri3 support
In-Reply-To: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405451955-10204-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6282503..9fdb7bc 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -24,6 +24,13 @@ MESA3D_DEPENDENCIES = \
 	host-xutil_makedepend \
 	libdrm
 
+ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
+MESA3D_DEPENDENCIES += xproto_dri3proto
+MESA3D_CONF_OPT += --enable-dri3
+else
+MESA3D_CONF_OPT += --disable-dri3
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
-- 
1.7.10.4
