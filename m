From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:15:36 +0200
Subject: [Buildroot] [git commit] package/icu: needs host gcc >= 4.8
Message-ID: <20170606201548.CFC9082A73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87f43c34032c5a4efbc610bfdd279c9f275be9af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/2b3/2b3a9be1780857db8827ea70df9d8699116a5df7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/icu/Config.in b/package/icu/Config.in
index 32f35b9..fde486b 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ICU
 	bool "icu"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -26,8 +27,9 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 
 endif
 
-comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8
