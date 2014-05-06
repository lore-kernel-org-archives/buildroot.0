From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 May 2014 17:08:13 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: musl is not available for
	gcc 4.3.x either
Message-ID: <20140506151342.C317A9CB06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00dd2354f7f71420ce0766fe46cd7f468cc72562
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 99eaa02..d0aa699 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -23,6 +23,8 @@ choice
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
+		# musl patches only for gcc 4.7+
+		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 	config BR2_GCC_VERSION_4_4_X
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
