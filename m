From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 14:05:13 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/linux-firmware: add support
 for nvidia files
In-Reply-To: <20200606034839.352118-1-christian@paral.in>
References: <20200606034839.352118-1-christian@paral.in>
Message-ID: <20200606120513.GF13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2020-06-05 20:48 -0700, Christian Stewart spake thusly:
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index eba58014b6..2d729716aa 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -29,6 +29,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_I915
>  	help
>  	  Firmware files for the Intel i915 video cards.
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_NVIDIA
> +	bool "Nvidia video card firmware"
> +	help
> +	  Firmware files for the Nvidia video cards.
> +
>  config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
>  	bool "AMD Radeon video card firmware"
>  	help
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index b1c765dfae..2dbf13b94b 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -24,6 +24,11 @@ LINUX_FIRMWARE_DIRS += i915
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_NVIDIA),y)
> +LINUX_FIRMWARE_DIRS += nvidia
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.nvidia

Please add a hash for the license file.

Regards,
Yann E. MORIN.

> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
>  LINUX_FIRMWARE_DIRS += radeon
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
