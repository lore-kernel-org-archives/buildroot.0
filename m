From: =?ISO-8859-1?Q?=22G=E1bor=2C_Wacha=22?= <wacha@mit.bme.hu>
Date: Wed, 05 Jun 2013 10:00:16 +0200
Subject: [Buildroot] Build kernel with devicetree support
In-Reply-To: <20130605092543.62a08c4e@skate>
References: <20130604101820.Horde.Y0PAK1HM6z3pTjPtdLCJCA1@www.mit.bme.hu>
 <20130605092543.62a08c4e@skate>
Message-ID: <51AEF010.4030307@mit.bme.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

The patch solved my problem, thank you.
Regards,
Gabor

2013-06-05 09:25 keltez?ssel, Thomas Petazzoni ?rta:
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 11b32c3..177446d 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -55,7 +55,7 @@ LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-
>   ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
>   KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
>   else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
> -KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))
> +KERNEL_DTS_NAME = $(basename $(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))
>   endif
>   
>   ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
