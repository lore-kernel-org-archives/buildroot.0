From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:31:47 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/gstreamer1/gst1-plugins-ugly: add missing comma in license variable
Message-ID: <20201002082518.0C5BB81E74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b5c39d4d9901ce647a21438b71c3e2e148df8ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

When one GPL-licensed plugin was enabled, the license of
gst1-plugins-ugly would be "LGPL-2.1+ GPL-2.0", but licenses should be
comma separated, not space separated. So let's fix that to get the
expected value of "LGPL-2.1+, GPL-2.0".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4626bafe5ccd91fdcc84f2413ad23404942672f4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 9f8b1d3359..0261dc3233 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -89,7 +89,7 @@ endif
 
 # Add GPL license if GPL plugins enabled.
 ifeq ($(GST1_PLUGINS_UGLY_HAS_GPL_LICENSE),y)
-GST1_PLUGINS_UGLY_LICENSE += GPL-2.0
+GST1_PLUGINS_UGLY_LICENSE += , GPL-2.0
 endif
 
 # Use the following command to extract license info for plugins.
