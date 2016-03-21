From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 21 Mar 2016 09:46:53 +0000
Subject: [Buildroot] [PATCH v2 17/17] configs/stm32f469_disco: new
 configuration for STM32F469 Discovery board
In-Reply-To: <1458335299-27409-18-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-18-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160321094653.GA3529@x1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Mar 2016, Thomas Petazzoni wrote:

> From: Lee Jones <lee.jones@linaro.org>
> 
> Similar to stm32f429_disco, this commit adds a configuration for the
> Cortex-M4 based STM32F469 platform.
> 
> It requires a few kernel patches, which have already been submitted
> upstream, as well as a small OpenOCD patch. Besides that, it re-uses
> most of what has been added for the STM32F429 platform.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> [Thomas:
>  - squash multiple patches from Lee Jones into one
>  - improve the readme.txt file
>  - sync the defconfig with the adaptations made to the stm32f429
>    configuration.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  board/stmicroelectronics/stm32f469-disco/flash.sh  |  20 ++++
>  ...-ARM-stm32-Identify-a-new-board-STM32F469.patch |  25 +++++
>  ...upply-a-DTS-file-for-the-STM32F469-Discov.patch | 101 +++++++++++++++++++++
>  ...-Add-new-config-fragment-to-change-RAM-st.patch |  28 ++++++
>  .../patches/openocd/0001-add-config.patch          |  37 ++++++++
>  .../patches/openocd/0002-flash-nor.patch           |  37 ++++++++
>  .../stmicroelectronics/stm32f469-disco/readme.txt  |  19 ++++
>  configs/stm32f469_disco_defconfig                  |  19 ++++
>  8 files changed, 286 insertions(+)
>  create mode 100755 board/stmicroelectronics/stm32f469-disco/flash.sh
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-Identify-a-new-board-STM32F469.patch
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-Supply-a-DTS-file-for-the-STM32F469-Discov.patch
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-Add-new-config-fragment-to-change-RAM-st.patch
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/readme.txt
>  create mode 100644 configs/stm32f469_disco_defconfig

[...]

> diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
> new file mode 100644
> index 0000000..3b88496
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
> @@ -0,0 +1,19 @@
> +STM32F469 Discovery
> +===================
> +
> +This tutorial describes how to use the predefined Buildroot
> +configuration for the STM32F469 Discovery evaluation platform.
> +
> +Building
> +--------
> +
> +  make stm32f469_disco_defconfig
> +  make
> +
> +Flashing
> +--------
> +
> +  ./board/stmicroelectronics/stm32/stm32f469-disco/flash.sh output/

Looks like you've removed the stm32 directory, but still reference it
from readme.txt

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org ? Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
