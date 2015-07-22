From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 22 Jul 2015 11:41:58 +0200
Subject: [Buildroot] [PATCH v2 1/1] rtl8821au: new package
In-Reply-To: <1437431538-1528-1-git-send-email-christian@paral.in>
References: <1437431538-1528-1-git-send-email-christian@paral.in>
Message-ID: <55AF6566.60702@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian,

Christian Stewart wrote:
> Adding a kernel module based USB wifi driver. There is no official
> version of this driver that works properly on ARM and with newer USB
> WiFi cards. This driver version builds module 8821au and is based on a
> kernel module release from ASUS with various fixes integrated in.
>
> [Thomas, Yann:
>    - Using the new kernel-module setup]
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---

[...]

> --- /dev/null
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# rtl8821au
> +#
> +################################################################################
> +
> +RTL8821AU_VERSION = 4.3.14
> +RTL8821AU_SITE = $(call github,paralin,rtl8821au,v$(RTL8821AU_VERSION))
> +ifeq ($(call qstrip,$(BR2_ENDAIN)),BIG)
> +RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_BIG_ENDIAN
> +else
> +RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_LITTLE_ENDIAN
> +endif

s/ENDAIN/ENDIAN/

Besides, since BR2_ENDIAN is an uppercase string, why not replacing
these 5 lines with (untested):

   RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN

-- 
Luca
