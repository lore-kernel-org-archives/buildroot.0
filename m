From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 16 Jul 2012 15:45:48 +0200
Subject: [Buildroot] [PATCH 1/5] lua : fix autobuild.buildroot
Message-ID: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_LUA_SHARED_LIBRARY is an option for install, not for build
---
 package/lua/lua.mk |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index baa459c..2fc838b 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -8,10 +8,7 @@ LUA_VERSION = 5.1.5
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
-	LUA_MYCFLAGS += -fPIC
-endif
-
+LUA_MYCFLAGS += -fPIC
 LUA_MYLIBS += -ldl
 
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
-- 
1.7.9.5
