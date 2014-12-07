From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:47:22 +0100
Subject: [Buildroot] [git commit] package/gcc: set e5500 and e6500 version
	mask
Message-ID: <20141207224728.8AC0F7F94C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fb5dee3e6a78afba125e613e943db16d82046e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Freescale e5500 and e6500 cores are supported for versions >= 4.8
So filter out all of the older versions to avoid build failures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 9d08ccb..ff48af1 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -30,7 +30,8 @@ choice
 		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
 			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4
 		# Broken or unsupported PPC cores
-		depends on !BR2_powerpc_power8
+		depends on !BR2_powerpc_e5500 && !BR2_powerpc_e6500 && \
+			!BR2_powerpc_power8
 		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported X86 cores
@@ -49,7 +50,8 @@ choice
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12 && !BR2_pj4
 		# Broken or unsupported PPC cores
-		depends on !BR2_powerpc_power8
+		depends on !BR2_powerpc_e5500 && !BR2_powerpc_e6500 && \
+			!BR2_powerpc_power8
 		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported x86 cores
