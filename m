From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Jul 2019 22:59:31 +0200
Subject: [Buildroot] [git commit] arch/arm: saphira is in fact an armv8.4a
Message-ID: <20190713210917.763208187E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b22ee8ad88aaa781d937f59cef34052434cc0bee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and not an armv8.3a like previously supposed:
    https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=886d991373e4dc5a746d0a33de64f1b36e61eed9

So, change the correspoding labels and comments.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in.arm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 42f8b4d72f..f760d1f590 100644
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
