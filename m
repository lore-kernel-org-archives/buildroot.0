From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 21:41:51 +0200
Subject: [Buildroot] [git commit] swupdate: improved help text for Lua
	support
Message-ID: <20161025194202.1C69D81DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02549bd9182f9d333dc47682d51c277786001467
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It now explains limitations of building against Lua < 5.2 interpreters
and how to link to LuaJIT library.

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index d7217af..d9ef1bc 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -19,7 +19,11 @@ config BR2_PACKAGE_SWUPDATE
 	  use your own modified configuration, you have to select the
 	  necessary packages manually:
 
-	  * Select BR2_PACKAGE_LUA if you want to have Lua support.
+	  * Select BR2_PACKAGE_LUA or BR2_PACKAGE_LUAJIT if you want
+	    to have Lua support.
+	    CONFIG_HANDLER_IN_LUA is not supported in LuaJIT or Lua 5.1.
+	    Note that for LuaJIT support, you need to set
+	    CONFIG_LUAVERSION="jit-5.1".
 	  * Select BR2_LIBCURL if you want to use the download feature.
 	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption support.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
