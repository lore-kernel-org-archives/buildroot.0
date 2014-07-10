From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 16:21:06 +0200
Subject: [Buildroot] [git commit] qt: remove gcc 4.6.x specific kludge
Message-ID: <20140710150057.E98B19C46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9026ac79f8206bbecd2dbd0638c66addf213725a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/qt.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6d01023..82a5509 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -217,11 +217,6 @@ endif
 
 ifeq ($(BR2_arm)$(BR2_armeb),y)
 QT_EMB_PLATFORM = arm
-ifeq ($(BR2_GCC_VERSION_4_6_X),y)
-# workaround for gcc issue
-# http://gcc.gnu.org/ml/gcc-patches/2010-11/msg02245.html
-QT_CXXFLAGS += -fno-strict-volatile-bitfields
-endif
 else ifeq ($(BR2_avr32),y)
 QT_EMB_PLATFORM = avr32
 else ifeq ($(BR2_i386),y)
