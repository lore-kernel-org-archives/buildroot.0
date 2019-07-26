From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 23:14:01 +0200
Subject: [Buildroot] [git commit] package/lua-curl: bump to version 0.3.10
Message-ID: <20190726211233.2E81186F4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b6907584e83f08b86fe0131a7f45aaa22c8a745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the license file is changed due to the following
modification:

-Copyright (c) 2014-2018 Alexey Melnichuk
+Copyright (c) 2014-2019 Alexey Melnichuk

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-add-variant-definition-of-lcurl_url_t.patch | 40 ----------------------
 package/lua-curl/lua-curl.hash                     |  4 +--
 package/lua-curl/lua-curl.mk                       |  2 +-
 3 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/lua-curl/0001-add-variant-definition-of-lcurl_url_t.patch b/package/lua-curl/0001-add-variant-definition-of-lcurl_url_t.patch
deleted file mode 100644
index 0fdd0760d6..0000000000
--- a/package/lua-curl/0001-add-variant-definition-of-lcurl_url_t.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 28ac0c5e642c9f7e3091a60268745f7cab4cc92b Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sat, 23 Feb 2019 15:23:26 +0100
-Subject: [PATCH] add variant definition of lcurl_url_t
-
-like in lceasy.h
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- src/lcurlapi.h | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/Lua-cURLv3-0.3.9/src/lcurlapi.h b/Lua-cURLv3-0.3.9/src/lcurlapi.h
-index 4dd4672..862c94f 100644
---- a/Lua-cURLv3-0.3.9/src/lcurlapi.h
-+++ b/Lua-cURLv3-0.3.9/src/lcurlapi.h
-@@ -19,11 +19,20 @@
- 
- #if LCURL_CURL_VER_GE(7,62,0)
- 
-+#if LCURL_CC_SUPPORT_FORWARD_TYPEDEF
- typedef struct lcurl_url_tag {
-   CURLU *url;
- 
-   int err_mode;
- }lcurl_url_t;
-+#else
-+struct lcurl_url_tag {
-+  CURLU *url;
-+
-+  int err_mode;
-+};
-+#define lcurl_url_t struct lcurl_url_tag
-+#endif
- 
- int lcurl_url_create(lua_State *L, int error_mode);
- 
--- 
-2.17.1
-
diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
index 49cd6653a5..471af2ffa3 100644
--- a/package/lua-curl/lua-curl.hash
+++ b/package/lua-curl/lua-curl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 ec761e800cec630ff0e78f100e1a61246c35823073014de65f1af0a85bfe1dc0  lua-curl-0.3.9-1.src.rock
-sha256 264807cb89f960808fed1ef9922aed9d9f8437764e836d8e594e66db7be9c54c  Lua-cURLv3-0.3.9/LICENSE
+sha256 c548d2fc5891b8eda16ea056426584474532fc22dabe4d35b459770ffb340413  lua-curl-0.3.10-1.src.rock
+sha256 3049265c5c05a5e2a40eb28dbf3fe46a51cd03e5f62cc1a419e352130e278e02  Lua-cURLv3-0.3.10/LICENSE
diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
index 9fa9408a4e..d887cb511e 100644
--- a/package/lua-curl/lua-curl.mk
+++ b/package/lua-curl/lua-curl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CURL_VERSION_UPSTREAM = 0.3.9
+LUA_CURL_VERSION_UPSTREAM = 0.3.10
 LUA_CURL_VERSION = $(LUA_CURL_VERSION_UPSTREAM)-1
 LUA_CURL_SUBDIR = Lua-cURLv3-$(LUA_CURL_VERSION_UPSTREAM)
 LUA_CURL_LICENSE = MIT
