From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 14:48:19 +0200
Subject: [Buildroot] [git commit] botan: needs std::future
Message-ID: <20180908124730.8B5BA7FEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfdfd97e107545e67277bb96ddd1d0af00039cef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/d63f70340d1297ad96c20144e658f0e4587a90ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 6fe818bc6d..3632a1a1c2 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	help
 	  Botan is a crypto library for C++
 
@@ -20,3 +21,7 @@ comment "botan needs a toolchain w/ C++, threads, gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+
+comment "botan needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
