From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 00:42:59 +0100
Subject: [Buildroot] [PATCH] gstreamer: add missing dependencies on
	host-flex and host-bison
Message-ID: <1364168579-8326-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/f9f32bfd44a3f74ec30fc61594bf6eb04f80f872/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/gstreamer/gstreamer.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 3fb913e..5abce53 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -27,6 +27,6 @@ GSTREAMER_CONF_OPT = \
 		$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug) \
 		$(if $(BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY),,--disable-registry)
 
-GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf
+GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
 
 $(eval $(autotools-package))
-- 
1.7.9.5
