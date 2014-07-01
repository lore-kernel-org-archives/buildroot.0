From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jul 2014 20:03:07 +0200
Subject: [Buildroot] [PATCH 08/10] qt: remove gcc 4.6.x specific kludge
In-Reply-To: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1404237789-15563-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk | 5 -----
 1 file changed, 5 deletions(-)

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
-- 
2.0.0
