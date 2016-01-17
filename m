From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 17 Jan 2016 12:28:27 +0100
Subject: [Buildroot] [PATCH] lighttpd: requires a Lua 5.1.x
Message-ID: <1453030107-7010-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see failure in http://autobuild.buildroot.net/results/13f/13faa9ebce00359b8943775364a432ce422fe8b8/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lighttpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index f62ccb9..2ae4e1e 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -52,7 +52,7 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
-	depends on BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LUA_5_1
 	help
 	  Enable Lua support. Needed to support mod_magnet
 
-- 
2.5.0
