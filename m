From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 12:07:36 +0200
Subject: [Buildroot] [git commit] package/aircrack-ng: needs dynamic library
 support
Message-ID: <20180805100129.455388B42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f47f2542fbb0e4057695499f815267d3c1ebe92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/611/61170d12811c70037ee875434a295ac35a2a5c50/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aircrack-ng/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 9e691e7f89..f3e2bc4ef1 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  A set of tools for auditing wireless networks
@@ -12,6 +13,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 
 	  http://www.aircrack-ng.org/
 
-comment "aircrack-ng needs a toolchain w/ threads, C++"
+comment "aircrack-ng needs a toolchain w/ dynamic library, threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_INSTALL_LIBSTDCPP
