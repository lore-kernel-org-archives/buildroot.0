From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Jun 2019 12:29:53 +0200
Subject: [Buildroot] [PATCH v3 11/15] arch/arm: saphira is in fact an
 armv8.4a
In-Reply-To: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
References: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190611102957.7145-12-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... and not an armv8.3a like previously supposed:
    https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=886d991373e4dc5a746d0a33de64f1b36e61eed9

So, change the correspoding labels and comments.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 arch/Config.in.arm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index e10d308767..113b83a738 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -481,7 +481,7 @@ config BR2_cortex_a75_a55
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 
-comment "armv8.3a cores"
+comment "armv8.4a cores"
 config BR2_saphira
 	bool "saphira"
 	depends on BR2_ARCH_IS_64
@@ -841,7 +841,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a55"	if BR2_cortex_a55
 	default "cortex-a75"	if BR2_cortex_a75
 	default "cortex-a75.cortex-a55"	if BR2_cortex_a75_a55
-	# armv8.3a
+	# armv8.4a
 	default "saphira"	if BR2_saphira
 
 config BR2_GCC_TARGET_ABI
-- 
2.17.1
