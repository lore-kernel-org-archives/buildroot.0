From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:21:31 +0200
Subject: [Buildroot] [git commit] package/kyua: add atf reverse dependency
Message-ID: <20150726132135.9F45E819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9dcccd18eca93e1384ac55f6c254625dcf814b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

atf package depends on BR2_USE_MMU, therefore kyua must
also depend on it.

Fixes:
http://autobuild.buildroot.net/results/929/9290a39d9b77e5a57e59912ce3d901149e9d6c11/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kyua/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
