From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 11 Jan 2013 18:08:07 +0100
Subject: [Buildroot] [PATCH v2] configs: add RaspberryPi defconfig
In-Reply-To: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <50F046F7.3060607@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/2013 02:17 PM, Maxime Hadjinlian wrote:
> In order to have a working SDCard, you should have at least two partitions :

Might also be worth mentioning that for use cases that do not require 
file changes to persist across reboots you can go the initramfs route, 
and let the bootloader load the entire rootfs to memory at boot.

- "make menuconfig" -> select "Filesystem images" -> "initramfs for 
intial ramdisk of linux kernel"
- After build simply copy the files from target to a FAT formatted SD card.

No need to mess with extra partitions that way, and you are less 
affected by the glitches the Pi's SD card kernel module has from time to 
time.


Yours sincerely,

Floris Bos
