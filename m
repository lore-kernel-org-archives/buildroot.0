From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 11 Jan 2013 22:16:33 +0100
Subject: [Buildroot] [PATCH v2] configs: add RaspberryPi defconfig
In-Reply-To: <50F072D9.3010808@mind.be>
References: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
 <50F046F7.3060607@je-eigen-domein.nl> <50F072D9.3010808@mind.be>
Message-ID: <50F08131.1080208@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/2013 09:15 PM, Arnout Vandecappelle wrote:
> On 11/01/13 18:08, Floris Bos wrote:
>> On 01/11/2013 02:17 PM, Maxime Hadjinlian wrote:
>>> In order to have a working SDCard, you should have at least two
>>> partitions :
>>
>> Might also be worth mentioning that for use cases that do not require
>> file changes to persist across reboots you can go the initramfs route,
>> and let the bootloader load the entire rootfs to memory at boot.
>>
>> - "make menuconfig" -> select "Filesystem images" -> "initramfs for
>> intial ramdisk of linux kernel"
>> - After build simply copy the files from target to a FAT formatted SD 
>> card.
>>
>> No need to mess with extra partitions that way, and you are less 
>> affected
>> by the glitches the Pi's SD card kernel module has from time to time.
>
>  Does the RPi bootloader support initrd loading? In that case, maybe 
> it's better to default to rootfs.cpio.gz (or .lzma) and adapt the 
> config.txt accordingly. That way, creating a bootable is a lot 
> simpler: just chuck the entire images directory on a FAT-formatted SD 
> card... 

The bootloader does support loading separate initrd files through a 
config.txt option.
But the standard bcmrpi_defconfig Raspberry kernel does not, because 
CONFIG_BLK_DEV_INITRD isn't enabled in the default configuration.

If you cannot use the standard kernel, and have to compile your own 
anyway, it is easier to use the buildroot "initramfs" option, and have 
the initramfs integrated into zImage.


Yours sincerely,

Floris Bos
