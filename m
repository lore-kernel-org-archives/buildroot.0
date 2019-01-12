From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jan 2019 08:43:58 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/linux-firmware : Install
 binary blobs for e100 ethernet driver
In-Reply-To: <20190111075009.5274-1-dplamp@gmx.com>
References: <20190111075009.5274-1-dplamp@gmx.com>
Message-ID: <20190112074358.GF2428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2019-01-11 08:50 +0100, dplamp at gmx.com spake thusly:
> From: David Picard <dplamp@gmx.com>
> 
> Add an option in the menuconfig  submenu of linux-firmware package. Install
> the firmware binary files to the target directory if the option is selected.
> 
> ---
> Changes v1 -> v2
> - change BR2_PACKAGE_LINUX_FIRMWARE_E100 to BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
> - change menu caption from "e100 / Intel 825xx" to "Intel e100 825xx"
> 
> Signed-off-by: David Picard <dplamp@gmx.com>

Your SoB line should go before the first '---'.

[--SNIP--]
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index ee02c7a030..86e1d1e750 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -389,6 +389,11 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw*.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100),y)
> +LINUX_FIRMWARE_FILES += e100/*.bin
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100

Please, also add the hash for the license file in
package/linux-firmware/linux-firmware.hash

Regards,
Yann E. MORIN.

> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X),y)
>  LINUX_FIRMWARE_FILES += \
>  	qed/qed_init_values_zipped-*.bin
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
