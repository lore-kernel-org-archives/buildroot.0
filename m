From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jun 2014 23:33:01 +0200
Subject: [Buildroot] [git commit] package/gst1-libav: disable on avr32
Message-ID: <20140604213345.AFC749CEA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6841142dd1e7bacae9ca94182993df77257e29c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst1-libav produces particularly large binaries, and the relocations
needed for it do not fit in the possible relocation mechanisms
available on avr32. Let's just disable it.

Fixes:
    http://autobuild.buildroot.net/results/15e/15e31d92848b53f001bd6acde71409af3091215c/

[Peter: drop tvheadend hunk]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
index 4f9c2b8..2ab786e 100644
--- a/package/gstreamer1/gst1-libav/Config.in
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GST1_LIBAV
 	bool "gst1-libav"
+	depends on !BR2_avr32 # binary too large, relocations don't fit
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  GStreamer plugin (formerly gst-ffmpeg).
