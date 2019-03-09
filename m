From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 21:46:08 +0100
Subject: [Buildroot] [git commit] package/ncmpc: requires gcc >= 6
Message-ID: <20190309204346.A552B8E218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70e0b0565d62dd66755140f5789595c86f81d029
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following reply from upstream on build failure with gcc 5
(https://github.com/MusicPlayerDaemon/ncmpc/pull/47), enforce gcc >= 6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncmpc/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index 00639b924a..2122bf3543 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_NCMPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_LIBMPDCLIENT
@@ -16,7 +16,7 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 6"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
