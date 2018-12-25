From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 25 Dec 2018 03:31:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/lua-curl: Fix define for
 lcurl_mime_t for curl 7.56.0
Message-ID: <20181225013125.31787-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove ';' at the end of #define for lcurl_mime_t, which looks like a
typo.

It fixes failing of lua-curl for build results:
http://autobuild.buildroot.net/results/f3c0c1aa8f860fddc1312823530ab369b198820c/config

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...x-define-for-lcurl_mime_t-for-curl-7.56.0.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/lua-curl/0002-lceasy.h-Fix-define-for-lcurl_mime_t-for-curl-7.56.0.patch

diff --git a/package/lua-curl/0002-lceasy.h-Fix-define-for-lcurl_mime_t-for-curl-7.56.0.patch b/package/lua-curl/0002-lceasy.h-Fix-define-for-lcurl_mime_t-for-curl-7.56.0.patch
new file mode 100644
index 0000000000..f96ad88bf7
--- /dev/null
+++ b/package/lua-curl/0002-lceasy.h-Fix-define-for-lcurl_mime_t-for-curl-7.56.0.patch
@@ -0,0 +1,29 @@
+From 2e2bc60abaf426e32e667108b27805be0f6ffeb3 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Tue, 25 Dec 2018 03:17:29 +0200
+Subject: [PATCH] lceasy.h: Fix define for lcurl_mime_t for curl >= 7.56.0
+
+Remove ';' at the end of #define for lcurl_mime_t which looks like
+a typo if it was used via 'typedef'.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ src/lceasy.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lceasy.h b/src/lceasy.h
+index d6ccefd..7c95668 100644
+--- a/Lua-cURLv3-0.3.8/src/lceasy.h
++++ b/Lua-cURLv3-0.3.8/src/lceasy.h
+@@ -47,7 +47,7 @@ struct lcurl_multi_tag;
+ #define lcurl_multi_t struct lcurl_multi_tag
+ #if LCURL_CURL_VER_GE(7,56,0)
+ struct lcurl_mime_tag;
+-#define lcurl_mime_t struct lcurl_mime_tag;
++#define lcurl_mime_t struct lcurl_mime_tag
+ #endif
+ #endif
+ 
+-- 
+2.14.1
+
-- 
2.14.1
