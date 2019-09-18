From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 18 Sep 2019 08:19:12 +0200
Subject: [Buildroot] [pkg-luarocks 3/6] pkg-luarocks: regen packages with
 external dependencies
In-Reply-To: <20190918061915.31250-1-francois.perrad@gadz.org>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
Message-ID: <20190918061915.31250-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsqlite3/lsqlite3.mk             | 1 +
 package/lua-curl/lua-curl.mk             | 1 +
 package/lua-flu/lua-flu.mk               | 3 +++
 package/lua-iconv/lua-iconv.mk           | 1 +
 package/luadbi-sqlite3/luadbi-sqlite3.mk | 1 +
 package/luaexpat/luaexpat.mk             | 1 +
 package/luaossl/luaossl.mk               | 3 +++
 package/luasec/luasec.mk                 | 1 +
 package/luasql-sqlite3/luasql-sqlite3.mk | 1 +
 package/wsapi-fcgi/wsapi-fcgi.mk         | 1 +
 10 files changed, 14 insertions(+)

diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index bbf6a1db1..51f9516fd 100644
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -8,5 +8,6 @@ LSQLITE3_VERSION = 0.9.5-1
 LSQLITE3_SUBDIR = lsqlite3_fsl09y
 LSQLITE3_LICENSE = MIT
 LSQLITE3_DEPENDENCIES = sqlite
+LSQLITE3_BUILD_OPTS = SQLITE_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
index d887cb511..13b1d6d9f 100644
--- a/package/lua-curl/lua-curl.mk
+++ b/package/lua-curl/lua-curl.mk
@@ -10,5 +10,6 @@ LUA_CURL_SUBDIR = Lua-cURLv3-$(LUA_CURL_VERSION_UPSTREAM)
 LUA_CURL_LICENSE = MIT
 LUA_CURL_LICENSE_FILES = $(LUA_CURL_SUBDIR)/LICENSE
 LUA_CURL_DEPENDENCIES = libcurl
+LUA_CURL_BUILD_OPTS = CURL_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
diff --git a/package/lua-flu/lua-flu.mk b/package/lua-flu/lua-flu.mk
index 4c7b76547..0c65e6da6 100644
--- a/package/lua-flu/lua-flu.mk
+++ b/package/lua-flu/lua-flu.mk
@@ -10,5 +10,8 @@ LUA_FLU_SUBDIR = doub-flu-63f077a988cd
 LUA_FLU_LICENSE = MIT
 LUA_FLU_LICENSE_FILES = $(LUA_FLU_SUBDIR)/doc/LICENSE.txt
 LUA_FLU_DEPENDENCIES = attr libfuse
+LUA_FLU_BUILD_OPTS = \
+	ATTR_DIR="$(STAGING_DIR)/usr" \
+	FUSE_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
index ea8e0dd8b..ea0cca29b 100644
--- a/package/lua-iconv/lua-iconv.mk
+++ b/package/lua-iconv/lua-iconv.mk
@@ -8,5 +8,6 @@ LUA_ICONV_VERSION = 7-1
 LUA_ICONV_LICENSE = MIT
 LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
 LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LUA_ICONV_BUILD_OPTS = ICONV_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.mk b/package/luadbi-sqlite3/luadbi-sqlite3.mk
index 4ae2b5cf3..755803c43 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.mk
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.mk
@@ -9,5 +9,6 @@ LUADBI_SQLITE3_SUBDIR = luadbi
 LUADBI_SQLITE3_LICENSE = MIT
 LUADBI_SQLITE3_LICENSE_FILES = $(LUADBI_SQLITE3_SUBDIR)/COPYING
 LUADBI_SQLITE3_DEPENDENCIES = sqlite
+LUADBI_SQLITE3_BUILD_OPTS = SQLITE_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 8c86b24f2..74533385c 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -8,5 +8,6 @@ LUAEXPAT_VERSION = 1.3.3-1
 LUAEXPAT_LICENSE = MIT
 LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
 LUAEXPAT_DEPENDENCIES = expat
+LUAEXPAT_BUILD_OPTS = EXPAT_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index 128c320d1..8a636dc74 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -10,5 +10,8 @@ LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
 LUAOSSL_LICENSE_FILES = $(LUAOSSL_SUBDIR)/LICENSE
 LUAOSSL_DEPENDENCIES = openssl
+LUAOSSL_BUILD_OPTS = \
+	CRYPTO_DIR="$(STAGING_DIR)/usr" \
+	OPENSSL_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 9ce358753..e338bb74a 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -10,5 +10,6 @@ LUASEC_SUBDIR = luasec-luasec-$(LUASEC_VERSION_UPSTREAM)
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
 LUASEC_DEPENDENCIES = openssl
+LUASEC_BUILD_OPTS = OPENSSL_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
index 69fc956c9..bcb8676af 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.mk
+++ b/package/luasql-sqlite3/luasql-sqlite3.mk
@@ -9,5 +9,6 @@ LUASQL_SQLITE3_SUBDIR = luasql
 LUASQL_SQLITE3_LICENSE = MIT
 LUASQL_SQLITE3_LICENSE_FILES = $(LUASQL_SQLITE3_SUBDIR)/doc/us/license.html
 LUASQL_SQLITE3_DEPENDENCIES = sqlite
+LUASQL_SQLITE3_BUILD_OPTS = SQLITE_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
diff --git a/package/wsapi-fcgi/wsapi-fcgi.mk b/package/wsapi-fcgi/wsapi-fcgi.mk
index 677bb774b..d1cb06f79 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.mk
+++ b/package/wsapi-fcgi/wsapi-fcgi.mk
@@ -11,5 +11,6 @@ WSAPI_FCGI_LICENSE_FILES = \
 	$(WSAPI_FCGI_SUBDIR)/doc/us/license.html \
 	$(WSAPI_FCGI_SUBDIR)/doc/us/license.md
 WSAPI_FCGI_DEPENDENCIES = libfcgi
+WSAPI_FCGI_BUILD_OPTS = FASTCGI_DIR="$(STAGING_DIR)/usr"
 
 $(eval $(luarocks-package))
-- 
2.20.1
