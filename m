From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:04:16 +0100
Subject: [Buildroot] [git commit] package/lighttpd: do not select Lua,
	depend on it
Message-ID: <20151218210519.A70E77FD46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83d59c805ce96b14eabe2c47fa78adc0d8d1b2ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lua is a provider for the virtual package lua-interpreter, so it cannot
be selected, as explained in the manual.

Turn the 'select' into a 'depends on'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 2c101e7..f62ccb9 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -52,7 +52,7 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
-	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LUA
 	help
 	  Enable Lua support. Needed to support mod_magnet
 
