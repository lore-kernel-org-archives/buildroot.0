From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 21:53:16 +0200
Subject: [Buildroot] [git commit] shairport-sync: requires C++
Message-ID: <20170329195320.53AF3821FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11c595c8eae56326ed5ef0d8e2dac7551cff98fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/122/122d6cedf0205e8db27d498d6a2a839e11e7b6f2/
http://autobuild.buildroot.net/results/bef/bef5fb328e6688107496cb213d8aeeca527abf03/

Cc: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shairport-sync/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index d70121b..c2a5565 100644
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
