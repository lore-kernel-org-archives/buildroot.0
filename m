From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Jan 2017 14:26:41 +0100
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest kernel
	version
In-Reply-To: <20170131103531.14518-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 31 Jan 2017 07:35:31 -0300")
References: <20170131103531.14518-1-gustavo@zacarias.com.ar>
Message-ID: <87o9ynqs1a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Also bump the pc samples since they're tied to the (base) qemu config.
 > Results table:

 > Defconfig               Kernel  Qemu            Network Status
 > --------------------------------------------------------------
 > aarch64_virt            4.9.6   2.6.0           YES     OK (3)
 > arm_versatile           4.9.6   2.5.0           YES     OK
 > arm_versatile_nommu     4.4.45  2.5.0           YES     OK
 > arm_vexpress            4.9.6   2.5.0           YES     OK
 > m68k_mcf5208            4.8.17  2.5.0           YES     OK (6)
 > m68k_q800               4.9.6   q800-v2.4.0     NO (2)  OK
 > microblazebe            4.9.6   2.5.0           YES     OK
 > microblazeel            4.9.6   2.5.0           YES     OK
 > mips32r2el_malta        4.9.6   2.5.0           YES     OK
 > mips32r2_malta          4.9.6   2.5.0           YES     OK
 > mips32r6el_malta        4.9.6   2.6.0           YES     OK (3)
 > mips32r6_malta          4.9.6   2.6.0           YES     OK (3)
 > mips64el_malta          4.9.6   2.5.0           YES     OK
 > mips64_malta            4.8.17  2.5.0           YES     OK (6)
 > mips64r6el_malta        4.9.6   2.7.0           YES     OK (3)(4)
 > mips64r6_malta          4.9.6   2.7.0           YES     OK (3)(4)
 > nios2-10m50             4.9.6   2.9.0           NO      OK
 > or1k                    4.9.6   2.5.0           NO      OK
 > ppc_g3beige             4.9.6   2.5.0           YES     OK
 > ppc_mpc8544ds           4.9.6   2.5.0           YES     OK
 > ppc_virtex_ml507        4.9.6   2.5.0           NO      OK
 > ppc64_pseries           4.9.6   2.5.0           YES     OK
 > sh4                     4.9.6   2.5.0           YES     OK
 > sh4eb                   4.9.6   2.5.0           NO (1)  OK
 > sparc_ss10              4.9.6   2.5.0           YES     OK
 > sparc64_sun4u           4.9.6   2.5.0           YES     OK
 > sparc_sun4u             4.9.6   2.5.0           YES     OK
 > x86                     4.9.6   2.5.0           YES     OK
 > x86_64                  4.9.6   2.5.0           YES     OK
 > xtensa_lx60             4.8.17  2.6.0           YES     OK (6)
 > xtensa_lx60_nommu       4.8.17  2.6.0           YES     OK (5)

 > (1) - Probably an endian issue with 8139 emulation/driver
 > (2) - There's a network interface, but enabling it in qemu fails
 > (3) - Known to fail with qemu versions lower than 2.6.0
 > (4) - Might work with 2.6.0, but the cpu definition changed in 2.7.0
 > (5) - Kept back on 4.8.x series since 4.9.x fails to build
 > (6) - Kept back on 4.8.x series since 4.9.x fails to boot

Committed, thanks!

-- 
Bye, Peter Korsgaard
