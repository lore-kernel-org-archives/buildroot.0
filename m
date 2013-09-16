From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Sep 2013 13:52:55 -0300
Subject: [Buildroot] [PATCH 6/6] luaposix: bump to version 31
In-Reply-To: <1379350375-18843-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379350375-18843-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1379350375-18843-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Releases are no longer named 5.1.X, just the X portion remains now.

Fixes autoreconf issues with the automake bump, however since the patch
is no longer required that's not an issue now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/luaposix/luaposix-remove-lua-header-check.patch | 16 ----------------
 package/luaposix/luaposix.mk                            |  6 +++---
 2 files changed, 3 insertions(+), 19 deletions(-)
 delete mode 100644 package/luaposix/luaposix-remove-lua-header-check.patch

diff --git a/package/luaposix/luaposix-remove-lua-header-check.patch b/package/luaposix/luaposix-remove-lua-header-check.patch
deleted file mode 100644
index 7909b91..0000000
--- a/package/luaposix/luaposix-remove-lua-header-check.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Checking the Lua version inside the headers requires compiling a small
-C program. However, autoconf will raise an error when attempting to do so
-while cross-compiling. Hence, this specific test is removed.
-
-Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---- a/configure.ac	2013-06-20 07:23:27.943091833 +0300
-+++ b/configure.ac	2013-06-20 07:23:30.644441710 +0300
-@@ -105,7 +105,7 @@
- 
- dnl Lua 5.1 or 5.2
- AX_PROG_LUA(501, 503)
- AX_LUA_HEADERS
--AX_LUA_HEADERS_VERSION(501, 503)
-+#AX_LUA_HEADERS_VERSION(501, 503)
- AC_SUBST(LUA)
- AC_SUBST(LUA_INCLUDE)
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 1d1ee6a..ff99127 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 5.1.20
-LUAPOSIX_SITE = https://github.com/downloads/luaposix/luaposix
+LUAPOSIX_VERSION = 31
+LUAPOSIX_SITE = https://github.com/luaposix/luaposix/archive
+LUAPOSIX_SOURCE = release-v$(LUAPOSIX_VERSION).tar.gz
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
 LUAPOSIX_DEPENDENCIES = lua host-lua
 LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
-LUAPOSIX_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.8.1.5
