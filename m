From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:28:03 +0100
Subject: [Buildroot] [git commit] gst1-libav: allow usage of ARMv6
	optimizations on ARMv7 platforms
Message-ID: <20141106233446.3F4C4B2052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f284e4b8b58462f5c03a8b732d13586ad1d5dc8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contrary to the ffmpeg package, the gst1-libav package was only
allowing ARMv6 optimizations on ARMv6 platforms. This commit also
allows ARMv6 optimizations on ARMv7 platforms, like the ffmpeg package
does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 6018504..1772530 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -52,7 +52,7 @@ endif
 ifeq ($(BR2_ARM_CPU_ARMV4),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv5te
 endif
-ifeq ($(BR2_ARM_CPU_ARMV6),y)
+ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --enable-armv6
 else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
