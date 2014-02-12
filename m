From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Wed, 12 Feb 2014 09:05:44 +0100
Subject: [Buildroot] Antw: Re: Antw: Re: Antw: Re: How to get the kernel to
 mount a rootfs without an initramfs ??
In-Reply-To: <52FA5E23.3090109@mind.be>
References: <1102199395.5272670.1392112422985.JavaMail.root@openwide.fr>
 <52FA5E23.3090109@mind.be>
Message-ID: <52FB3968020000460004A91A@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>Actually this sounds like you have no mmc driver in your kernel.

I'm using the defconfig where 

in make linux-menuconfig is selected the following:

+Device Drivers
 <*> MMC/SD/SDIO card support
+ + <*> MMC block device driver
+ + <*> MMC host test driver
+ + <*> Atmel SD/MMC Driver (Atmel Multimedia Card Interface support)
+ + [ * ] Atmel MCI DMA support (Exp.)

well but now, that you mention it, it's weired. When I do a bootable image with this settings but with initramfs and busybox as init system then I should be able to see which devices are detected, right? So If I do ls /dev/ mmcblk or sdb isn't even in the list, is that a normal behaviour?


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140212/c5dfdfc5/attachment.html>
