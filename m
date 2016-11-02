From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 21:48:16 +0100
Subject: [Buildroot] [PATCH v2 3/4] linux: add ev3dev extension
In-Reply-To: <1478056556-30242-4-git-send-email-david@lechnology.com>
References: <1478056556-30242-1-git-send-email-david@lechnology.com>
 <1478056556-30242-4-git-send-email-david@lechnology.com>
Message-ID: <20161102214816.70ac4508@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Nov 2016 22:15:55 -0500, David Lechner wrote:
> This adds an ev3dev Linux drivers extension that provides Linux kernel
> drivers for LEGO MINDSTORMS EV3 from the ev3dev project.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

I've applied, with one minor change, see below.


> +define EV3DEV_LINUX_DRIVERS_PREPARE_KERNEL
> +	mkdir -p $(LINUX_DIR)/drivers/lego; \

The ; \ was useless, those two commands can be separate.

> +	cp -dpfr $(EV3DEV_LINUX_DRIVERS_DIR)/* $(LINUX_DIR)/drivers/lego/

The rest is applied as-is.

Could you submit a patch to the DEVELOPERS file that adds you as a
developer for the ev3dev package, the linux extension, and the board?

Something along those lines:

N:	David Lechner <david@lechnology.com>
F:	board/lego/ev3/
F:	configs/lego_ev3_defconfig
F:	package/ev3dev-linux-drivers/
F:	linux/linux-ext-ev3dev-linux-drivers.mk

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
