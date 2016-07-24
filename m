From: Jordan Yelloz <jordan@yelloz.me>
Date: Sun, 24 Jul 2016 16:27:39 -0700
Subject: [Buildroot] [PATCH 4/4] swupdate: added a warning for LuaJIT/Lua 5.1
In-Reply-To: <20160724232739.14132-1-jordan@yelloz.me>
References: <20160724232739.14132-1-jordan@yelloz.me>
Message-ID: <20160724232739.14132-5-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/swupdate/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 85dde4eb0bc5..046903de87f5 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -55,6 +55,12 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	  This is necessary if you want to run swupdate with the embedded
 	  webserver and do not provide an own website to be installed to
 	  /var/www/swupdate.
+
+if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
+comment "swupdate cannot use CONFIG_HANDLER_IN_LUA with Lua API < 5.2."
+comment "Lua parsers and pre/post-install hooks should still work.    "
+endif
+
 endif
 
 comment "swupdate needs a toolchain w/ threads"
-- 
2.9.2
