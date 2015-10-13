From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:29:08 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: update configure options
Message-ID: <20151013212925.DA0BB81E09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10755be5fcbc557e5a0eddec9bcdb1c3edfe309f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove legacy '--enable-xshm/--disable-xshm' option

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gst1-plugins-good/gst1-plugins-good.mk         |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

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
