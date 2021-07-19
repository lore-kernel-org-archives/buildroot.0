From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:29:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for
 V4L cx231xx devices
In-Reply-To: <20210712105718.4032192-1-clabbe@baylibre.com>
References: <20210712105718.4032192-1-clabbe@baylibre.com>
Message-ID: <20210719232955.386469b5@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Corentin,

On Mon, 12 Jul 2021 10:57:18 +0000
Corentin Labbe <clabbe@baylibre.com> wrote:

> V4L cx231xx devices need a firmware to be usefull.
> So this patch adds a submenu for V4L firmwares and an option for
> cx231xx devices.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Thanks for your patch.

> +menu "V4L Firmware"
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_V4L_CX231XX

We usually don't have the subsystem name in the option.

> +	bool "V4L CX231XX Firmware for Conexant Cx23100/101/102 USB broadcast A/V decoder"

This was a bit too long, and we normally only have the name of the
hardware, so I reduced a bit to:

	bool "Conexant Cx23100/101/102 USB broadcast A/V decoder"

> +	help
> +	  Firmware files for Conexant Cx23100/101/102 USB broadcast A/V decoder needed by the Linux CX231XX driver.

This line was too long, this is reported by "make check-package", so I
wrapped the line.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
