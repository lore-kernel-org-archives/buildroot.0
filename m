From: Jimmy <hello@86pixels.com>
Date: Mon, 22 Aug 2016 22:11:51 -0500
Subject: [Buildroot] Making a Bootable USB Image for x86_64
Message-ID: <f3ab074b-d314-7542-636a-fb3eb7d11878@86pixels.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings all,

I know this has been asked a lot, but I have been sifting through the 
archives and Google in order to find the best way to make a bootable USB 
image of my buildroot installation for an x86 based machine. I have done 
the following:

1. Generated a tar image of the root filesystem via the configuration menu
2. Selected grub2 from bootloaders with the i386-pc platform
3. Created a 1Gb EXT2FS partition with 1mb of space preceding on the USB 
device itself
4. Extracted the rootfs tar to the USB device on the ext2 partition
5. Ran the following from the main buildroot directory (as root):
./output/host/usr/sbin/grub-bios-setup -b 
./output/host/usr/lib/grub/i386-pc/boot.img -c ./output/images/grub.img 
-d . /dev/sdb

The command immediately exits with a "segmentation fault (Core dumped)".
I can assert the following:
a. grub-bios-setup exists in the directory specified.
b. boot.img exists in the directory specified
c. grub.img exists in the directory specified
d. /dev/sdb exists and is the USB device

Has anyone else ran into this? I'm trying to read up all I can on the 
issue but I'm running out of options, and I have a feeling its something 
really simple.

Thank you so much!
-- 
-- Jimmy
