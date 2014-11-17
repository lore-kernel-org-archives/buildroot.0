From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 17 Nov 2014 20:14:52 -0300
Subject: [Buildroot] [PATCH 2/2] package/gcc: set e5500 and e6500 version
	mask
In-Reply-To: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1416266092-6465-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Freescale e5500 and e6500 cores are supported for versions >= 4.8
So filter out all of the older versions to avoid build failures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/Config.in.host | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3bccf36..a62e762 100644
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
-- 
2.0.4
