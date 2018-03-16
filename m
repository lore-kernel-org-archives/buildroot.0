From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Mar 2018 23:35:48 +0100
Subject: [Buildroot] [PATCH v3 0/7] Add rpi3 b+ support
In-Reply-To: <CAFGQKxcg_O2Kr-VmUhgiDW9Q_4nZY8ZsMZhLCEcpTg7SZ+un_g@mail.gmail.com>
References: <20180316180232.18829-1-martin@barkynet.com>
 <20180316204132.30aadcfc@windsurf>
 <CAFGQKxcg_O2Kr-VmUhgiDW9Q_4nZY8ZsMZhLCEcpTg7SZ+un_g@mail.gmail.com>
Message-ID: <20180316232824.7a41721f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Mar 2018 21:06:52 +0000, Martin Bark wrote:

> The only reason for this seems to be the use of the pi3-miniuart-bt
> overlay.  Personally i never use this overlay, I set enable_uart=1 in
> config.txt (the same as raspi-config does).  Is there a reason
> buildroot favours the pi3-miniuart-bt overlay?

I am not familiar with those configuration details of the RPi platform,
but I remember they have been discussed in the past. Perhaps you can
check the commit log for some details about them.

Especially this commit log:

commit 1e03cc2290f98fc7434254d2abd9afd504de8360
Author: Peter Seiderer <ps.report@gmx.net>
Date:   Mon May 2 22:25:44 2016 +0200

    raspberrypi3: fix serial console (load pi3-miniuart-bt overlay)
    
    - enable BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS in raspberrypi3_defconfig
    - add copy of rpi-firmware/overlays directory to boot partition in genimage-raspberrypi3.cfg
    - enhance post-image.sh script to add 'dtoverlay=pi3-miniuart-bt' on request
    - add BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay" in raspberrypi3_defconfig
    
    Signed-off-by: Peter Seiderer <ps.report@gmx.net>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
