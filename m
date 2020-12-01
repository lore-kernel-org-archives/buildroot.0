From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2020 22:41:02 +0100
Subject: [Buildroot] [PATCH 3/3] package/linux-firmware: install Ath10k
 QCA9377 sdio firmware
In-Reply-To: <20201117212145.12198-3-ju.o@free.fr>
References: <20201117212145.12198-1-ju.o@free.fr>
 <20201117212145.12198-3-ju.o@free.fr>
Message-ID: <eac860ae-a876-b8ac-a08c-3a478a37f4e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/11/2020 22:21, Julien Olivain wrote:
> linux-firmware version 20201022 introduced a new sdio firmware for
> QCA9377 sdio devices. Install it when support is selected.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

 Series applied to next, thanks.

 Allow me to compliment you with the excellent splitting of the commits and
commit messages. It's really helpful!

 Regards,
 Arnout

> ---
>  package/linux-firmware/linux-firmware.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index dc7f392800..c0ca98c45c 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -193,7 +193,8 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA9377),y)
>  LINUX_FIRMWARE_FILES += ath10k/QCA9377/hw1.0/board-2.bin \
>  			ath10k/QCA9377/hw1.0/board.bin \
>  			ath10k/QCA9377/hw1.0/firmware-5.bin \
> -			ath10k/QCA9377/hw1.0/firmware-6.bin
> +			ath10k/QCA9377/hw1.0/firmware-6.bin \
> +			ath10k/QCA9377/hw1.0/firmware-sdio-5.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
>  endif
>  
> 
