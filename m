From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Apr 2018 08:09:29 +0300
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Qualcomm video
 firmware option
In-Reply-To: <CAEj2-1MXk1LHVQbJ8+68rncDMEYf6GpjC5daO5GrRA9Wyf-FXw@mail.gmail.com>
References: <CAEj2-1OQaPzpLwrrzN-42WDUiRk-eWd9=GPUtUYmJXdWQp124Q@mail.gmail.com>
 <20180326233251.22f44208@windsurf.home>
 <CAEj2-1MXk1LHVQbJ8+68rncDMEYf6GpjC5daO5GrRA9Wyf-FXw@mail.gmail.com>
Message-ID: <20180411050929.h2jbewffcejtyu2f@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andre,

On Wed, Apr 11, 2018 at 02:09:46AM +0000, Andre Renaud wrote:
> Added Qualcomm video accelerator and GPU firmware option.
> 
> Signed-off-by: Andre Renaud <andre@ignavus.net>

...

> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS),y)
> +LINUX_FIRMWARE_DIRS += qcom/venus-1.8 qcom/venus-4.2
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom

qcom/NOTICE.txt is also applicable, I think. Don't forget to update the .hash 
file.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO),y)
> +LINUX_FIRMWARE_FILES += qcom/a*
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
