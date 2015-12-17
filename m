From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:06:35 +0100
Subject: [Buildroot] [PATCH 3/4] package/lighttpd: do not select Lua,
	depend on it
In-Reply-To: <cover.1450389598.git.yann.morin.1998@free.fr>
References: <cover.1450389598.git.yann.morin.1998@free.fr>
Message-ID: <146648d141367982800222903640d936e4beaafa.1450389598.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lua is a provider for the virtual package lua-interpreter, so it cannot
be selected, as explained in the manual.

Turn the 'select' into a 'depends on'; add a comment when Lua is not
enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: I haven't check if lighttpd could use luajit instead of Lua. This
change is just a mechanical change.
---
 package/lighttpd/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 2c101e7..fbb9747 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -52,8 +52,11 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
-	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LUA
 	help
 	  Enable Lua support. Needed to support mod_magnet
 
+comment "lua support needs the Lua interpreter"
+	depends on !BR2_PACKAGE_LUA
+
 endif
-- 
1.9.1
