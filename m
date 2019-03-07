From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 23:16:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/flashrom: add
 BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
In-Reply-To: <20190307220824.1476-1-fontaine.fabrice@gmail.com>
References: <20190307220824.1476-1-fontaine.fabrice@gmail.com>
Message-ID: <20190307231633.6ab24e0d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 Mar 2019 23:08:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
> index cf1f53c1a3..9c20f2ed2c 100644
> --- a/package/flashrom/Config.in
> +++ b/package/flashrom/Config.in
> @@ -1,6 +1,15 @@
> +config BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64 || BR2_aarch64_be || BR2_arm || \
> +		BR2_armeb || BR2_i386 || BR2_m68k || BR2_mips || \
> +		BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> +		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> +		BR2_riscv || BR2_sh || BR2_sparc || BR2_sparc64 || \
> +		BR2_x86_64

I've split since into multiple "default y" lines, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
