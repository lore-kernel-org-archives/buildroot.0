From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 May 2014 21:43:49 +0200
Subject: [Buildroot] [PATCH v5 9/9] powerpc: add powerpc64 and
	powerpc64le support
In-Reply-To: <1399958901-7867-10-git-send-email-cody@linux.vnet.ibm.com> (Cody
 P. Schafer's message of "Mon, 12 May 2014 22:28:21 -0700")
References: <1399958901-7867-1-git-send-email-cody@linux.vnet.ibm.com>
 <1399958901-7867-10-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <87ha4cfhqi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cody" == Cody P Schafer <cody@linux.vnet.ibm.com> writes:

 > This enables powerpc64 and powerpc64le. Currently, le needs at least
 > glibc 2.19 and gcc 4.9.0. For gdb, 7.7.1 works (added in an earlier
 > patch).

 > Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>

[snip]

 > +++ b/package/gcc/Config.in.host
 > @@ -20,14 +20,14 @@ choice
 >  		bool "gcc 4.2.2-avr32-2.1.5"
 
 >  	config BR2_GCC_VERSION_4_3_X
 > -		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 > +		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
 >  		depends on !BR2_ARM_EABIHF
 >  		bool "gcc 4.3.x"
 >  		# musl patches only for gcc 4.7+
 >  		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 >  	config BR2_GCC_VERSION_4_4_X
 > -		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 > +		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
 >  		bool "gcc 4.4.x"
 >  		# ARM EABIhf support appeared in gcc 4.6
 >  		depends on !BR2_ARM_EABIHF
 > @@ -37,7 +37,7 @@ choice
 >  		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 >  	config BR2_GCC_VERSION_4_5_X
 > -		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 > +		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
 >  		select BR2_GCC_NEEDS_MPC
 >  		# ARM EABIhf support appeared in gcc 4.6
 >  		depends on !BR2_ARM_EABIHF
 > @@ -46,14 +46,14 @@ choice
 >  		bool "gcc 4.5.x"
 
 >  	config BR2_GCC_VERSION_4_6_X
 > -		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 > +		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4 && !BR2_powerpc64le
 >  		select BR2_GCC_NEEDS_MPC
 >  		# musl patches only for gcc 4.7+
 >  		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 >  		bool "gcc 4.6.x"
 
 >  	config BR2_GCC_VERSION_4_7_X
 > -		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 > +		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4 && !BR2_powerpc64le
 >  		select BR2_GCC_NEEDS_MPC
 >  		bool "gcc 4.7.x"

It looks like you forgot gcc 4.8.x.

Committed with that fixed (and some minor fixups to get it to apply) to next, thanks.

-- 
Bye, Peter Korsgaard
