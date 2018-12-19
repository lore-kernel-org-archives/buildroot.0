From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 19 Dec 2018 09:17:04 +0100
Subject: [Buildroot] [PATCH v3] lua*: regeneration of *.mk files
In-Reply-To: <20181219081707.1983-1-francois.perrad@gadz.org>
References: <20181219081707.1983-1-francois.perrad@gadz.org>
Message-ID: <20181219081707.1983-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/argparse/argparse.mk             | 3 +--
 package/copas/copas.mk                   | 2 +-
 package/lsqlite3/lsqlite3.mk             | 2 +-
 package/lua-basexx/lua-basexx.mk         | 4 +---
 package/lua-fifo/lua-fifo.mk             | 4 ++--
 package/lua-flu/lua-flu.mk               | 2 +-
 package/lua-iconv/lua-iconv.mk           | 2 +-
 package/lua-markdown/lua-markdown.mk     | 2 +-
 package/lua-sailor/lua-sailor.mk         | 2 +-
 package/luadbi-sqlite3/luadbi-sqlite3.mk | 2 +-
 package/luadbi/luadbi.mk                 | 2 +-
 package/luaexpat/luaexpat.mk             | 2 +-
 package/luafilesystem/luafilesystem.mk   | 4 ++--
 package/orbit/orbit.mk                   | 7 ++++---
 package/wsapi-fcgi/wsapi-fcgi.mk         | 6 ++++--
 package/wsapi-xavante/wsapi-xavante.mk   | 4 +++-
 package/wsapi/wsapi.mk                   | 4 +++-
 17 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/package/argparse/argparse.mk b/package/argparse/argparse.mk
index 2b0094ddb..04c46b527 100644
--- a/package/argparse/argparse.mk
+++ b/package/argparse/argparse.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-ARGPARSE_VERSION_UPSTREAM = 0.6.0
-ARGPARSE_VERSION = $(ARGPARSE_VERSION_UPSTREAM)-1
+ARGPARSE_VERSION = 0.6.0-1
 ARGPARSE_SUBDIR = argparse
 ARGPARSE_LICENSE = MIT
 ARGPARSE_LICENSE_FILES = $(ARGPARSE_SUBDIR)/LICENSE
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 988692c4a..5b7ba9997 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -7,6 +7,6 @@
 COPAS_VERSION = 2.0.2-1
 COPAS_SUBDIR = copas-2_0_2
 COPAS_LICENSE = MIT
-COPAS_LICENSE_FILES = $(COPAS_SUBDIR)/doc/us/license.html
+COPAS_LICENSE_FILES = $(COPAS_SUBDIR)/LICENSE
 
 $(eval $(luarocks-package))
diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index f5b91815f..bbf6a1db1 100644
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -6,7 +6,7 @@
 
 LSQLITE3_VERSION = 0.9.5-1
 LSQLITE3_SUBDIR = lsqlite3_fsl09y
-LSQLITE3_DEPENDENCIES = sqlite
 LSQLITE3_LICENSE = MIT
+LSQLITE3_DEPENDENCIES = sqlite
 
 $(eval $(luarocks-package))
diff --git a/package/lua-basexx/lua-basexx.mk b/package/lua-basexx/lua-basexx.mk
index bfdc1e27b..5aa5ecf21 100644
--- a/package/lua-basexx/lua-basexx.mk
+++ b/package/lua-basexx/lua-basexx.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-LUA_BASEXX_VERSION_UPSTREAM =0.4.0
-LUA_BASEXX_VERSION = $(LUA_BASEXX_VERSION_UPSTREAM)-1
+LUA_BASEXX_VERSION = 0.4.0-1
 LUA_BASEXX_NAME_UPSTREAM = basexx
-LUA_BASEXX_SUBDIR = basexx-$(LUA_BASEXX_VERSION_UPSTREAM)
 LUA_BASEXX_LICENSE = MIT
 LUA_BASEXX_LICENSE_FILES = $(LUA_BASEXX_SUBDIR)/LICENSE
 
diff --git a/package/lua-fifo/lua-fifo.mk b/package/lua-fifo/lua-fifo.mk
index 875b89577..8b15fc1fc 100644
--- a/package/lua-fifo/lua-fifo.mk
+++ b/package/lua-fifo/lua-fifo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUA_FIFO_VERSION_UPSTREAM =0.2
-LUA_FIFO_VERSION =$(LUA_FIFO_VERSION_UPSTREAM)-0
+LUA_FIFO_VERSION_UPSTREAM = 0.2
+LUA_FIFO_VERSION = $(LUA_FIFO_VERSION_UPSTREAM)-0
 LUA_FIFO_NAME_UPSTREAM = fifo
 LUA_FIFO_SUBDIR = fifo.lua-$(LUA_FIFO_VERSION_UPSTREAM)
 LUA_FIFO_LICENSE = MIT
diff --git a/package/lua-flu/lua-flu.mk b/package/lua-flu/lua-flu.mk
index 7cfea8e6d..c01a4848c 100644
--- a/package/lua-flu/lua-flu.mk
+++ b/package/lua-flu/lua-flu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUA_FLU_VERSION = 20150331-1
-LUA_FLU_NAME_UPSTREAM = flu
+LUA_FLU_NAME_UPSTREAM = Flu
 LUA_FLU_SUBDIR = doub-flu-a7daae986339
 LUA_FLU_LICENSE = MIT
 LUA_FLU_LICENSE_FILES = $(LUA_FLU_SUBDIR)/doc/LICENSE.txt
diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
index dd7533af5..ea8e0dd8b 100644
--- a/package/lua-iconv/lua-iconv.mk
+++ b/package/lua-iconv/lua-iconv.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LUA_ICONV_VERSION = 7-1
-LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LUA_ICONV_LICENSE = MIT
 LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
+LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 $(eval $(luarocks-package))
diff --git a/package/lua-markdown/lua-markdown.mk b/package/lua-markdown/lua-markdown.mk
index a98f3125a..d35f8be83 100644
--- a/package/lua-markdown/lua-markdown.mk
+++ b/package/lua-markdown/lua-markdown.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUA_MARKDOWN_VERSION = 0.33-1
-LUA_MARKDOWN_NAME_UPSTREAM = markdown
+LUA_MARKDOWN_NAME_UPSTREAM = Markdown
 LUA_MARKDOWN_SUBDIR = markdown
 LUA_MARKDOWN_LICENSE = MIT
 LUA_MARKDOWN_LICENSE_FILES = $(LUA_MARKDOWN_SUBDIR)/LICENSE
diff --git a/package/lua-sailor/lua-sailor.mk b/package/lua-sailor/lua-sailor.mk
index 17fbd7c61..f88e03591 100644
--- a/package/lua-sailor/lua-sailor.mk
+++ b/package/lua-sailor/lua-sailor.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUA_SAILOR_VERSION = 0.5-4
-LUA_SAILOR_NAME_UPSTREAM = sailor
+LUA_SAILOR_NAME_UPSTREAM = Sailor
 LUA_SAILOR_SUBDIR = sailor
 LUA_SAILOR_LICENSE = MIT
 LUA_SAILOR_LICENSE_FILES = $(LUA_SAILOR_SUBDIR)/LICENSE
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.mk b/package/luadbi-sqlite3/luadbi-sqlite3.mk
index 422fa1e31..44cf4d107 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.mk
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LUADBI_SQLITE3_VERSION = 0.6-2
-LUADBI_SQLITE3_LICENSE = MIT
 LUADBI_SQLITE3_SUBDIR = luadbi
+LUADBI_SQLITE3_LICENSE = MIT
 LUADBI_SQLITE3_LICENSE_FILES = $(LUADBI_SQLITE3_SUBDIR)/COPYING
 LUADBI_SQLITE3_DEPENDENCIES = sqlite
 
diff --git a/package/luadbi/luadbi.mk b/package/luadbi/luadbi.mk
index 268e0e628..969c01ee2 100644
--- a/package/luadbi/luadbi.mk
+++ b/package/luadbi/luadbi.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LUADBI_VERSION = 0.6-2
-LUADBI_LICENSE = MIT
 LUADBI_SUBDIR = luadbi
+LUADBI_LICENSE = MIT
 LUADBI_LICENSE_FILES = $(LUADBI_SUBDIR)/COPYING
 
 $(eval $(luarocks-package))
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 2b715bc0a..8c86b24f2 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LUAEXPAT_VERSION = 1.3.3-1
-LUAEXPAT_DEPENDENCIES = expat
 LUAEXPAT_LICENSE = MIT
 LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
+LUAEXPAT_DEPENDENCIES = expat
 
 $(eval $(luarocks-package))
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index bde04267c..37f265e2b 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LUAFILESYSTEM_VERSION = 1.7.0-2
-LUAFILESYSTEM_LICENSE = MIT
-LUAFILESYSTEM_LICENSE_FILES = luafilesystem/LICENSE
 LUAFILESYSTEM_SUBDIR = luafilesystem
+LUAFILESYSTEM_LICENSE = MIT
+LUAFILESYSTEM_LICENSE_FILES = $(LUAFILESYSTEM_SUBDIR)/LICENSE
 
 $(eval $(luarocks-package))
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index 3329439db..77549a28c 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-ORBIT_VERSION_UPSTREAM = 2.2.4
-ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-1
+ORBIT_VERSION = 2.2.4-1
 ORBIT_SUBDIR = orbit
 ORBIT_LICENSE = MIT
-ORBIT_LICENSE_FILES = $(ORBIT_SUBDIR)/doc/us/license.md
+ORBIT_LICENSE_FILES = \
+    $(ORBIT_SUBDIR)/doc/us/license.html \
+    $(ORBIT_SUBDIR)/doc/us/license.md
 
 $(eval $(luarocks-package))
diff --git a/package/wsapi-fcgi/wsapi-fcgi.mk b/package/wsapi-fcgi/wsapi-fcgi.mk
index 946f137dc..d94721e4e 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.mk
+++ b/package/wsapi-fcgi/wsapi-fcgi.mk
@@ -6,8 +6,10 @@
 
 WSAPI_FCGI_VERSION = 1.7-1
 WSAPI_FCGI_SUBDIR = wsapi
-WSAPI_FCGI_DEPENDENCIES = libfcgi
 WSAPI_FCGI_LICENSE = MIT
-WSAPI_FCGI_LICENSE_FILES = $(WSAPI_FCGI_SUBDIR)/doc/us/license.html
+WSAPI_FCGI_LICENSE_FILES = \
+    $(WSAPI_FCGI_SUBDIR)/doc/us/license.html \
+    $(WSAPI_FCGI_SUBDIR)/doc/us/license.md
+WSAPI_FCGI_DEPENDENCIES = libfcgi
 
 $(eval $(luarocks-package))
diff --git a/package/wsapi-xavante/wsapi-xavante.mk b/package/wsapi-xavante/wsapi-xavante.mk
index cdf160bba..46aa10651 100644
--- a/package/wsapi-xavante/wsapi-xavante.mk
+++ b/package/wsapi-xavante/wsapi-xavante.mk
@@ -7,6 +7,8 @@
 WSAPI_XAVANTE_VERSION = 1.7-1
 WSAPI_XAVANTE_SUBDIR = wsapi
 WSAPI_XAVANTE_LICENSE = MIT
-WSAPI_XAVANTE_LICENSE_FILES = $(WSAPI_XAVANTE_SUBDIR)/doc/us/license.html
+WSAPI_XAVANTE_LICENSE_FILES = \
+    $(WSAPI_XAVANTE_SUBDIR)/doc/us/license.html \
+    $(WSAPI_XAVANTE_SUBDIR)/doc/us/license.md
 
 $(eval $(luarocks-package))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index 76d2d88fe..ad62a05f5 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -7,6 +7,8 @@
 WSAPI_VERSION = 1.7-1
 WSAPI_SUBDIR = wsapi
 WSAPI_LICENSE = MIT
-WSAPI_LICENSE_FILES = $(WSAPI_SUBDIR)/doc/us/license.html
+WSAPI_LICENSE_FILES = \
+    $(WSAPI_SUBDIR)/doc/us/license.html \
+    $(WSAPI_SUBDIR)/doc/us/license.md
 
 $(eval $(luarocks-package))
-- 
2.17.1
