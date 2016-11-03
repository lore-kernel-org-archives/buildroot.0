From: Jeroen Roovers <jer@airfi.aero>
Date: Thu,  3 Nov 2016 12:05:12 +0100
Subject: [Buildroot] [PATCH 2/2] libcurl: Use libidn2 instead of libidn
In-Reply-To: <20161103110512.13676-1-jer@airfi.aero>
References: <20161103110512.13676-1-jer@airfi.aero>
Message-ID: <20161103110512.13676-3-jer@airfi.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 7.51.0 libcurl uses libidn2 instead of libidn

Signed-off-by: Jeroen Roovers <jer@airfi.aero>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d60000a..f5433ef 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -9,7 +9,7 @@ LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
-	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
+	$(if $(BR2_PACKAGE_LIBIDN2),libidn2) \
 	$(if $(BR2_PACKAGE_RTMPDUMP),rtmpdump)
 LIBCURL_LICENSE = ISC
 LIBCURL_LICENSE_FILES = COPYING
-- 
2.10.2
