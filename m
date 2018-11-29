From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 23:04:01 +0100
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: use prebuilt
 BL33 images
In-Reply-To: <1542900148-17204-1-git-send-email-etienne.carriere@linaro.org>
References: <1542900148-17204-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20181129230401.510c62a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Thu, 22 Nov 2018 16:22:28 +0100, Etienne Carriere wrote:
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
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  boot/arm-trusted-firmware/Config.in               | 22 +++++++++++++++++++++-
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk |  4 ++++
>  2 files changed, 25 insertions(+), 1 deletion(-)

Thanks for this contribution. Could you explain the use case/rationale
for this change ? In which situation do you want to use prebuilt BL33
images, as opposed to having another Buildroot package that builds (or
downloads) them ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
