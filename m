From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:40:24 +0100
Subject: [Buildroot] [PATCH 1/4 v2] package/dnsmasq: do not select Lua,
	depend on it
In-Reply-To: <cover.1450391976.git.yann.morin.1998@free.fr>
References: <cover.1450391976.git.yann.morin.1998@free.fr>
Message-ID: <2f7b5dcb7130aaea8ac3cdc19381c3d9db0ebfe3.1450391976.git.yann.morin.1998@free.fr>
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
Note: I haven't check if dnsmasq could use luajit instead of Lua. This
change is just a mechanical change.

---
Changes v1 -> v2;
  - drop the comment  (Thomas)
---
 package/dnsmasq/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 9e1c462..b4f34b8 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -38,7 +38,7 @@ config BR2_PACKAGE_DNSMASQ_IDN
 
 config BR2_PACKAGE_DNSMASQ_LUA
 	bool "Lua scripting support"
-	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LUA
 	help
 	  Enable Lua scripting for dnsmasq
 
-- 
1.9.1
