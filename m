From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Mar 2017 22:09:31 +0300
Subject: [Buildroot] [PATCH] shairport-sync: requires C++
Message-ID: <208617074343a6ecf1be15a96c82bdb148d5b675.1490814571.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/122/122d6cedf0205e8db27d498d6a2a839e11e7b6f2/
http://autobuild.buildroot.net/results/bef/bef5fb328e6688107496cb213d8aeeca527abf03/

Cc: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/shairport-sync/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index d70121b9fd78..c2a5565402d6 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	bool "shairport-sync"
 	depends on BR2_USE_MMU # libdaemon
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBCONFIG
@@ -34,6 +35,6 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
 
 endif
 
-comment "shairport-sync needs a toolchain w/ NPTL"
+comment "shairport-sync needs a toolchain w/ C++, NPTL"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.11.0
