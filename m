From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 22:28:15 -0700
Subject: [Buildroot] [PATCH v5 3/9] package/binutils: add depends for
	powerpc64le (only 2.24 works)
In-Reply-To: <1399958901-7867-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1399958901-7867-1-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <1399958901-7867-4-git-send-email-cody@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
---
 package/binutils/Config.in.host | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 15def13..08540a3 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
-	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze
+	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
 	default BR2_BINUTILS_VERSION_2_22
 	help
 	  Select the version of binutils you wish to use.
@@ -14,30 +14,30 @@ choice
 		bool "binutils 2.18-avr32-1.0.1"
 
 	config BR2_BINUTILS_VERSION_2_20_1
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.20.1"
 
 	config BR2_BINUTILS_VERSION_2_21
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.22"
 
 	config BR2_BINUTILS_VERSION_2_23_1
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.23.1"
 
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
-- 
1.9.3
