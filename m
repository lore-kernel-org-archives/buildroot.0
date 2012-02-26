From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 10:13:06 -0200
Subject: [Buildroot] [PATCH 1/3] qt: remove bogus lines
Message-ID: <1330258388-28391-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt/qt.mk |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index fe85dae..68f9348 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -199,9 +199,7 @@ else
 QT_CONFIGURE_OPTS += -big-endian
 endif
 
-ifeq ($(BR2_arm),y)
-QT_EMB_PLATFORM = arm
-else ifeq ($(BR2_armeb),y)
+ifeq ($(BR2_arm)$(BR2_armeb),y)
 QT_EMB_PLATFORM = arm
 else ifeq ($(BR2_avr32),y)
 QT_EMB_PLATFORM = avr32
@@ -209,9 +207,7 @@ else ifeq ($(BR2_i386),y)
 QT_EMB_PLATFORM = x86
 else ifeq ($(BR2_x86_64),y)
 QT_EMB_PLATFORM = x86_64
-else ifeq ($(BR2_mips),y)
-QT_EMB_PLATFORM = mips
-else ifeq ($(BR2_mipsel),y)
+else ifeq ($(BR2_mips)$(BR2_mipsel),y)
 QT_EMB_PLATFORM = mips
 else ifeq ($(BR2_powerpc),y)
 QT_EMB_PLATFORM = powerpc
-- 
1.7.9.1
