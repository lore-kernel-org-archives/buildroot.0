From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 19 Sep 2012 10:59:55 +0300
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <5058EF56.3070208@mind.be>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
 <5058EF56.3070208@mind.be>
Message-ID: <CALR4fEJzZPa+CAeCvuFrFZoNwO562+6_LDEM8xP2a15dy1YJuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2012 at 1:01 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

> +ifeq ($(BR2_PACKAGE_RASPBERRYPI_**BOOTLOADER),y)
>> +BOOT_FILE := #empty
>> +ifeq ($(BR2_PACKAGE_BOOTLOADER_**ARM128),y)
>> +BOOT_FILE += arm128_start.elf
>> +else ifeq ($(BR2_PACKAGE_BOOTLOADER_**ARM192),y)
>> +BOOT_FILE += arm192_start.elf
>> +else ifeq ($(BR2_PACKAGE_BOOTLOADER_**ARM224),y)
>> +BOOT_FILE += arm224_start.elf
>> +else ifeq ($(BR2_PACKAGE_BOOTLOADER_**ARM240),y)
>> +BOOT_FILE += arm240_start.elf
>> +endif
>> +
>> +define RASPBERRYPI_FIRMWARE_INSTALL_**TARGET_BOOTLOADER
>> +       if [ ! -d "$(TARGET_DIR)/boot" ]; then \
>> +               mkdir $(TARGET_DIR)/boot; \
>> +       fi; \
>>
>
>  Just "mkdir -p $(TARGET_DIR)/boot".  Or even better, replace the cp
> below with
>         install -D -m 0644 <fromfile> <tofile>
>
>
>
Wait... this implies that /boot/ is on the rootfs... ext2... and rbpi
demands that the "boot" partition will be vfat.. right? What am I missing?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120919/d64eba75/attachment.html>
