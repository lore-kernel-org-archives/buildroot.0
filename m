From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:13:08 +0100
Subject: [Buildroot] [git commit] arch/sparc: get rid of BR2_GCC_TARGET_TUNE
Message-ID: <20141106233447.27500B1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5023c5204ad23323d21c1840a4ce7d99b7abf7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On SPARC, BR2_GCC_TARGET_TUNE was only used for one specific case, the
BR2_sparc_v8. There is actually no reason to not use
BR2_GCC_TARGET_CPU instead for this, as all values supported for
-mtune are also supported for -mcpu. Therefore, the only
BR2_GCC_TARGET_TUNE case is moved as a BR2_GCC_TARGET_CPU case.

[Peter: fixup merge conflict after 'sparc: Add leon3 cpu type and remove sparc{s,h}fleon{,v8}]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.sparc |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index cd845b2..4e502d5 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -20,8 +20,6 @@ config BR2_ENDIAN
 config BR2_ARCH_HAS_ATOMICS
 	default y
 
-config BR2_GCC_TARGET_TUNE
-	default "v8"		if BR2_sparc_v8
-
 config BR2_GCC_TARGET_CPU
 	default "leon3"		if BR2_sparc_leon3
+	default "v8"		if BR2_sparc_v8
