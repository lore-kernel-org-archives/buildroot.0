From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Mar 2020 18:26:01 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: add option for
 Microchip VSC85xx networking PHYs
In-Reply-To: <20200303101337.817021-1-antoine.tenart@bootlin.com>
References: <20200303101337.817021-1-antoine.tenart@bootlin.com>
Message-ID: <20200305172601.GI5357@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

On 2020-03-03 11:13 +0100, Antoine Tenart spake thusly:
> This patch adds an option to support installing firmware files for the
> Microchip/Microsemi VSC85xx networking PHY family.
> 
> There is a mismatch between Linux and Linux-firmware on the name of the
> PHY (Microchip vs Microsemi), due to the acquisition of Microsemi by
> Microchip. We chose here the name in Linux-firmware, but mentioned the
> other one in the Kconfig help of the option.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/Config.in           | 7 +++++++
>  package/linux-firmware/linux-firmware.hash | 1 +
>  package/linux-firmware/linux-firmware.mk   | 5 +++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 9d142d2c5415..4768ea677272 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -367,6 +367,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
>  	  Firmware files for Intel 825xx handled by driver e100
>  	  (e100)
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY
> +	bool "Microchip VSC85xx PHYs"
> +	help
> +	  Firmware files for Microchip/Microsemi VSC85xx networking
> +	  PHYs (VSC8504, VSC8552, VSC8572, VSC8574, VSC856X, VSC8575,
> +	  VSC8582 and VSC8584)
> +
>  config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X
>  	bool "QLogic FastLinQ 4xxxx"
>  	help
> diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
> index 573c33cbc91b..3878d9288170 100644
> --- a/package/linux-firmware/linux-firmware.hash
> +++ b/package/linux-firmware/linux-firmware.hash
> @@ -12,6 +12,7 @@ sha256 60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83 LICENCE.
>  sha256 5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4 LICENCE.ibt_firmware
>  sha256 0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d LICENCE.it913x
>  sha256 e295020afd7597dc1b3bbe50a84a7e432d9cb92bc053c1c5e657b50d2517627b LICENCE.iwlwifi_firmware
> +sha256 0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3 LICENCE.microchip
>  sha256 2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c LICENCE.qat_firmware
>  sha256 4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822 LICENCE.qla2xxx
>  sha256 d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd LICENCE.ralink-firmware.txt
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index fd90f261fa03..f8e95d0648c9 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -455,6 +455,11 @@ LINUX_FIRMWARE_FILES += e100/*.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY),y)
> +LINUX_FIRMWARE_FILES += microchip/mscc_vsc85*.bin
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.microchip
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X),y)
>  LINUX_FIRMWARE_FILES += \
>  	qed/qed_init_values_zipped-*.bin
> -- 
> 2.24.1
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
