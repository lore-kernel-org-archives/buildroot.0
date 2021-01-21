From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:54:25 +0100
Subject: [Buildroot] [PATCH] configs/aarch64_rdinfra: add new config for
 infra rd plaforms
In-Reply-To: <20201126100507.27484-1-vivek.gautam@arm.com>
References: <20201126100507.27484-1-vivek.gautam@arm.com>
Message-ID: <20210121225425.385f0d71@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vivek,

On Thu, 26 Nov 2020 15:35:07 +0530
Vivek Kumar Gautam <vivek.gautam@arm.com> wrote:

> This defconfig enables Arm aarch64 Infra RD platforms to use
> buildroot backed ramdisks to perform simple unit/sanity testing.
> These infra platforms are currently enabled with a scripts based
> build system as can be seen in linaro public repos[1]. A busybox
> based boot is also enabled[2].
> We plan to use buildroot for a richer experience while testing and
> therefore this config.
> This config will also be first step towards enabling buildroot
> based build system for infra rd platforms in near future.
> It comes with following minimal stuff -
>  -neoverse_n1 cpu
>  -bash shell
>  -vim
>  -pciutils
>  -libdtc
>  -screen
> 
> [1] https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/about/
> [2] https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms.git/about/docs/rdn1edge/how-to/busybox-boot.rst
> 
> Signed-off-by: Vivek Kumar Gautam <vivek.gautam@arm.com>

Thanks for the patch and contribution. However, I kind of fail to see
the point of a defconfig like the one you propose. It is really doing
nothing but building a CPIO archive with a bunch of somewhat random
selection of user-space programs and libraries.

Our defconfigs are meant to support specific HW platforms, and used to
easily build a combination of firmware/bootloader/kernel that works on
this hardware platforms, and those defconfigs are typically minimal in
terms of user-space packages enabled, as it is very use-case specific
what are the user-space packages that make sense to have.

Therefore, as it is, your configuration that does not build a kernel,
does not build any bootloader, doesn't bring much. Anyone can easily
fire up Buildroot, select ARM64, an external toolchain, and a random
selection of user-space packages. No defconfig is necessary to achieve
this.

Could you provide more details about what you are trying to achieve ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
