From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 14:52:11 +0100
Subject: [Buildroot] [PATCH] cpuburn-arm: new package
In-Reply-To: <6ded876c79c3406bd7c6d0c89bc5c4d54c854d84.1574253923.git.baruch@tkos.co.il>
References: <6ded876c79c3406bd7c6d0c89bc5c4d54c854d84.1574253923.git.baruch@tkos.co.il>
Message-ID: <20191120145211.732b6142@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Nov 2019 14:45:23 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> cpuburn-arm burns CPU cycles to generate as much heat as possible.
> Useful for stress testing.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Commit title lacks package/, i.e package/cpuburn-arm: new package.

> diff --git a/package/cpuburn-arm/Config.in b/package/cpuburn-arm/Config.in
> new file mode 100644
> index 000000000000..afea5aae0b69
> --- /dev/null
> +++ b/package/cpuburn-arm/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_CPUBURN_ARM_ARCH_SUPPORT

	..._ARCH_SUPPORTS

> +	bool
> +	default y
> +	depends on BR2_cortex_a7 || BR2_cortex_a8 || BR2_cortex_a9 || \
> +		BR2_cortex_a53

I'm not sure we really need this option when it's only used in a single
place, but if you do want the option, use this syntax:

	bool
	default y if BR2_cortex_a7
	default y if BR2_cortex_a8
	default y if BR2_cortex_a9
	default y if BR2_cortex_a53

Otherwise looks good. Probably not needed to send a new iteration just
for my minor comments, they can be taken into account when applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
