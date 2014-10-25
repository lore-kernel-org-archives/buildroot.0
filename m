From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:35:30 +0200
Subject: [Buildroot] [git commit] gst-ffmpeg: use the new BR2_ARM_CPU_ARM*
	options
Message-ID: <20141025103545.60F23AA3C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e33058e51fc74fa5548f18bd630c368ca2a24ccf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using the Config.in options for each individual ARM core,
use the newly introduced BR2_ARM_CPU_ARM* options, which exist per ARM
architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index b94fb0f..5e55363 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -51,10 +51,10 @@ endif
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
-ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+ifeq ($(BR2_ARM_CPU_ARMV4),y)
 GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv5te
 endif
-ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
+ifeq ($(BR2_ARM_CPU_ARMV6),y)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-armv6
 else
 GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
