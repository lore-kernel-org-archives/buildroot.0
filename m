From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:25:59 +0200
Subject: [Buildroot] [PATCH v3 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <20180620120505.17533-1-jagan@amarulasolutions.com>
References: <20180620120505.17533-1-jagan@amarulasolutions.com>
Message-ID: <20180626232559.7072b548@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jagan,

Thanks for this new iteration and the improvements. However, there is
still one thing I don't understand.

On Wed, 20 Jun 2018 17:35:04 +0530, Jagan Teki wrote:

> +build files at output/images/:
> +  - sunxi-spl.bin
> +  - u-boot.itb
> +  - Image
> +  - sun50i-a64-amarula-relic.dtb
> +  - boot.vfat
> +  - rootfs.ext4
> +  - sdcard.img

Why do you generate sdcard.img ? It is not used anywhere in the
instructions below, because you're just flashing the eMMC through
fastboot, on a per-partition basis.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
