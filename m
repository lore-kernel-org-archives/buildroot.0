From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Oct 2011 22:38:47 +0200
Subject: [Buildroot] [git commit] Revert "gst-plugins-base: disable parallel
	build"
Message-ID: <20111003220110.C43AA8D412@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cedbad56db97718e7960f1e288a8f6ee68797e02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 54b60ba6aa0ff1b6c851e704bc36945ca052b2b3.

As requested by Sven. Not needed as we now have fixed the testchannels
issue.
---
 .../gst-plugins-base/gst-plugins-base.mk           |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index aad0a7b..87ee80d 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -8,8 +8,6 @@ GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
 
-GST_PLUGINS_BASE_MAKE = $(MAKE1)
-
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
 # include dirs are added to the search path causing trouble
