From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Oct 2015 23:12:34 +0200
Subject: [Buildroot] [PATCH v1 2/2] gst1-plugins-good: update configure
	options
In-Reply-To: <1444770754-15352-1-git-send-email-ps.report@gmx.net>
References: <1444770754-15352-1-git-send-email-ps.report@gmx.net>
Message-ID: <1444770754-15352-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove legacy '--enabel-xshm/--disable-xshm' option

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index dd19594..fbc338a 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -320,13 +320,11 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 GST1_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
 GST1_PLUGINS_GOOD_CONF_OPTS += \
 	--enable-x \
-	--enable-xshm \
 	$(if $(BR2_PACKAGE_XLIB_LIBXFIXES),xlib_libXfixes) \
 	$(if $(BR2_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)
 else
 GST1_PLUGINS_GOOD_CONF_OPTS += \
-	--disable-x \
-	--disable-xshm
+	--disable-x
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO),y)
-- 
2.1.4
