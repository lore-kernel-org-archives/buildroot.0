From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:32 +0100
Subject: [Buildroot] [PATCH 10/25] lua-iconv: remove default definition of
	PKG_SUBDIR
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-11-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luarocks infra already provides the correct default value for
PKG_SUBDIR, so it doesn't have to be defined in the .mk file.

Therefore, _VERSION_UPSTREAM doesn't need to be defined either.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua-iconv/lua-iconv.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
index f0afa2b85e..dd7533af59 100644
--- a/package/lua-iconv/lua-iconv.mk
+++ b/package/lua-iconv/lua-iconv.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-LUA_ICONV_VERSION_UPSTREAM = 7
-LUA_ICONV_VERSION = $(LUA_ICONV_VERSION_UPSTREAM)-1
-LUA_ICONV_SUBDIR  = lua-iconv-$(LUA_ICONV_VERSION_UPSTREAM)
+LUA_ICONV_VERSION = 7-1
 LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LUA_ICONV_LICENSE = MIT
 LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
-- 
2.11.0
