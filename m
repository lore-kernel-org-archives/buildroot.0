From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:44 +0100
Subject: [Buildroot] [PATCH 22/25] lua-cjson: use LUA_CJSON_SUBDIR
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-23-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The infra sets _SUBDIR to the correct value, so we can use it to define
_LICENSE_FILES.

This removes the need for LUA_CJSON_VERSION_UPSTREAM.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua-cjson/lua-cjson.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lua-cjson/lua-cjson.mk b/package/lua-cjson/lua-cjson.mk
index 16cb97412a..1823aa50de 100644
--- a/package/lua-cjson/lua-cjson.mk
+++ b/package/lua-cjson/lua-cjson.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LUA_CJSON_VERSION_UPSTREAM = 2.1.0
-LUA_CJSON_VERSION = $(LUA_CJSON_VERSION_UPSTREAM)-1
+LUA_CJSON_VERSION = 2.1.0-1
 LUA_CJSON_LICENSE = MIT
-LUA_CJSON_LICENSE_FILES = lua-cjson-$(LUA_CJSON_VERSION_UPSTREAM)/LICENSE
+LUA_CJSON_LICENSE_FILES = $(LUA_CJSON_SUBDIR)/LICENSE
 
 $(eval $(luarocks-package))
-- 
2.11.0
