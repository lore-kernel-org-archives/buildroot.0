From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 23 Feb 2019 15:46:41 +0100
Subject: [Buildroot] [PATCH] lua-curl: add variant definition of lcurl_url_t
Message-ID: <20190223144641.14346-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix build http://autobuild.buildroot.org/results/8d7/8d76ad49837b368a7bba3c3dfd445a035471268a/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...dd-variant-definition-of-lcurl_url_t.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/lua-curl/0001-add-variant-definition-of-lcurl_url_t.patch

diff --git a/package/lua-curl/0001-add-variant-definition-of-lcurl_url_t.patch b/package/lua-curl/0001-add-variant-definition-of-lcurl_url_t.patch
new file mode 100644
index 000000000..0fdd0760d
--- /dev/null
+++ b/package/lua-curl/0001-add-variant-definition-of-lcurl_url_t.patch
@@ -0,0 +1,40 @@
+From 28ac0c5e642c9f7e3091a60268745f7cab4cc92b Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sat, 23 Feb 2019 15:23:26 +0100
+Subject: [PATCH] add variant definition of lcurl_url_t
+
+like in lceasy.h
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ src/lcurlapi.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/Lua-cURLv3-0.3.9/src/lcurlapi.h b/Lua-cURLv3-0.3.9/src/lcurlapi.h
+index 4dd4672..862c94f 100644
+--- a/Lua-cURLv3-0.3.9/src/lcurlapi.h
++++ b/Lua-cURLv3-0.3.9/src/lcurlapi.h
+@@ -19,11 +19,20 @@
+ 
+ #if LCURL_CURL_VER_GE(7,62,0)
+ 
++#if LCURL_CC_SUPPORT_FORWARD_TYPEDEF
+ typedef struct lcurl_url_tag {
+   CURLU *url;
+ 
+   int err_mode;
+ }lcurl_url_t;
++#else
++struct lcurl_url_tag {
++  CURLU *url;
++
++  int err_mode;
++};
++#define lcurl_url_t struct lcurl_url_tag
++#endif
+ 
+ int lcurl_url_create(lua_State *L, int error_mode);
+ 
+-- 
+2.17.1
+
-- 
2.17.1
