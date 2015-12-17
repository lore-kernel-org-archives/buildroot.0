From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:06:34 +0100
Subject: [Buildroot] [PATCH 2/4] package/haserl: do not select Lua,
	depend on it
In-Reply-To: <cover.1450389598.git.yann.morin.1998@free.fr>
References: <cover.1450389598.git.yann.morin.1998@free.fr>
Message-ID: <c070bcbf899e8a3f1ae7c942a3d9217562cb7caf.1450389598.git.yann.morin.1998@free.fr>
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
cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: I haven't check if haserl could use luajit instead of Lua. This
change is just a mechanical change.
---
 package/haserl/Config.in | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 1620d72..0d8f4e0 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -8,9 +8,15 @@ config BR2_PACKAGE_HASERL
 
 	  http://haserl.sourceforge.net/
 
+if BR2_PACKAGE_HASERL
+
 config BR2_PACKAGE_HASERL_WITH_LUA
 	bool "Lua support"
-	depends on BR2_PACKAGE_HASERL
-	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LUA
 	help
 	  Enable Lua support for haserl
+
+comment "Lua support needs the Lua interpreter"
+	depends on !BR2_PACKAGE_LUA
+
+endif
-- 
1.9.1
