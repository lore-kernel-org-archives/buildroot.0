From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 10:10:23 +0200
Subject: [Buildroot] [PATCH 3/4] boot/uboot: add support for the kconfig
 infrastructure
In-Reply-To: <1429361566-3538-3-git-send-email-joerg.krause@embedded.rocks>
References: <1429361566-3538-1-git-send-email-joerg.krause@embedded.rocks>
 <1429361566-3538-3-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150419101023.335187b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 18 Apr 2015 14:52:45 +0200, J?rg Krause wrote:
> With the patchset "kconfig: turnaround into single .config" [1] U-Boot
> switched to a single .config file for board configuration. This allows
> us to use the kconfig-package infrastructure.
> 
> For providing backward compatibility with older U-Boot version a user choice
> between the new Kconfig and the legacy build system is introduced. Kconfig
> is chosen as the default build system.
> 
> This patch supersedes
> "boot/uboot: Add support for Kbuild & Kconfig build system" [2]
> 
> [1] http://lists.denx.de/pipermail/u-boot/2015-February/205490.html
> [2] http://patchwork.ozlabs.org/patch/436498/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

This patch does not apply. Can you refresh it on the latest master?

Also, some comments below.

>  if BR2_TARGET_UBOOT
> +choice
> +	prompt "Build system"
> +	default BR2_TARGET_UBOOT_BUILD_SYSTEM_KBUILD
> +
> +config BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
> +	bool "Legacy"
> +	help
> +	  Select this option if you use an old U-Boot (older than 2014.10),
> +	  so that we use the old build system.
> +
> +config BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	bool "Kconfig"
> +	default y

Not needed.

> +	help
> +	  Select this option if you use a recent U-Boot version (2015.04 or
> +	  newer), so that we use the Kconfig build system.

Something is unclear: legacy build system is for U-Boot older than
2014.10, and Kconfig is for U-Boot newer than 2015.04. What happens for
Buildroot versions in between, such as 2015.01 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
