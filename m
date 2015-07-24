From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 24 Jul 2015 15:24:32 +0200
Subject: [Buildroot] [PATCH] package/kyua: add atf reverse dependency
Message-ID: <1437744272-27546-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

atf package depends on BR2_USE_MMU, therefore kyua must
also depend on it.

Fixes:
http://autobuild.buildroot.net/results/929/9290a39d9b77e5a57e59912ce3d901149e9d6c11/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/kyua/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kyua/Config.in b/package/kyua/Config.in
index e1bcd48..4f887b0 100644
--- a/package/kyua/Config.in
+++ b/package/kyua/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KYUA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER # lutok
 	depends on !BR2_PACKAGE_LUAJIT # lutok
+	depends on BR2_USE_MMU # atf
 	select BR2_PACKAGE_ATF
 	select BR2_PACKAGE_LUTOK
 	select BR2_PACKAGE_SQLITE
@@ -18,3 +19,4 @@ config BR2_PACKAGE_KYUA
 comment "kyua needs a toolchain w/ C++ and full Lua"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on BR2_USE_MMU
-- 
2.4.3
