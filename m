From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Feb 2019 23:45:46 +0100
Subject: [Buildroot] [PATCH/next 1/2] package/libcpprestsdk: add optional
 websocketpp dependency
Message-ID: <20190212224547.19315-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcpprestsdk/libcpprestsdk.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index be9ca292c5..6f5fb41999 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -10,6 +10,13 @@ LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
 LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl zlib
-LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DCPPREST_EXCLUDE_WEBSOCKETS=ON
+LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF
+
+ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y)
+LIBCPPRESTSDK_DEPENDENCIES += websocketpp
+LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=OFF
+else
+LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=ON
+endif
 
 $(eval $(cmake-package))
-- 
2.14.1
