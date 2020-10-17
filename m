From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 18:20:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add rpi
 settings files
In-Reply-To: <20201017151848.1283394-1-fhunleth@troodon-software.com>
References: <20201017151848.1283394-1-fhunleth@troodon-software.com>
Message-ID: <20201017162058.GP3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2020-10-17 11:18 -0400, Frank Hunleth spake thusly:
> The brcmfmac drivers now load settings files for BCM434xx devices and
> fail if they're missing on the Raspberry Pi:
> 
> brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2
> 
> This commit copies the missing settings files over to the firmware
> directory with the other files.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/linux-firmware.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 8a44129102..e2a6ebcbf1 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -547,7 +547,10 @@ LINUX_FIRMWARE_FILES += \
>  	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43430-sdio.bin \
>  	brcm/brcmfmac43430a0-sdio.bin brcm/brcmfmac43455-sdio.bin \
>  	brcm/brcmfmac43569.bin brcm/brcmfmac43570-pcie.bin \
> -	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin
> +	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin \
> +	brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt \
> +	brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt \
> +	brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
>  endif
>  
> -- 
> 2.25.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
