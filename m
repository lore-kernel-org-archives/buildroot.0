From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 13:33:39 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: requires GCC 4.7
Message-ID: <20160917114306.549ED817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abd4d29c8bb230a7d91123e8162ec7606f917a20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

upmpdcli now uses C++11 features, meaning the minimum usable GCC version
is 4.7.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index e17330c..b075d7a 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_LIBUPNPP
 	help
@@ -13,6 +13,6 @@ config BR2_PACKAGE_UPMPDCLI
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.6"
+comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
