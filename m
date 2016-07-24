From: Jordan Yelloz <jordan@yelloz.me>
Date: Sun, 24 Jul 2016 16:27:38 -0700
Subject: [Buildroot] [PATCH 3/4] swupdate: improved help text for Lua support
In-Reply-To: <20160724232739.14132-1-jordan@yelloz.me>
References: <20160724232739.14132-1-jordan@yelloz.me>
Message-ID: <20160724232739.14132-4-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It now explains limitations of building against Lua < 5.2 interpreters
and how to link to LuaJIT library.

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/swupdate/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index d7217af1c47f..85dde4eb0bc5 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -19,7 +19,11 @@ config BR2_PACKAGE_SWUPDATE
 	  use your own modified configuration, you have to select the
 	  necessary packages manually:
 
-	  * Select BR2_PACKAGE_LUA if you want to have Lua support.
+	  * Select BR2_PACKAGE_LUA or BR2_PACKAGE_LUAJIT if you want to have Lua
+	    support.
+	    CONFIG_HANDLER_IN_LUA is not supported in LuaJIT or Lua 5.1.
+	    swupdate must be manually configured with CONFIG_LUAVERSION="jit-5.1"
+	    to link against luajit.
 	  * Select BR2_LIBCURL if you want to use the download feature.
 	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption support.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
-- 
2.9.2
