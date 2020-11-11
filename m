From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Nov 2020 22:17:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: Add new option
 for Qualcomm/Atheros 10k (QCA9377)
In-Reply-To: <20201111154637.61244-1-ju.o@free.fr>
References: <20201111154637.61244-1-ju.o@free.fr>
Message-ID: <20201111211720.GG3971474@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2020-11-11 16:46 +0100, Julien Olivain spake thusly:
> Initial Atheros ath10k QCA9377 support was introduced in Kernel v4.4
> [1]. More recently, in v5.7 [2], the SDIO support was also added. This
> patch adds a new option to install firmware files for this device.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a226b519d43a2a6b37267fea051aacb4a79c9614
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6e51b0e4913ca2c93059f73ca477ca30ea95b6a0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 8 ++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 9b999034da..105daf42b8 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -113,6 +113,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
>  	help
>  	  Firmware files for the Atheros 9271 module
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA9377
> +	bool "Atheros 10k (QCA9377)"
> +	help
> +	  Firmware files for the Atheros QCA9377 module
> +
>  config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X
>  	bool "Atheros 10k (QCA998X)"
>  	help
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index d9ad942903..8808b5284c 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -189,6 +189,14 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
>  endif
>  
>  # ath10k
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA9377),y)
> +LINUX_FIRMWARE_FILES += ath10k/QCA9377/hw1.0/board-2.bin \
> +			ath10k/QCA9377/hw1.0/board.bin \
> +			ath10k/QCA9377/hw1.0/firmware-5.bin \
> +			ath10k/QCA9377/hw1.0/firmware-6.bin
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X),y)
>  LINUX_FIRMWARE_FILES += ath10k/QCA988X/hw2.0/board.bin \
>  			ath10k/QCA988X/hw2.0/firmware-4.bin \
> -- 
> 2.28.0
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
