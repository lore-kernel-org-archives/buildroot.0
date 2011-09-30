From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Sep 2011 21:06:56 +0200
Subject: [Buildroot] [git commit] gst-plugins-base: disable parallel build
Message-ID: <20110930214747.6B9598DC0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54b60ba6aa0ff1b6c851e704bc36945ca052b2b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Parallel builds sometimes break when audio/testchannels is
compiled before the gstinterfaces library.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst-plugins-base/gst-plugins-base.mk           |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 87ee80d..aad0a7b 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -8,6 +8,8 @@ GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
 
+GST_PLUGINS_BASE_MAKE = $(MAKE1)
+
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
 # include dirs are added to the search path causing trouble
