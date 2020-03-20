From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2020 23:14:36 +0100
Subject: [Buildroot] [PATCH v4 3/4] boot/arm-trusted-firmware: add
 support for rockchip rk3399
In-Reply-To: <1584614812-20061-4-git-send-email-sunil@amarulasolutions.com>
References: <20200318215216.187d07bd@windsurf.home>
 <1584614812-20061-1-git-send-email-sunil@amarulasolutions.com>
 <1584614812-20061-4-git-send-email-sunil@amarulasolutions.com>
Message-ID: <20200320231436.17381516@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Mar 2020 16:16:51 +0530
sunil at amarulasolutions.com wrote:

> +ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM)),rk3399)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-a-toolchain
> +endif

I already mentioned we don't want platform-specific conditionals like
this in previous reviews of this patch series.

I think here what we want is a
BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
