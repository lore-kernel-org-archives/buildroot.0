From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon,  7 May 2012 17:14:24 -0400
Subject: [Buildroot] [PATCH] qt: fix qconfig configure parameter
Message-ID: <1336425264-29060-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt configure option for specifying a custom qconfig.h
file changed from -config to -qconfig. This makes the
corresponding change in qt.mk.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 7e6c5dd..2adcd01 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -25,7 +25,7 @@ endif
 QT_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
 
 ifneq ($(QT_CONFIG_FILE),)
-QT_CONFIGURE_OPTS += -config buildroot
+QT_CONFIGURE_OPTS += -qconfig buildroot
 endif
 
 QT_CFLAGS = $(TARGET_CFLAGS)
-- 
1.7.0.4
