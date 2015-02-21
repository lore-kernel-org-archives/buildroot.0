From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 23:36:17 +0100
Subject: [Buildroot] [PATCH 04/11 v5] package/freerdp: conditionally build
	support for libXrender
In-Reply-To: <cover.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <3dcb34c89f5e6e8dc8ba8c2c8bd7411b1f93a992.1424558036.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 084b9b8..e873d33 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -70,6 +70,13 @@ else
 FREERDP_CONF_OPTS += -DWITH_XKBFILE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+FREERDP_CONF_OPTS += -DWITH_XRENDER=ON
+FREERDP_DEPENDENCIES += xlib_libXrender
+else
+FREERDP_CONF_OPTS += -DWITH_XRENDER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
 FREERDP_CONF_OPTS += -DWITH_XV=ON
 FREERDP_DEPENDENCIES += xlib_libXv
-- 
1.9.1
