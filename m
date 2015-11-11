From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 23:36:57 +0100
Subject: [Buildroot] [PATCH v2] configs/qemu: bump to the latest linux
 version
In-Reply-To: <1447154746-13448-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447154746-13448-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151111233657.0cfa8852@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 10 Nov 2015 08:25:46 -0300, Gustavo Zacarias wrote:
> ppc-mpc8544ds: switch to custom kernel config since the new 4.3-shipped
> mpc85xx_basic_defconfig doesn't work with Qemu.
> Incidentally while cleaning it up it now seems to work fine with newer
> qemu versions.
> 
> sparc64_sun4u: ditch ne2k driver since it's useless, and add the e1000
> driver which works fine.
> 
> x86: stick to 4.2.x kernels since 4.3 doesn't work right with uclibc
> (any variant) based toolchains.
> 
> Results table:
> 
> Defconfig               Kernel          Qemu    Network Status
> --------------------------------------------------------------
> aarch64_virt            4.3             2.3.0   YES     OK
> arm_nuri                3.10.93         2.3.0   NO(1)   OK(2)
> arm_versatile           4.3             2.3.0   YES     OK
> arm_vexpress            4.3             2.3.0   YES     OK
> microblazebe            4.3             2.3.0   YES     OK
> microblazeel            4.3             2.3.0   YES     OK
> mips64el_malta          4.3             2.3.0   YES     OK
> mips64_malta            4.3             2.3.0   YES     OK
> mipsel_malta            4.3             2.3.0   YES     OK
> mips_malta              4.3             2.3.0   YES     OK
> ppc_g3beige             4.3             2.3.0   YES     OK
> ppc_mpc8544ds           4.3             2.3.0   YES     OK
> ppc_virtex_ml507        4.3             2.3.0   NO      OK
> ppc64_pseries           4.3             2.3.0   YES     OK
> sh4                     4.3             2.3.0   YES     OK
> sh4eb                   4.3             2.3.0   NO(1)   OK
> sparc_ss10              4.3             2.3.0   YES     OK
> sparc64_sun4u           4.3             2.3.0   YES     OK
> sparc_sun4u             4.3             2.3.0   YES     OK
> x86                     4.2.6           2.3.0   YES     OK(3)
> x86_64                  4.3             2.3.0   YES     OK
> xtensa_lx60             4.3             2.3.0   YES     OK

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
