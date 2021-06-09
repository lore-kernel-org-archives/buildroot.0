From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Jun 2021 23:40:15 +0200
Subject: [Buildroot] [PATCH v2 01/28] boot/arm-trusted-firmware: option
 to disable stack protection
In-Reply-To: <20210609200003.2866122-2-geomatsi@gmail.com>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
 <20210609200003.2866122-2-geomatsi@gmail.com>
Message-ID: <20210609234015.1de2583f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Jun 2021 22:59:36 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP
> +	bool "Disable stack protection"
> +	help
> +	  Select this option to explicitly disable stack protection checks in GCC.
> +	  Such checks need to be disabled if ATF platform port does not implement
> +	  plat_get_stack_protector_canary() hook.

It's a bit annoying that we have to tell TF-A about this. If TF-A
doesn't implement plat_get_stack_protector_canary() for a certain
platform, why does it try to enable SSP ? It feels like something that
should be fixed in TF-A.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
