From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 10:23:04 +0100
Subject: [Buildroot] [PATCH 01/12 v2] arch: kill avr32
In-Reply-To: <cover.1423905753.git.yann.morin.1998@free.fr>
References: <cover.1423905753.git.yann.morin.1998@free.fr>
Message-ID: <4ac969355610ac118df65e7873de2aafb480b1c0.1423905753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

avr32 was slated for removal in 2015.02. Make it so!

This patch only definitively hides the symbol. When all references
to it are eradicated (to come in followup patches), we'll eventually
kill the symbol altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - do nt move the symbol, hide with BR2_BROKEN  (Thomas)
---
 .defconfig     | 1 -
 arch/Config.in | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

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
-- 
1.9.1
