From: Christian Stewart <christian@paral.in>
Date: Tue, 19 Dec 2017 22:04:17 -0800
Subject: [Buildroot] systemd: blkid support requested but libraries not
 found
In-Reply-To: <20171220053213.cmceyta4gjxryugi@sapphire.tkos.co.il>
References: <874lom2fy5.fsf@paral.in>
 <20171220053213.cmceyta4gjxryugi@sapphire.tkos.co.il>
Message-ID: <87zi6e0wbi.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Baruch Siach <baruch@tkos.co.il> writes:
> Have you run a clean rebuild, 'make clean all'?
>
> It looks like you selected BR2_INIT_SYSTEMD when util-linux has already been 
> built. Buildroot will not rebuild util-linux in this case. You need to start 
> the build from scratch.

Yes, I have been doing the following sequence to reproduce:

 make clean
 make defconfig BR2_DEFCONFIG=$(pwd)/defconfig
 make systemd

The defconfig I have narrowed it down to so far is:

BR2_arm=y
BR2_cortex_a7=y
BR2_CCACHE=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_OPTIMIZE_2=y
BR2_BINUTILS_VERSION_2_27_X=y
BR2_GCC_ENABLE_LTO=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_BIN_SH_BASH=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y

Testing a newer version of binutils now to see if that helps.

Thanks,
Christian Stewart
