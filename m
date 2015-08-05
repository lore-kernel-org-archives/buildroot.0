From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 12:11:20 +0200
Subject: [Buildroot] [git commit] libupnpp: update to use the gcc version
	dependency mechanism
Message-ID: <20150805101202.4BA3F819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8eb98fc0c710f738a28849a5cc387dd03bd60faf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit changes the libupnp Config.in to use the gcc version
dependency mechanism. The only reverse dependency of libupnpp is
upmpdcli, which has already been updated, and requires >= 4.6, while
libupnpp only requires >= 4.5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libupnpp/Config.in |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index a0565fe..8af0cda 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -5,9 +5,7 @@ config BR2_PACKAGE_LIBUPNPP
 	select BR2_PACKAGE_LIBUPNP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	# Triggers the _gp link issue
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
@@ -17,10 +15,7 @@ config BR2_PACKAGE_LIBUPNPP
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "libupnpp needs a toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+comment "libupnpp needs a toolchain w/ C++, threads, gcc >= 4.5"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
