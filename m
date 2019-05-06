From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 May 2019 20:30:07 +0200
Subject: [Buildroot] [PATCH 11/15] arch/arm: saphira is in fact an armv8.4a
In-Reply-To: <20190506183011.4856-1-romain.naour@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
Message-ID: <20190506183011.4856-12-romain.naour@gmail.com>
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
---
 arch/Config.in.arm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index ee6ab875a3..b46c1c5cd1 100644
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
2.14.5
