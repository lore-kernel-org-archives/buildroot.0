From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:54:39 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-ugly: add
 missing comma in license variable
Message-ID: <20200926134452.3DD258DA2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4626bafe5ccd91fdcc84f2413ad23404942672f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When one GPL-licensed plugin was enabled, the license of
gst1-plugins-ugly would be "LGPL-2.1+ GPL-2.0", but licenses should be
comma separated, not space separated. So let's fix that to get the
expected value of "LGPL-2.1+, GPL-2.0".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 2072772d9a..db6a09ddca 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -90,7 +90,7 @@ endif
 
 # Add GPL license if GPL plugins enabled.
 ifeq ($(GST1_PLUGINS_UGLY_HAS_GPL_LICENSE),y)
-GST1_PLUGINS_UGLY_LICENSE += GPL-2.0
+GST1_PLUGINS_UGLY_LICENSE += , GPL-2.0
 endif
 
 # Use the following command to extract license info for plugins.
