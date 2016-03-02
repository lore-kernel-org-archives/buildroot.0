From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Mar 2016 22:43:15 +0100
Subject: [Buildroot] [git commit] webkitgtk24: fix gstreamer dependency
Message-ID: <20160302214740.DB96080ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd03a12fc3d81c89e1eb4a9b834e99a498ad2a94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a28/a280f23cc29f77ab440edbda05b4e58d6f4856e7/

The .mk file was checking for gst1-plugins-base but then adding
gst1-plugins-good to dependencies.

According to Source/autotools/FindDependencies.m4, the video and web audio
options need the .pc files provided by gst1-plugins-base, so use that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk24/webkitgtk24.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index 0dc4774..d8e41b9 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -46,7 +46,7 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 WEBKITGTK24_CONF_OPTS += \
 	--enable-video \
 	--enable-web-audio
-WEBKITGTK24_DEPENDENCIES += gst1-plugins-good
+WEBKITGTK24_DEPENDENCIES += gst1-plugins-base
 else
 WEBKITGTK24_CONF_OPTS += \
 	--disable-video \
