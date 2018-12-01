From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 1 Dec 2018 23:18:34 +0300
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: use prebuilt
 BL33 images
In-Reply-To: <1542900148-17204-1-git-send-email-etienne.carriere@linaro.org>
References: <1542900148-17204-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20181201201834.GA7451@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

> This change allows one to build ATF with an externally built
> BL33 image or with the U-boot as BL33 boot stage.
> 
> This change introduces a new configuration directive for TF-A to
> specify when BL33 stage is provided as a prebuilt image:
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_PREBUILT_BL33.
> 
> If BR2_TARGET_ARM_TRUSTED_FIRMWARE_PREBUILT_BL33 is enabled, the
> buildroot configuration shall specify the BL33 binary image location:
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL33_IMAGE.

...

> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE
>  	bool "ARM Trusted Firmware (ATF)"
> -	depends on BR2_aarch64 && BR2_TARGET_UBOOT
> +	depends on BR2_aarch64

Could you please clarify why do you want to get rid of this dependency ?
IIUC so far all the arm64/atf boards supported by BR make use of U-Boot.
If you plan to use this feature for a board with any other type of
bootloader, then maybe it makes sense to add board config as well. In this
case other developers will be able at least build-test this particular
config swtich when testing their own ATF changes.

Regards,
Sergey
