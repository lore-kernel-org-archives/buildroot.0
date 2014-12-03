From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 21:32:16 +0100
Subject: [Buildroot] [git commit] package/aiccu: disable broken toolchains
	on nios2
Message-ID: <20141203222237.7A41280096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f04365ec16310ef8c2e504a7f390510ec80f4dfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed with Thomas
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/100998
only the current toolchains are broken:
"it's better to blacklist the individual toolchains that are known
to be broken, so that if we add another toolchain, we will be able
to see if the same bug happens as well or not."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aiccu/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
