From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 23:36:16 +0100
Subject: [Buildroot] [PATCH 03/11 v5] package/freerdp: conditionally build
	support for libXi
In-Reply-To: <cover.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <616a6c684faa1fcd893afce3c65880bc50ba4157.1424558036.git.yann.morin.1998@free.fr>
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
index 32b4714..084b9b8 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -49,6 +49,13 @@ else
 FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
+FREERDP_CONF_OPTS += -DWITH_XI=ON
+FREERDP_DEPENDENCIES += xlib_libXi
+else
+FREERDP_CONF_OPTS += -DWITH_XI=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 FREERDP_CONF_OPTS += -DWITH_XINERAMA=ON
 FREERDP_DEPENDENCIES += xlib_libXinerama
-- 
1.9.1
