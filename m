From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:40:26 +0100
Subject: [Buildroot] [PATCH 3/4 v2] package/lighttpd: do not select Lua,
	depend on it
In-Reply-To: <cover.1450391976.git.yann.morin.1998@free.fr>
References: <cover.1450391976.git.yann.morin.1998@free.fr>
Message-ID: <6cb9d95b49cc1174b87738095575444415730ad7.1450391976.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lua is a provider for the virtual package lua-interpreter, so it cannot
be selected, as explained in the manual.

Turn the 'select' into a 'depends on'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: I haven't check if lighttpd could use luajit instead of Lua. This
change is just a mechanical change.

---
Changes v1 -> v2:
  - drop comment  (Thomas)
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
 
-- 
1.9.1
