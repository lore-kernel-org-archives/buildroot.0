From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 21:39:08 +0100
Subject: [Buildroot] [git commit] package/crda: disable broken toolchains on
	nios2
Message-ID: <20141203222237.8376D7FBBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=767764ef908f37d9e3e393e7bdd052a6e7d45d18
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
 package/crda/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/crda/Config.in b/package/crda/Config.in
index f67ea77..4d01530 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -7,7 +7,8 @@ config BR2_PACKAGE_CRDA
 	# regdb is a runtime dependency
 	select BR2_PACKAGE_WIRELESS_REGDB
 	# Triggers the _gp link issue
-	depends on !BR2_nios2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  Central Regulatory Domain Agent.
 
@@ -20,4 +21,5 @@ config BR2_PACKAGE_CRDA
 
 comment "crda needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
-	depends on !BR2_nios2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
