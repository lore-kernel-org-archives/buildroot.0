From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:30:07 +0200
Subject: [Buildroot] [PATCH] Arcturus uCP1020 BSP support.
In-Reply-To: <1468595175-6303-1-git-send-email-oleks@arcturusnetworks.com>
References: <1468595175-6303-1-git-send-email-oleks@arcturusnetworks.com>
Message-ID: <20160715193007.6440d7ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 11:06:15 -0400, Oleksandr G Zhadan wrote:
> >> Hi Tomas,
> >>
> >> Thank you you for your previous comments and suggestions.
> >> This new fixed version is the "minimalist" patch we can do .  
> 
> > Thanks, but please submit the patch as a separate mail, using "git
> > send-email".  

Why do you still have this in the mail you send with git send-email?
You should just have the commit title:

	configs: add Arcturus uCP1020 BSP support


> 
> ---
> 
> The uCP1020 product family (ucp1020) is an Arcturus Networks Inc.
> System on Modules product featuring a Freescale P1020 CPU,
> optionally populated with 1 or 2 Gig-Ethernet PHYs,
> DDR3, NOR Flash, eMMC NAND Flash and/or SPI Flash.

and this commit description.

If you keep your patch as-is and I applied it, the "Thank you for your
previous ..." part will be integrated in the Git history of Buildroot,
which we don't want.

> +++ b/board/arcturus/ppc-ucp1020/patches/linux/0001-Arcturus-uCP1020-BSP-support.patch
> @@ -0,0 +1,469 @@
> +From c27eeadb6c6cecbc07b330030c494c226643dcd1 Mon Sep 17 00:00:00 2001
> +From: Oleksandr G Zhadan <arcsupport@arcturusnetworks.com>
> +Date: Fri, 8 Jul 2016 11:02:59 -0400
> +Subject: [PATCH] Arcturus uCP1020 BSP support
> +
> +The uCP1020 product family (ucp1020) is an Arcturus Networks Inc.
> +System on Modules product featuring a NXP QorIQ P1020 CPU,
> +optionally populated with 1 or 2 Gig-Ethernet PHYs,
> +DDR3, NOR Flash, eMMC NAND Flash and/or SPI Flash.
> +
> +Signed-off-by: Oleksandr G Zhadan <arcsupport@arcturusnetworks.com>
> +Signed-off-by: Michael Durrant <arcsupport@arcturusnetworks.com>

Has this support been submitted to the upstream Linux kernel?


> ++/**********
> ++	sdhc at 2e000 {
> ++		cd-gpios = <&gpio0 8 0>;	* card detect *
> ++		wp-gpios = <&gpio0 9 0>;	* write protect *
> ++		wp-inverted;			* WP active high *
> ++	};
> ++***********/

It would be better to not keep commented code in the Device Tree.


> +# U-boot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="UCP1020"

Please use a specific U-Boot version. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
