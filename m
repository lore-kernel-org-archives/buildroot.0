From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:41:27 +0200
Subject: [Buildroot] [PATCH v3] configs/stm32mp157_dk: new defconfig
In-Reply-To: <20190807142456.23503-1-thomas.petazzoni@bootlin.com>
References: <20190807142456.23503-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190812234127.08626843@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  7 Aug 2019 16:24:56 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit adds a minimal defconfig to build a Buildroot system for
> the STM32MP157 Discovery Kit, which is the low-cost evaluation
> platform for the new STM32MP157 system-on-chip from ST. This
> system-on-chip features a single or dual Cortex-A7, a single
> Cortex-M4, and a wide variety of peripherals.
> 
> This commit includes a custom linux configuration file, because there
> is no specific defconfig for this platform in the kernel, only
> multi_v7_defconfig supports it, which is really a massive
> defconfig. That's why a custom linux configuration file is added.
> 
> A small U-Boot config fragment allows to disable the watchdog, so that
> userspace by default doesn't need to have a watchdog daemon running.
> 
> The vendor U-Boot and Linux trees are used for the moment, but the
> platform support is being upstreamed, so switching to upstream
> versions will be possible in the relatively near future.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes since v2:
>  - Bump vendor Linux and U-Boot versions
>  - Use the $(call github,...) macro also to download U-Boot as a
>    tarball
>  - Drop all other patches that have been merged

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
