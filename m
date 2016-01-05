From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2016 11:50:16 +0100
Subject: [Buildroot] [git commit] package/libupnpp: needs at least gcc 4.6
Message-ID: <20160105105152.0926282716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60d4be3ea69be15a04902073445002fdcaa99d72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.13.1 of libupnpp uses range-based for loops. This C++11 feature
requires at least gcc 4.6.

Fixes:
http://autobuild.buildroot.net/results/aa9/aa93ff96305a3b201636bea65f1cfdb6db6d3dfb/
http://autobuild.buildroot.net/results/d8b/d8b96987a5336a64857817ec9831b0fb12867e7c/
http://autobuild.buildroot.net/results/408/40807fe84f67961817b6592a6df243c036cf3b4b/
http://autobuild.buildroot.net/results/408/40807fe84f67961817b6592a6df243c036cf3b4b/
.. and many more

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnpp/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 1dfd3c7..17a3391 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBUPNPP
 	select BR2_PACKAGE_LIBUPNP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	# Triggers the _gp link issue
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
@@ -14,6 +14,6 @@ config BR2_PACKAGE_LIBUPNPP
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "libupnpp needs a toolchain w/ C++, threads, gcc >= 4.5"
+comment "libupnpp needs a toolchain w/ C++, threads, gcc >= 4.6"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
