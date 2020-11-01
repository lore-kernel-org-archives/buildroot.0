From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 1 Nov 2020 14:08:56 +0300
Subject: [Buildroot] [PATCH v3 4/4] configs/stm32mp157c-dk2: add support
 for wifi
In-Reply-To: <20201007144945.1697081-4-shlomi.39sd@gmail.com>
References: <20201007144945.1697081-1-shlomi.39sd@gmail.com>
 <20201007144945.1697081-4-shlomi.39sd@gmail.com>
Message-ID: <20201101110856.GA1177156@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> Adding support for wifi for stm32mp157c-dk2 is achieved by using
> another dts which includes the bindings for the wifi module.
> In addition, a txt file for the wifi firmware was added.
> This was copied from the yocto bsp layer of st.
> 
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> ---
>  .../stm32mp157c-dk2/linux.config              |  4 +-
>  .../overlay/boot/extlinux/extlinux.conf       |  2 +-
>  .../brcmfmac43430-sdio.st,stm32mp157c-dk2.txt | 59 +++++++++++++++++++
>  .../stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts  | 32 ++++++++++
>  configs/stm32mp157c_dk2_defconfig             |  7 ++-
>  5 files changed, 100 insertions(+), 4 deletions(-)
>  create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt
>  create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts

I would suggest to add a kernel patch for stm32mp157c-dk2 dts file
instead of adding custom dts directly. This way no need to modify
extlinux.conf. Besides, patch will be easy to drop as soon as wifi
support is mainlined.


As for WiFi on stm32mp157c-dk2, I have the same problems as mentioned
earlier in this email thread. Firmware is loaded, but times out later on

[8.083508] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50
[9.130954] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50

I tried both linux-firmware and murata firmware package. None of them
makes wifi work on my board.

Regards,
Sergey
