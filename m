From: Marko Stanisic <sankerspace@gmail.com>
Date: Tue, 4 May 2021 00:21:14 +0200
Subject: [Buildroot] cramfs: unsupported filesystem features - ERROR
Message-ID: <dae15c1c-dc72-16dc-cfbf-9608763496a2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have created an emmc.img in Buildroot 2020.11 and flashed an emmc 
modul with that image.

The emmc.img file has two partitions with cramfs filesystem.(but i only 
have to load one) I tried to load the cramfs partition from the emmc 
into the RAM with the *cramfsls* - command and Iam very sure that i 
correctly loaded the cramfs partition with *mmc read* into the RAM.

I checked the RAM content with md.b - command and compared the first 
512byte visually with the hexdump of the rootfs.cramfs image (created by 
the genimage tool - called by buildroot).

But the problem ist that I get that weird error message *cramfs: 
unsupported filesystem features* in u-boot 2016.03 and i have no idea 
why. Normal gzip compression was used and XIP was turned off in the 
buildroot menuconfig.

Has anyone an idea, about the error message?

Note: I defined the "cramfsaddr" environment variable with an address 
location in the ram. That should be set to define an RAM address 
location inside the RAM to laod the cramfs partition.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210504/426f8d0e/attachment.html>
