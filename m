From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:35:44 +0100
Subject: [Buildroot] [git commit] mplayer: allow usage of ARMv6
	optimizations on ARMv7 platforms
Message-ID: <20141106233446.543D8B1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78b1a3b4e542cb443eec4a9682a93462eaa3f3f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to what we do for ffmpeg/gst-ffmpeg/gst1-libav.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/mplayer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index ee023b4..dbde977 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -109,7 +109,7 @@ ifeq ($(BR2_ARM_CPU_ARMV5),y)
 MPLAYER_CONF_OPTS += --enable-armv5te
 endif
 
-ifeq ($(BR2_ARM_CPU_ARMV6),y)
+ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
 MPLAYER_CONF_OPTS += --enable-armv6
 endif
 
