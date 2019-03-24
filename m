From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Mar 2019 15:09:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcpprestsdk: add optional brotli
 dependency
Message-ID: <20190324140938.2273-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Official brotli support has been added in version 2.10.8 and
https://github.com/Microsoft/cpprestsdk/commit/f3824aa8d01705656e7ee4c0c49ae6980c868b20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcpprestsdk/libcpprestsdk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index d527aaad98..fd1201f287 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -16,6 +16,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+LIBCPPRESTSDK_DEPENDENCIES += brotli
+LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=OFF
+else
+LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=ON
+endif
+
 ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y)
 LIBCPPRESTSDK_DEPENDENCIES += websocketpp
 LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=OFF
-- 
2.20.1
