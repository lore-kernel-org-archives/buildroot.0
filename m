From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:42 +0200
Subject: [Buildroot] [PATCH 08/31] gst1-libav: allow usage of ARMv6
	optimizations on ARMv7 platforms
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contrary to the ffmpeg package, the gst1-libav package was only
allowing ARMv6 optimizations on ARMv6 platforms. This commit also
allows ARMv6 optimizations on ARMv7 platforms, like the ffmpeg package
does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index db12483..96613ba 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -52,7 +52,7 @@ endif
 ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV4T),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv5te
 endif
-ifeq ($(BR2_ARM_CPU_ARMV6J)$(BR2_ARM_CPU_ARMV6ZK),y)
+ifeq ($(BR2_ARM_CPU_ARMV6J)$(BR2_ARM_CPU_ARMV6ZK)$(BR2_ARM_CPU_ARMV7A),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --enable-armv6
 else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
-- 
2.0.0
