From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Dec 2016 21:38:17 +0100
Subject: [Buildroot] [git commit] gcc: disallow 4.8.x for ARMv8 cores
Message-ID: <20161206204146.EAE6481D26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df4044abfeed00ffb053ab65aff2e14b90887a18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notice: A53/A57 were in fact supported in aarch64 mode in 4.8 (in aarch32
mode only from 4.9), but it doesn't handle --with-abi, and as there is
unlikely to be any aarch64 based legacy projects unwilling to use a newer
GCC version it is simpler to disallow it for all modes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0fc1ec4..62da5b5 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -13,7 +13,7 @@ choice
 		depends on !BR2_microblaze && !BR2_arc \
 			&& !BR2_powerpc64le && !BR2_nios2 && !BR2_bfin
 		# Broken or unsupported ARM cores
-		depends on !BR2_cortex_a12 && !BR2_cortex_a17
+		depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_power8
 		# Unsupported MIPS cores
