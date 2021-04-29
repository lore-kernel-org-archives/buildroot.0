From: Marko Stanisic <sankerspace@gmail.com>
Date: Thu, 29 Apr 2021 17:50:39 +0200
Subject: [Buildroot] Boot from CRAMFS partition on an emmc
Message-ID: <5b033e7b-0a24-9088-986b-7e8f05f66620@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

Have someone worked extensively with cramfs rootfs?

I created an emmc.img file in buildroot 2020.11.1.

(several partitions with two same rootfs.cramfs partitions, but loading 
from one of them at a time)


I have created two rootfs partitions in that image file , which are both 
defined as

a CRAM Filesystem. (have zImage and device tree inside a rootfs.cramfs 
in the folder /boot)


My f*irst problem* is that i have no clue how to handle these two 
partition from U-boot (2016)

I have following commands:

 ?? - cramfsls (should show directory from an image??) and

 ?? - cramfsload?? (have to set environment variable cramfsaddr, from 
where the cramfs is loaded plus offset )


*Second problem* is that with *mmc part*? the rootfs.cramfs partitions 
are not visible, but both defined as bootable.

But i know startadress and number of sectors from every partition

(got from fdisk -l on my host pc inspecting the emmc.img)


Maybe i have some missunderstanding how to handle that, but have someone 
an idea here?

Thanks for every help i get!!


PS: I dont want ramdisks as these are regularly used with cramfs



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210429/86179a21/attachment.html>
