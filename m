From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Jun 2017 22:51:51 +0200
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest kernel
	version
In-Reply-To: <20170605195206.GA32194@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Mon, 5 Jun 2017 21:52:07 +0200")
References: <20170605195206.GA32194@waldemar-brodkorb.de>
Message-ID: <87efuvbjx4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Xtensa patches no longer required, the make target name changed
 > to Image. The Qemu binary for OpenRisc was renamed upstream.
 > I removed the x86->x86_64 symlink, independent files preferred.

 > Defconfig               Kernel  Qemu            Network Status
 > --------------------------------------------------------------
 > aarch64_virt            4.11.3   2.9.0           YES     OK
 > arm_versatile           4.11.3   2.9.0           YES     OK
 > arm_versatile_nommu     4.4.70   2.9.0           YES     OK
 > arm_vexpress            4.11.3   2.9.0           YES     OK
 > m68k_mcf5208            4.11.3   2.9.0           YES     OK
 > m68k_q800               4.11.3   q800-v2.4.0     NO (2)  OK
 > microblazebe            4.11.3   2.9.0           YES     OK
 > microblazeel            4.11.3   2.9.0           YES     OK
 > mips32r2el_malta        4.11.3   2.9.0           YES     OK
 > mips32r2_malta          4.11.3   2.9.0           YES     OK
 > mips32r6el_malta        4.11.3   2.9.0           YES     OK
 > mips32r6_malta          4.11.3   2.9.0           YES     OK
 > mips64el_malta          4.11.3   2.9.0           YES     OK
 > mips64_malta            4.11.3   2.9.0           YES     OK
 > mips64r6el_malta        4.11.3   2.9.0           YES     OK
 > mips64r6_malta          4.11.3   2.9.0           YES     OK
 > nios2-10m50             4.11.3   2.9.0           NO      OK
 > or1k                    4.11.3   2.9.0           NO      OK (5)
 > ppc_g3beige             4.11.3   2.9.0           YES     OK
 > ppc_mpc8544ds           4.11.3   2.9.0           YES     OK
 > ppc_virtex_ml507        4.9.6    2.9.0           NO      OK (3)
 > ppc64_pseries           4.11.3   2.9.0           YES     OK
 > sh4                     4.9.6    2.9.0           YES     OK (4)
 > sh4eb                   4.9.6    2.9.0           NO (1)  OK (4)
 > sparc_ss10              4.11.3   2.9.0           YES     OK
 > sparc64_sun4u           4.11.3   2.9.0           YES     OK
 > sparc_sun4u             4.11.3   2.9.0           YES     OK
 > x86                     4.11.3   2.9.0           YES     OK
 > x86_64                  4.11.3   2.9.0           YES     OK
 > xtensa_lx60             4.11.3   2.9.0           YES     OK
 > xtensa_lx60_nommu       4.11.3   2.9.0           YES     OK

 > (1) - Probably an endian issue with 8139 emulation/driver
 > (2) - There's a network interface, but enabling it in qemu fails
 > (3) - Kernel oops with 4.11.3 on boot
 > (4) - System is extremely slow with 4.11.3, needs further investigation
 > (5) - Qemu binary got renamed to qemu-system-or1k

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks!

-- 
Bye, Peter Korsgaard
