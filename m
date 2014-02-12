From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 17:58:49 +0100
Subject: [Buildroot] Antw: Re: Antw: Re: Antw: Re: How to get the kernel
 to mount a rootfs without an initramfs ??
In-Reply-To: <52FB3968020000460004A91A@gwia2.rz.hs-offenburg.de>
References: <1102199395.5272670.1392112422985.JavaMail.root@openwide.fr>
 <52FA5E23.3090109@mind.be>
 <52FB3968020000460004A91A@gwia2.rz.hs-offenburg.de>
Message-ID: <52FBA849.3060101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/14 09:05, Frank Ihle wrote:
>>Actually this sounds like you have no mmc driver in your kernel.
> 
> I'm using the defconfig where
> 
> in make linux-menuconfig is selected the following:
> 
> +Device Drivers
>  <*> MMC/SD/SDIO card support
> + + <*> MMC block device driver
> + + <*> MMC host test driver
> + + <*> Atmel SD/MMC Driver (Atmel Multimedia Card Interface support)
> + + [ * ] Atmel MCI DMA support (Exp.)
> 
> well but now, that you mention it, it's weired. When I do a bootable
> image with this settings but with initramfs and busybox as init system
> then I should be able to see which devices are detected, right? So If I
> do ls /dev/ mmcblk or sdb isn't even in the list, is that a normal behaviour?

 No, it's not.

 The platform bindings may be missing in your board file.

 Which board are you building for? A standard board or a custom one? In
the latter case, you should check with your kernel developer where to
find the MMC device.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
