From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 4 Mar 2018 20:21:14 -0300
Subject: [Buildroot] freescale_imx31_3stack_defconfig fails to build
In-Reply-To: <20180304225550.74761708@windsurf.home>
References: <20180304225550.74761708@windsurf.home>
Message-ID: <CAOMZO5BntMxqEBPuXVs2CX2L9OWGrf-AzbsOUeDN8qqcJgS8cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Mar 4, 2018 at 6:55 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Vincent, Gary, Fabio,
>
> I'm contacting you because the freescale_imx31_3stack_defconfig
> doesn't build anymore, with the following error during the kernel
> build:
>
>
> arch/arm/mach-imx/built-in.o: In function `init_mmdc_lpddr2_settings':
> platform-spi_imx.c:(.text+0x8f18): undefined reference to
> `imx6sll_lpddr2_freq_change' arch/arm/mach-imx/built-in.o: In function
> `imx6ul_cpuidle_init': platform-spi_imx.c:(.init.text+0x195c):
> undefined reference to `mx6ull_lpm_wfi_end'
> platform-spi_imx.c:(.init.text+0x1960): undefined reference to
> `mx6ull_lpm_wfi_start' platform-spi_imx.c:(.init.text+0x1964):
> undefined reference to `imx6ull_low_power_idle'
> arch/arm/mach-imx/built-in.o: In function `imx6sl_init_late':
> platform-spi_imx.c:(.init.text+0x56f0): undefined reference to
> `imx6sll_cpuidle_init' Makefile:969: recipe for target 'vmlinux' failed
> make[1]: *** [vmlinux] Error 1
>
> See:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306817
>
> Is one of you interested in maintaining/fixing this board ? If so,
> could you fix it and also submit a patch to add yourself to the
> DEVELOPERS file ?

I can send a patch converting the defconfig to use a mainline kernel instead.

Regards,

Fabio Estevam
