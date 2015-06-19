From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Jun 2015 19:47:06 +0200
Subject: [Buildroot] [[updated v2] 1/1] package/linux-firmware: add
 iwlwifi 6000g2a firmware
In-Reply-To: <1432051679-27223-1-git-send-email-colleen@skycatch.com>
References: <1432051679-27223-1-git-send-email-colleen@skycatch.com>
Message-ID: <20150619174706.GB3638@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Colleen, All,

On 2015-05-19 16:07 +0000, Colleen Twitty spake thusly:
> 
> Signed-off-by: Colleen Twitty <colleen@skycatch.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/Config.in         |    6 ++++++
>  package/linux-firmware/linux-firmware.mk |    5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 7265990..2e4c205 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -81,6 +81,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
>  	  Firmware files for the Intel Wifi 5000 devices supported by
>  	  the iwlwifi kernel driver.
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A
> +	bool "Intel iwlwifi 6000G2A"
> +	help
> +	  Firmware files for the Intel Wifi 6000G2A devices supported by
> +	  the iwlwifi kernel driver.
> +
>  config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
>  	bool "Intel iwlwifi 7260"
>  	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 9acfc53..7a31bad 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -197,6 +197,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-5000-5.ucode
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A),y)
> +LINUX_FIRMWARE_FILES += iwlwifi-6000g2a-6.ucode
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
>  LINUX_FIRMWARE_FILES += iwlwifi-7260-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
