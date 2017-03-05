From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:02:13 +0100
Subject: [Buildroot] [git commit] lua-cjson: use LUA_CJSON_SUBDIR
Message-ID: <20170305210518.D2940821E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f74064f40602c89af994fd4f1a9942c331e2e85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The infra sets _SUBDIR to the correct value, so we can use it to define
_LICENSE_FILES.

This removes the need for LUA_CJSON_VERSION_UPSTREAM.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-cjson/lua-cjson.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lua-cjson/lua-cjson.mk b/package/lua-cjson/lua-cjson.mk
index 16cb974..1823aa5 100644
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
