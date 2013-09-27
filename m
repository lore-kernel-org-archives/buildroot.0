From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 27 Sep 2013 15:21:09 +0300
Subject: [Buildroot] [PATCH] beagleboneblack: add board
In-Reply-To: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
Message-ID: <1380284469.22318.31.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2013-09-26 at 18:40 +0000, Jason Kridner wrote:
> From: Jason Kridner <jdk@ti.com>
> 
> Signed-off-by: Jason Kridner <jdk@ti.com>
> ---
>  board/beagleboneblack/linux-3.8.config | 4305 ++++++++++++++++++++++++++++++++
>  configs/beagleboneblack_defconfig      |   38 +
>  2 files changed, 4343 insertions(+)
>  create mode 100644 board/beagleboneblack/linux-3.8.config
>  create mode 100644 configs/beagleboneblack_defconfig
> 

Tested this with Beaglebone Black. u-boot loads kernel image
from /boot/uImage by default (see include/configs/am335x_evm.h) so that
BR2_LINUX_KERNEL_INSTALL_TARGET is needed to be able to boot.

I see these errors at startup:

/etc/init.d/S93-am335x-pm-firmware-load: line 4: can't
create /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading: nonexistent directory
/etc/init.d/S93-am335x-pm-firmware-load: line 5: can't
create /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data: nonexistent directory
/etc/init.d/S93-am335x-pm-firmware-load: line 6: can't
create /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading: nonexistent directory


I have also tried my chance to boot "am335x evm starter kit" by adding
am335x-evmsk to the dts list; but it didn't boot :/

Thanks,
Fatih
