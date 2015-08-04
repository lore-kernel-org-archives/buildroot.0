From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2015 20:00:38 +0200
Subject: [Buildroot] [PATCH 6/9] upmpdcli: update to use the gcc version
	dependency mechanism
In-Reply-To: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1438711241-31792-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates the upmpdcli Config.in file to use the newly
introduced gcc version dependency mechanism to depend on gcc >= 4.6
instead of open-coding dependencies on specific toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/Config.in | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 0fe3d10..848c6af 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -4,11 +4,7 @@ config BR2_PACKAGE_UPMPDCLI
 	select BR2_PACKAGE_LIBUPNPP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Ditto
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	# libupnpp triggers the _gp link issue
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
@@ -19,12 +15,7 @@ config BR2_PACKAGE_UPMPDCLI
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "upmpdcli needs a toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Ditto
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
+comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.6"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-- 
2.5.0
