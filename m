From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 29 Nov 2013 08:18:34 +0000
Subject: [Buildroot] [PATCH] lua-ev: disable on avr32 and blackfin
Message-ID: <1385713114-3847-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

lua-ev is a reverse dependency of libev, but the architecture filtering is
not propagated. Fixes autobuild failure such as the following.

  http://autobuild.buildroot.net/results/387/38704a4362ab6c3458c45603975b274937059fa9/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/lua-ev/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
index 1e89c27..4f704ad 100644
--- a/package/lua-ev/Config.in
+++ b/package/lua-ev/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUA_EV
 	bool "lua-ev"
 	select BR2_PACKAGE_LIBEV
+	depends on !(BR2_avr32 || BR2_bfin) # libev
 	help
 	  Get access to the libev library from Lua.
 
-- 
1.8.3.2
