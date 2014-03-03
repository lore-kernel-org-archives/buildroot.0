From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 22:44:41 +0100
Subject: [Buildroot] [PATCH] toolchain: control GNU_TARGET_NAME vendor
 part
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006C816@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF23@ezex10.ezchip.com>
 <20140223104658.4088cdc6@skate>
 <884EA965490E3C4D8E66AEF41E98025006C3BB@ezex10.ezchip.com>
 <20140223125102.025dd91a@skate>
 <884EA965490E3C4D8E66AEF41E98025006C816@ezex10.ezchip.com>
Message-ID: <20140303224441.546bf9f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

On Sun, 23 Feb 2014 15:41:43 +0000, Noam Camus wrote:
> +config BR2_TOOLCHAIN_BUILDROOT_VENDOR
> +	string "custom toolchain vendor name"
> +	default "buildroot"
> +	help
> +	  This option accepts name for vendor field in toolchain tuple.
> +	  The toolchain tuple full format is:
> +	  cpu-vendor-kernel-os
> +	  You may use it in case of custom toolchain.
> +	  e.g. if your gcc depend on this field to make decisions.
> +	  NOTE: "unknown" is not allowed since it may be confused
> +	  with host toolchain.

A better wording IMO:

	This option allows to customize the "vendor" part of the
	toolchain tuple, where the toolchain tuple has the form
	<cpu>-<vendor>-<kernel>-<os>. The default value, "buildroot",
	is fine for most cases, except in very specific situations
	where gcc might make different decisions based on the vendor
	part of the tuple. The value "unknown" is not allowed as the
	cross-compiling toolchain might then be confused with the
	native toolchain when the target and host architecture are
	identical.

	If you're not sure, just leave the default "buildroot" value.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
