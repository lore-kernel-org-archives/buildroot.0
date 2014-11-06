From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:05:51 +0100
Subject: [Buildroot] [git commit] gst1-libav: use the new BR2_ARM_CPU_ARM*
	options
Message-ID: <20141106233446.34833B1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cb7b9fe1e258fc2f7fe810dcb69390e4f49e7d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using the Config.in options for each individual ARM core,
use the newly introduced BR2_ARM_CPU_ARM* options, which exist per ARM
architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 6fdf091..6018504 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -49,10 +49,10 @@ endif
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
-ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+ifeq ($(BR2_ARM_CPU_ARMV4),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv5te
 endif
-ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
+ifeq ($(BR2_ARM_CPU_ARMV6),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --enable-armv6
 else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
