From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Nov 2014 17:48:52 +0100
Subject: [Buildroot] [PATCH 1/3] package/aiccu: disable broken toolchains on
	nios2
Message-ID: <1417366134-2098-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed with Thomas
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/100998
only the current toolchains are broken:
"it's better to blacklist the individual toolchains that are known
to be broken, so that if we add another toolchain, we will be able
to see if the same bug happens as well or not."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/aiccu/Config.in |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index 51e5fb7..ce5cea6 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -11,7 +11,8 @@ config BR2_PACKAGE_AICCU
 	# toolchains.
 	depends on !BR2_avr32
 	# Triggers the _gp link issue
-	depends on !BR2_nios2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
@@ -31,4 +32,5 @@ comment "aiccu needs a toolchain w/ IPv6, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 	depends on !BR2_avr32
-	depends on !BR2_nios2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-- 
1.7.10.4
