From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 20:28:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/poppler: fix libcurl support
Message-ID: <20170917182818.18868-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_POPPLER_LIBCURL is not defined in poppler/Config.in.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/poppler/poppler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 6796437776..1beb75a6a3 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -66,7 +66,7 @@ else
 POPPLER_CONF_OPTS += --disable-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_POPPLER_LIBCURL),y)
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
 POPPLER_CONF_OPTS += --enable-libcurl
 POPPLER_DEPENDENCIES += libcurl
 else
-- 
2.11.0
