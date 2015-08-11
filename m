From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Tue, 11 Aug 2015 16:27:44 -0700
Subject: [Buildroot] bootm - "Starting kernel"
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD933F@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot mailing list,

My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I have made the former meet the latter's requirements. My target is Marvell ARMADA A385 (ARM-Cortex-A9) DB-88F6820-GP. This board is bootable using the U-Boot-1.73 and the USB which are given by Marvell.

I used Buildroot-2015.05 and built the uImage and rootfs.cpio.uboot with no problems. I enabled the TFTP server on my host.

On my target, the execution of the following commands, listed below, ended up with "Starting kernel", no display of kernel booting messages. The attached is the .config file I created this the make process.

I am resolving this issue now. Your experience sharing is extremely grateful.

Tommy

Marvell>> tftp 02000000 10.28.1.20:uImage
Using egiga0 device
TFTP from server 10.28.1.20; our IP address is 10.28.1.47
Filename 'uImage'.
Load address: 0x2000000
Loading: #################################################################
         #################################################################
         #################################################################
         ##############
         1.6 MiB/s
done
Bytes transferred = 1066696 (1046c8 hex)
Marvell>> tftp 02200000 10.28.1.20:rootfs.cpio.uboot
Using egiga0 device
TFTP from server 10.28.1.20; our IP address is 10.28.1.47
Filename 'rootfs.cpio.uboot'.
Load address: 0x2200000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ######################
         1.7 MiB/s
done
Bytes transferred = 4769344 (48c640 hex)
Marvell>> bootm 02000000 02200000
## Booting kernel from Legacy Image at 02000000 ...
   Image Name:   Linux-4.0.4
   Created:      2015-08-11   0:21:58 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1066632 Bytes = 1 MiB
   Load Address: 02000000
   Entry Point:  02000000
   Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 02200000 ...
   Image Name:
   Created:      2015-08-11  15:25:49 UTC
   Image Type:   ARM Linux RAMDisk Image (uncompressed)
   Data Size:    4769280 Bytes = 4.5 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   XIP Kernel Image ... OK
OK

Starting kernel ...



________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150811/7a72281d/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.aug11tue15
Type: application/octet-stream
Size: 1332 bytes
Desc: .config.aug11tue15
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150811/7a72281d/attachment.obj>
