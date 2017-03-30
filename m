From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 30 Mar 2017 20:34:37 +0200
Subject: [Buildroot] [PATCH 1/1] libmediaart: fix qt5 build
Message-ID: <1490898877-4000-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use BR2_PACKAGE_QT5_VERSION_LATEST instead of BR2_QT5_VERSION_LATEST

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmediaart/libmediaart.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 31f5675..0f1a0f3 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -22,7 +22,7 @@ LIBMEDIAART_CONF_OPTS += \
 	--disable-qt
 else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_QT),y)
 # qt5 needs c++11 (since qt-5.7)
-ifeq ($(BR2_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 endif
 LIBMEDIAART_DEPENDENCIES += \
-- 
2.5.0
