From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 24 Aug 2020 13:40:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/openfpgaloader: frop ftdipp
In-Reply-To: <20200824114028.1309375-1-fontaine.fabrice@gmail.com>
References: <20200824114028.1309375-1-fontaine.fabrice@gmail.com>
Message-ID: <20200824114028.1309375-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ftdipp is not needed since version 0.1 and
https://github.com/trabucayre/openFPGALoader/commit/3df577b70638c37885eef3a27b8931261b259e47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openfpgaloader/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index cda20b4347..5bf496627b 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -2,14 +2,11 @@ config BR2_PACKAGE_OPENFPGALOADER
 	bool "openfpgaloader"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi1
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # libftdipp1
 	select BR2_PACKAGE_LIBFTDI1
-	select BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
 	help
 	  Universal utility for programming FPGA
 
 	  https://github.com/trabucayre/openFPGALoader/
 
-comment "openfpgaloader needs a toolchain w/ threads, wchar, C++"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_INSTALL_LIBSTDCPP
+comment "openfpgaloader needs a toolchain w/ threads, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-- 
2.28.0
