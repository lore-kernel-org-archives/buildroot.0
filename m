From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:40:25 +0100
Subject: [Buildroot] [PATCH 2/4 v2] package/haserl: do not select Lua,
	depend on it
In-Reply-To: <cover.1450391976.git.yann.morin.1998@free.fr>
References: <cover.1450391976.git.yann.morin.1998@free.fr>
Message-ID: <c1ea640d961ac9548f7c858d1096c6f6152e7593.1450391976.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lua is a provider for the virtual package lua-interpreter, so it cannot
be selected, as explained in the manual.

Turn the 'select' into a 'depends on'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: I haven't check if haserl could use luajit instead of Lua. This
change is just a mechanical change.

---
changes v1 -> v2:
  - drop comment  (Thomas)
---
 package/haserl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 1620d72..9ccc392 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_HASERL
 config BR2_PACKAGE_HASERL_WITH_LUA
 	bool "Lua support"
 	depends on BR2_PACKAGE_HASERL
-	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LUA
 	help
 	  Enable Lua support for haserl
-- 
1.9.1
