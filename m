From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Feb 2019 23:45:47 +0100
Subject: [Buildroot] [PATCH/next 2/2] package/libcpprestsdk: disable samples
In-Reply-To: <20190212224547.19315-1-fontaine.fabrice@gmail.com>
References: <20190212224547.19315-1-fontaine.fabrice@gmail.com>
Message-ID: <20190212224547.19315-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcpprestsdk/libcpprestsdk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 6f5fb41999..763ba513d8 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -10,7 +10,7 @@ LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
 LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl zlib
-LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF
+LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DBUILD_SAMPLES=OFF
 
 ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y)
 LIBCPPRESTSDK_DEPENDENCIES += websocketpp
-- 
2.14.1
