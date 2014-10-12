From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 12:43:06 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 0.8.3
Message-ID: <20141012104339.AEEDEB23B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c706ae2117d56a02e305886eb730932d25434c41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 0.8.2 upmpdcli builds with gcc >= 4.5. This allows compilation
with the CodeSourcery toolchain versions 2011.03 and 2010.09 for the PowerPC
architecture.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/Config.in   |    2 --
 package/upmpdcli/upmpdcli.mk |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index e99fddb..dbbc9b5 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE # libupnp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Too old gcc
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 0d18dc1..88a5a16 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.8.2
+UPMPDCLI_VERSION = 0.8.3
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
