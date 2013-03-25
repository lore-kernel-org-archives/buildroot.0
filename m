From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 08:29:53 +0100
Subject: [Buildroot] [git commit] gstreamer: add missing dependencies on
	host-flex and host-bison
Message-ID: <20130325073638.31FED9B288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5ce4e4164e30189e02f04d37708e7d4703851cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/f9f32bfd44a3f74ec30fc61594bf6eb04f80f872/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer/gstreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
