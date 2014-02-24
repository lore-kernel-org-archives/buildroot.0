From: Charles Manning <cdhmanning@gmail.com>
Date: Mon, 24 Feb 2014 15:26:41 +1300
Subject: [Buildroot] [PATCH v2] configs: add SoCkit defconfig
In-Reply-To: <1393005432-14285-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1393005432-14285-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <201402241526.41765.manningc2@actrix.gen.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sebasitian

> +Copy the rootfs :
> +
> +  $ sudo dd if=rootfs.ext2 of=/dev/mmcblk0p2 bs=64k

It is advisable to do:

sudo sync 

at this stage. Some hosts do async writing to block devices and popping the SD 
card after a write (particularly a large one) can end up losing data.


> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5"

> +BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"

IMHO, this way of doing sockit board support is ugly because it stomps over 
socfpga_cyclone5 breaks builds for that board . I know that this is the way 
most people are doing it, but still...


It is probably better if this is handled with proper boards.

There is some work that Walter Lozano and I are doing which helps move this 
along. There is some discussion on the rocketboard RFI ML.

I am going to try to get a github repository of u-boot up that builds this as 
socfpga_cyclone5 and then get the rocketboard people to merge it.

Regards

Charles
