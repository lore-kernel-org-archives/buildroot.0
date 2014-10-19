From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:08:00 +0200
Subject: [Buildroot] [PATCH 26/31] arch/sparc: get rid of BR2_GCC_TARGET_TUNE
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-27-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On SPARC, BR2_GCC_TARGET_TUNE was only used for one specific case, the
BR2_sparc_v8. There is actually no reason to not use
BR2_GCC_TARGET_CPU instead for this, as all values supported for
-mtune are also supported for -mcpu. Therefore, the only
BR2_GCC_TARGET_TUNE case is moved as a BR2_GCC_TARGET_CPU case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.sparc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 657c825..19907b9 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -26,10 +26,8 @@ config BR2_ENDIAN
 config BR2_ARCH_HAS_ATOMICS
 	default y
 
-config BR2_GCC_TARGET_TUNE
-	default "v8"		if BR2_sparc_v8
-
 config BR2_GCC_TARGET_CPU
+	default "v8"		if BR2_sparc_v8
 	default "sparchfleon"	if BR2_sparc_sparchfleon
 	default "sparchfleonv8"	if BR2_sparc_sparchfleonv8
 	default "sparcsfleon"	if BR2_sparc_sparcsfleon
-- 
2.0.0
