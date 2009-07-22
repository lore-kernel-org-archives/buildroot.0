From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Jul 2009 22:16:07 +0200
Subject: [Buildroot] [git commit] gst-plugins-base: don't search host
	headers if freetype isn't available
Message-ID: <20090722204048.8D93E774E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8232850c51e07b99ba84769b492faa147290fdc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

freetype is only used by examples, but if it is not found
and the host has a freetype-config script, then the host
include dirs are added to the search path causing trouble.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gst-plugins-base/gst-plugins-base.mk           |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 88c68e1..63f23cd 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -9,6 +9,11 @@ GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
 GST_PLUGINS_BASE_LIBTOOL_PATCH = NO
 
+# freetype is only used by examples, but if it is not found
+# and the host has a freetype-config script, then the host
+# include dirs are added to the search path causing trouble
+GST_PLUGINS_BASE_CONF_ENV = FT2_CONFIG=/bin/false
+
 GST_PLUGINS_BASE_CONF_OPT = \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
-- 
1.6.3.3
