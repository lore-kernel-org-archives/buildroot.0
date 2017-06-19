From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 22:27:53 +0200
Subject: [Buildroot] [PATCH 1/1] rpi0w: added support for Raspberry Pi
 Zero W
In-Reply-To: <1497815044-11215-1-git-send-email-yves.deweerdt.linux@gmail.com>
References: <1497815044-11215-1-git-send-email-yves.deweerdt.linux@gmail.com>
Message-ID: <20170619222753.7655732a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 21:44:04 +0200, Yves Deweerdt wrote:
> added a new config file for the Raspberry Pi Zero W
> - added new folder for raspberrypi0w
> - included the overlays in the genimage config
> - add pi3-miniuart-bt overlay to the config
> - add enable_uart to the config
> 
> Signed-off-by: Yves Deweerdt <yves.deweerdt.linux@gmail.com>

I am a bit confused: what do you need in this defconfig, that the
existing raspberrypi0_defconfig doesn't provide?

Your proposed defconfig is using the exact same kernel version and list
of Device Trees. The only differences are:

+BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y

and:

+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"

Is this the motivation for this separate defconfig? Could the existing
raspberrypi0_defconfig be extended to also work for your use case,
while keeping compatibility for the RPi Zero ?

If not, we should remove the RPi Zero W support from
raspberrypi0_defconfig, because otherwise things are pretty confusing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
