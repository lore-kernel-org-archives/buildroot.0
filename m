From: Ray Kinsella <ray.kinsella@intel.com>
Date: Fri, 10 Feb 2017 10:36:59 +0000
Subject: [Buildroot] [PATCH] motion: disable autotools host optimization
Message-ID: <1486723019-97464-1-git-send-email-ray.kinsella@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The motion autotools script helpfully detects the host
Microprocessors intr set and optimizes for it.
Disabling this feature causes autotools to use the
target parameters passed by BR instead.

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 package/motion/motion.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index d27def2..d76b547 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -14,7 +14,7 @@ MOTION_AUTORECONF = YES
 
 # motion does not use any specific function of jpeg-turbo, so just relies on
 # jpeg selection
-MOTION_CONF_OPTS += --without-jpeg-turbo
+MOTION_CONF_OPTS += --without-jpeg-turbo --without-optimizecpu
 
 ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
 MOTION_DEPENDENCIES += ffmpeg
-- 
1.9.1
