From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  5 Apr 2021 22:21:55 +0200
Subject: [Buildroot] [PATCH 4/4] boot/shim: re-enable on ARM32
In-Reply-To: <20210405202155.1422470-1-thomas.petazzoni@bootlin.com>
References: <20210405202155.1422470-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210405202155.1422470-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

shim 15.4 builds just fine on ARM32.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/shim/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/boot/shim/Config.in b/boot/shim/Config.in
index 596ff5b2cf..2f74d6f332 100644
--- a/boot/shim/Config.in
+++ b/boot/shim/Config.in
@@ -2,8 +2,6 @@ config BR2_TARGET_SHIM
 	bool "shim"
 	# it includes gnu-efi
 	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
-	# ARM32 build currently broken
-	depends on !BR2_ARM_CPU_HAS_ARM
 	help
 	  Boot loader to chain-load signed boot loaders under Secure
 	  Boot.
-- 
2.30.2
