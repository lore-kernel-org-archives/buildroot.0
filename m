From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 19 Sep 2012 10:09:04 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <CALR4fEJzZPa+CAeCvuFrFZoNwO562+6_LDEM8xP2a15dy1YJuA@mail.gmail.com>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
 <5058EF56.3070208@mind.be>
 <CALR4fEJzZPa+CAeCvuFrFZoNwO562+6_LDEM8xP2a15dy1YJuA@mail.gmail.com>
Message-ID: <CAAfyv365AxzAfJSP3rnhbgKoDKMq19AyUnZkkSW54uerXCOYTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2012 at 9:59 AM, Diego Iastrubni <diegoiast@gmail.com> wrote:
> On Wed, Sep 19, 2012 at 1:01 AM, Arnout Vandecappelle <arnout@mind.be>
> wrote:
>>>
>>> +ifeq ($(BR2_PACKAGE_RASPBERRYPI_BOOTLOADER),y)
>>> +BOOT_FILE := #empty
>>> +ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM128),y)
>>> +BOOT_FILE += arm128_start.elf
>>> +else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM192),y)
>>> +BOOT_FILE += arm192_start.elf
>>> +else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM224),y)
>>> +BOOT_FILE += arm224_start.elf
>>> +else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM240),y)
>>> +BOOT_FILE += arm240_start.elf
>>> +endif
>>> +
>>> +define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_BOOTLOADER
>>> +       if [ ! -d "$(TARGET_DIR)/boot" ]; then \
>>> +               mkdir $(TARGET_DIR)/boot; \
>>> +       fi; \
>>
>>
>>  Just "mkdir -p $(TARGET_DIR)/boot".  Or even better, replace the cp
>> below with
>>         install -D -m 0644 <fromfile> <tofile>
>>
>>
>
> Wait... this implies that /boot/ is on the rootfs... ext2... and rbpi
> demands that the "boot" partition will be vfat.. right? What am I missing?
My mistake, this shouldn't got to $(TARGET_DIR) but to $(IMAGES_DIR)
which will then can be copied by user to FAT partition of SD card
necessary for booting.
There is no need to have it in rootfs/boot.

Cheers,

marek
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
