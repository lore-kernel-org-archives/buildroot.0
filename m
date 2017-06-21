From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 22:46:48 +0200
Subject: [Buildroot] [PATCH v2] board: added support for Raspberry Pi
 Zero W
In-Reply-To: <1498077584-19344-1-git-send-email-yves.deweerdt.linux@gmail.com>
References: <1498077584-19344-1-git-send-email-yves.deweerdt.linux@gmail.com>
Message-ID: <20170621224648.44373a00@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jun 2017 22:39:44 +0200, Yves Deweerdt wrote:
> added a new config file for the Raspberry Pi Zero W (rpi0w)
> - added new folder for raspberrypi0w
> - included the overlays in the genimage config
> - add pi3-miniuart-bt overlay to the config
> - remove rpi0w device tree from the raspberrypi0_defconfig and genimage
> 
> Signed-off-by: Yves Deweerdt <yves.deweerdt.linux@gmail.com>

I'd like a review/ack from Peter Seiderer, or other RPi folks of the
Buildroot community. I think the commit log should summarize why the
Zero W support is removed from raspberrypi0_defconfig, and why a
separate defconfig is needed.

> ---
>  board/raspberrypi/genimage-raspberrypi0.cfg  |  1 -
>  board/raspberrypi/genimage-raspberrypi0w.cfg | 31 +++++++++++++++++++++++++
>  board/raspberrypi0w                          |  1 +
>  configs/raspberrypi0_defconfig               |  2 +-
>  configs/raspberrypi0w_defconfig              | 34 ++++++++++++++++++++++++++++
>  5 files changed, 67 insertions(+), 2 deletions(-)
>  create mode 100644 board/raspberrypi/genimage-raspberrypi0w.cfg
>  create mode 120000 board/raspberrypi0w
>  create mode 100644 configs/raspberrypi0w_defconfig

An update to board/raspberrypi/readme.txt would be needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
