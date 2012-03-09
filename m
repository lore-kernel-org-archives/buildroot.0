From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 07:20:40 +0100
Subject: [Buildroot] [PATCH 01/13] Remove the DATE variable
In-Reply-To: <2a7b796c205f29935b6db8cdca0b076e35a42ea7.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <2a7b796c205f29935b6db8cdca0b076e35a42ea7.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWj9__xRPaTE++7TEa_NOkKFGq45C-f+d6sNiLQZk_b9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 7, 2012 at 8:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This variable was only used by uboot.mk to add a #define DATE into the
> U-Boot .h configuration file. But such a definition does not seem to
> be used by the mainline U-Boot, so there's no reason to keep it.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

> ---
> ?Makefile ? ? ? ? ? ?| ? ?1 -
> ?boot/uboot/uboot.mk | ? ?1 -
> ?2 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d508888..bfa82d2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -39,7 +39,6 @@ endif
> ?TOPDIR:=$(shell pwd)
> ?CONFIG_CONFIG_IN=Config.in
> ?CONFIG=support/kconfig
> -DATE:=$(shell date +%Y%m%d)
>
> ?# Compute the full local version string so packages can use it as-is
> ?# Need to export it, so it can be got from environment in children (eg. mconf)
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index db9de8d..83696be 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -69,7 +69,6 @@ define UBOOT_CONFIGURE_CMDS
> ? ? ? ?@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
> ? ? ? ?@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
> ? ? ? ?@echo "#define __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
> - ? ? ? $(call insert_define,DATE,$(DATE))
> ? ? ? ?$(call insert_define,CONFIG_LOAD_SCRIPTS,1)
> ? ? ? ?$(call insert_define,CONFIG_IPADDR,$(BR2_TARGET_UBOOT_IPADDR))
> ? ? ? ?$(call insert_define,CONFIG_GATEWAYIP,$(BR2_TARGET_UBOOT_GATEWAY))
> --
> 1.7.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
