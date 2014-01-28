From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 23:14:37 +0100
Subject: [Buildroot] [PATCH 2/2] linux: only depend on host-lzop if
 needed
In-Reply-To: <1d22a1ff0f39a4b4e8fe4186cf9696a44a01e20f.1390744549.git.yann.morin.1998@free.fr>
References: <cover.1390744549.git.yann.morin.1998@free.fr>
 <1d22a1ff0f39a4b4e8fe4186cf9696a44a01e20f.1390744549.git.yann.morin.1998@free.fr>
Message-ID: <20140128231437.22b6a7ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 26 Jan 2014 14:56:27 +0100, Yann E. MORIN wrote:

> +ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(call qstrip,$(KERNEL_SOURCE_CONFIG))),y)
> +LINUX_DEPENDENCIES += host-lzop
> +endif

Do this works reliably? KERNEL_SOURCE_CONFIG typically points to a
minimal defconfig file (say arch/arm/configs/mvebu_defconfig). So if
CONFIG_KERNEL_LZO is the default choice for the kernel, it will not
appear in the defconfig, and therefore the piece of code above will not
realize that we need host-lzop, because the test is done before "make
mvebu_defconfig" is executed and turns it back into a full
configuration file.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
