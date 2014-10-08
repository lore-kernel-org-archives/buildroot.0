From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Oct 2014 21:33:34 +0200
Subject: [Buildroot] [PATCH] botan: limit to supported CPU architectures
Message-ID: <1412796814-12333-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See src/build-data/arch/ for the list of supported CPU architectures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/botan/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 4911872..b9e2e3a 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -1,6 +1,13 @@
+config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k    || \
+		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		BR2_powerpc || BR2_powerpc64 || BR2_sparc || BR2_sh  || \
+		BR2_x86_64
+
 config BR2_PACKAGE_BOTAN
 	bool "botan"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	help
 	  Botan is a crypto library for C++
 
@@ -8,3 +15,4 @@ config BR2_PACKAGE_BOTAN
 
 comment "botan needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-- 
2.0.0
