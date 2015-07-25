From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 19:13:11 +0200
Subject: [Buildroot] [PATCH 13/47] package/kodi-platform: new package
In-Reply-To: <1437597069-6448-14-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-14-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150725171311.GQ3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brnd, All,

On 2015-07-22 22:30 +0200, Bernd Kuhls spake thusly:
> This package is used by the PVR addon packages and has no use by itself,
> therefore is does not show up in menuconfig.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
> new file mode 100644
> index 0000000..22d7752
> --- /dev/null
> +++ b/package/kodi-platform/kodi-platform.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# kodi-platform
> +#
> +################################################################################
> +
> +KODI_PLATFORM_VERSION = 33b6390b5d2abe5b674f9eb04bdee19228543054
> +KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
> +KODI_PLATFORM_LICENSE = GPLv3+
> +KODI_PLATFORM_LICENSE_FILES = COPYING

First, the only two source files in there are GPLv2+, not v3+.

Second, there's no COPYING file; there's even no licensing file at all.

Regards,
Yann E. MORIN.

> +KODI_PLATFORM_INSTALL_STAGING = YES
> +KODI_PLATFORM_DEPENDENCIES = libplatform kodi
> +
> +KODI_PLATFORM_CONF_OPTS += \
> +	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
> +
> +$(eval $(cmake-package))

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
