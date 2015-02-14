From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 17:39:50 +0100
Subject: [Buildroot] [git commit branch/next] arch: kill avr32
Message-ID: <20150214164751.E2D2080454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a46007daa7128d316ab3f36da23828b8ab7aaf58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

avr32 was slated for removal in 2015.02. Make it so!

This patch only definitively hides the symbol. When all references
to it are eradicated (to come in followup patches), we'll eventually
kill the symbol altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .defconfig     |    1 -
 arch/Config.in |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/.defconfig b/.defconfig
index 77ab11a..585be55 100644
--- a/.defconfig
+++ b/.defconfig
@@ -6,7 +6,6 @@ BR2_HAVE_DOT_CONFIG=y
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
-# BR2_avr32 is not set
 # BR2_cris is not set
 # BR2_ia64 is not set
 BR2_i386=y
diff --git a/arch/Config.in b/arch/Config.in
index 890e7e2..1719fe6 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -61,7 +61,7 @@ config BR2_avr32
 	# components. If you're interested by AVR32, contact the
 	# Buildroot community. Otherwise, its support will be removed
 	# by the 2015.02 release.
-	depends on BR2_DEPRECATED_SINCE_2014_08
+	depends on BR2_BROKEN
 	help
 	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
 	  Atmel.
