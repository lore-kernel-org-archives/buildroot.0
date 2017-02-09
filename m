From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Feb 2017 09:31:06 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/bluez-tools: new package
In-Reply-To: <20170208213255.6511-1-bernd.kuhls@t-online.de>
References: <20170208213255.6511-1-bernd.kuhls@t-online.de>
Message-ID: <20170209073106.6cxmljtlkz7moxjh@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Wed, Feb 08, 2017 at 10:32:55PM +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added comment why autoreconf is needed (Romain)
> 
>  DEVELOPERS                           |  1 +

This change should be in a separate patch.

[snip]

> diff --git a/package/bluez-tools/bluez-tools.mk b/package/bluez-tools/bluez-tools.mk
> new file mode 100644
> index 000000000..3f441039c
> --- /dev/null
> +++ b/package/bluez-tools/bluez-tools.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# bluez-tools
> +#
> +################################################################################
> +
> +ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
> +# this is the last version compatible with BlueZ 4 API
> +BLUEZ_TOOLS_VERSION = 171181b6ef6c94aefc828dc7fd8de136b9f97532
> +else
> +BLUEZ_TOOLS_VERSION = 97efd293491ad7ec96a655665339908f2478b3d1
> +endif
> +BLUEZ_TOOLS_SITE = $(call github,khvzak,bluez-tools,$(BLUEZ_TOOLS_VERSION))
> +# sources fetched from github, no configure script)
> +BLUEZ_TOOLS_AUTORECONF = YES
> +BLUEZ_TOOLS_DEPENDENCIES = host-pkgconf dbus dbus-glib
> +
> +ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
> +BLUEZ_TOOLS_DEPENDENCIES += bluez_utils
> +else
> +BLUEZ_TOOLS_DEPENDENCIES += bluez5_utils readline
> +endif

Version 171181b6ef6 (for bluez 4) also looks for readline when obex is 
enabled, which is the default.

Tested with bluez5 on Raspberry Pi 3.

Tested-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
