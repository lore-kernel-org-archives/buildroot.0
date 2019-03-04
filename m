From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Mar 2019 19:43:29 +0100
Subject: [Buildroot] [git commit] package/gst-plugins-bad: disable spandsp
Message-ID: <20190304184204.0BD338E220@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b20f8a893f17d139ceafb512f3ccd207770844fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst-plugins-bad does not build with spandsp so disable it (it's already
disabled in gst1-plugins-bad)

Fixes:
 - http://autobuild.buildroot.org/results/842ca572b7810bca70846274262a6fcdb38df49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index b9416db34f..856ff9665d 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -12,7 +12,8 @@ GST_PLUGINS_BAD_LICENSE = LGPL-2.1+, GPL-2.0+
 GST_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB COPYING
 
 GST_PLUGINS_BAD_CONF_OPTS = \
-	--disable-examples
+	--disable-examples \
+	--disable-spandsp
 
 GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
 
