From: Jeroen Roovers <jer@airfi.aero>
Date: Thu,  3 Nov 2016 13:56:15 +0100
Subject: [Buildroot] [PATCH v2 2/2] libcurl: Use libidn2 instead of libidn
In-Reply-To: <20161103125615.21592-1-jer@airfi.aero>
References: <20161103125615.21592-1-jer@airfi.aero>
Message-ID: <20161103125615.21592-3-jer@airfi.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2016-8625 (IDNA 2003 makes curl use wrong host) was fixed by switching from
libidn to libidn2. The advisory[1] does not mention this but the related
commit[2] does.

[1] https://curl.haxx.se/docs/adv_20161102K.html
[2] https://github.com/curl/curl/commit/9c91ec778104ae3b744b39444d544e82d5ee9ece

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
