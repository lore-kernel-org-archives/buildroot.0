From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Feb 2012 22:15:51 +0100
Subject: [Buildroot] [git commit branch/next] qt: simplify arch handling
Message-ID: <20120226213202.77A5A90B88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbfda06cb9d9aa1708915ec4148d08a0ca36cbc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
