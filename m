From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 10:54:24 +0100
Subject: [Buildroot] [PATCH] bluez-utils: Add GATT support
In-Reply-To: <1387481306-25377-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1387481306-25377-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20131220105424.19575f8a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Thu, 19 Dec 2013 20:28:26 +0100, Alexandre Belloni wrote:

> +config BR2_PACKAGE_BLUEZ_UTILS_GATT
> +	bool "GATT support"

You need to select BR2_PACKAGE_READLINE here.

> +	help
> +	  GATT support

Maybe it would be nice to say a few words about what GATT is here,
since it's not immediately clear what it is.

>  endif
>  
>  comment "bluez-utils needs a toolchain w/ wchar, threads"
> diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
> index 7038638a0748..f6484ae723af 100644
> --- a/package/bluez_utils/bluez_utils.mk
> +++ b/package/bluez_utils/bluez_utils.mk
> @@ -37,6 +37,13 @@ BLUEZ_UTILS_CONF_OPT +=	\
>  	--disable-audio
>  endif
>  
> +ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_GATT),y)
> +BLUEZ_UTILS_DEPENDENCIES +=	readline
> +BLUEZ_UTILS_CONF_OPT +=	--enable-gatt
> +else
> +BLUEZ_UTILS_CONF_OPT +=	--disable-gatt
> +endif

Please use spaces after the += operator, and not tabs.

feq ($(BR2_PACKAGE_BLUEZ_UTILS_GATT),y)
BLUEZ_UTILS_DEPENDENCIES += readline
BLUEZ_UTILS_CONF_OPT += --enable-gatt
else
BLUEZ_UTILS_CONF_OPT += --disable-gatt
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
