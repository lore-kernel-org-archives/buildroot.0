From: Lukas Hecht <mixolydisch@gmx.de>
Date: Wed, 3 Mar 2021 16:48:28 +0100
Subject: [Buildroot] Problems with generating an x86 Image
Message-ID: <98397e30-a396-803a-ddc4-ed31719eae51@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

i'm having problems with generating an x86 image for an industrial pc
based on an AMD Embedded G-Series APU which runs perfectly fine using
Ubuntu.

Here's what i did, using Buildroot 2020.02.10:


make pc_x86_64_bios_defconfig

make menuconfig changes:

Filesystem Image: 250M size

iso image

initial ram filesystem

Networking applications - wireless-regdb (to get rid of an regdb error
while booting)

make


dd disk.img to USB drive, and then copy bzImage to /boot on the USB drive.

Boot my target system with clonezilla to console, and then dd the usb
drive to /dev/sda


When i reboot and remove the usb drive, grub starts and selects
"buildroot" after 5 seconds, and then the boot starts but i don't get to
the console. It stops with:


Welcome to Buildroot

buildroot login: scsi 0:0:0:0: Direct-Access Generic Ultra HS-COMBO 1.98
PQ: 0 ANSI : 0

sd 0:0:0:0 [sda] Attached SCSI removable disk

random: fast init done

random: crng init done (coming up after some minutes)


And there it just stops, with a blinking cursor. Can anyone point me to
what i am doing wrong?

If not, is there an easy way to access and save the console output that
comes up before these last lines to get a better understanding of what
is happening?

Thanks a lot!

Lukas
