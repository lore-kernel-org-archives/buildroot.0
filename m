From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 12:11:20 +0200
Subject: [Buildroot] [git commit] zmqpp: update to use the gcc version
	dependency mechanism
Message-ID: <20150805101202.37091819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=634b714d972590fe095736f5833e6671da8cf02b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates the zmqpp Config.in file to use the newly
introduced gcc version dependency mechanism to depend on gcc >= 4.6
instead of open-coding dependencies on specific toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/zmqpp/Config.in |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 0aaeda3..756c810 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_ZMQPP
 	bool "zmqpp"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Too old gcc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Too old gcc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # c++0x support
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # c++0x support
+	# c++0x support
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
@@ -17,9 +14,9 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp needs a toolchain w/ C++, wchar, threads"
+comment "zmqpp needs a toolchain w/ C++, wchar, threads, gcc >= 4.6"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_HAS_THREADS)
+		BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_6)
 
 if BR2_PACKAGE_ZMQPP
 
