From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:06:33 +0100
Subject: [Buildroot] [PATCH 1/4] package/dnsmasq: do not select Lua,
	depend on it
In-Reply-To: <cover.1450389598.git.yann.morin.1998@free.fr>
References: <cover.1450389598.git.yann.morin.1998@free.fr>
Message-ID: <42b88076d63c1a1043ee22090f819d1ad09df1d0.1450389598.git.yann.morin.1998@free.fr>
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
Note: I haven't check if dnsmasq could use luajit instead of Lua. This
change is just a mechanical change.
---
 package/dnsmasq/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 9e1c462..e8028d8 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -38,10 +38,13 @@ config BR2_PACKAGE_DNSMASQ_IDN
 
 config BR2_PACKAGE_DNSMASQ_LUA
 	bool "Lua scripting support"
-	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_LUA
 	help
 	  Enable Lua scripting for dnsmasq
 
+comment "Lau scripting support needs the Lua interpreter"
+	depends on !BR2_PACKAGE_LUA
+
 config BR2_PACKAGE_DNSMASQ_CONNTRACK
 	bool "conntrack marking support"
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
-- 
1.9.1
