From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Jan 2013 21:15:21 +0100
Subject: [Buildroot] [PATCH v2] configs: add RaspberryPi defconfig
In-Reply-To: <50F046F7.3060607@je-eigen-domein.nl>
References: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
 <50F046F7.3060607@je-eigen-domein.nl>
Message-ID: <50F072D9.3010808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/13 18:08, Floris Bos wrote:
> On 01/11/2013 02:17 PM, Maxime Hadjinlian wrote:
>> In order to have a working SDCard, you should have at least two
>> partitions :
>
> Might also be worth mentioning that for use cases that do not require
> file changes to persist across reboots you can go the initramfs route,
> and let the bootloader load the entire rootfs to memory at boot.
>
> - "make menuconfig" -> select "Filesystem images" -> "initramfs for
> intial ramdisk of linux kernel"
> - After build simply copy the files from target to a FAT formatted SD card.
>
> No need to mess with extra partitions that way, and you are less affected
> by the glitches the Pi's SD card kernel module has from time to time.

  Does the RPi bootloader support initrd loading? In that case, maybe 
it's better to default to rootfs.cpio.gz (or .lzma) and adapt the 
config.txt accordingly. That way, creating a bootable is a lot simpler: 
just chuck the entire images directory on a FAT-formatted SD card...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
