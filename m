From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Apr 2016 16:53:43 +0200
Subject: [Buildroot] [PATCH v4 3/7] barebox: support custom barebox
 output image name
In-Reply-To: <5702F6AD.1030402@mind.be>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-4-git-send-email-pieter@boesman.nl>
 <5702F6AD.1030402@mind.be>
Message-ID: <20160406165343.52e3d652@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Apr 2016 01:20:13 +0200, Arnout Vandecappelle wrote:

> > +config BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE
> > +	string "Output image filename"
> 
>   With my suggestion of  BR2_TARGET_BAREBOX_IMAGE_NAME, this should be changed 
> to e.g. BR2_TARGET_BAREBOX_OUTPUT_IMAGE_NAME. The prompt looks OK though.
> 
> 
>   However, on second thought I'm wondering if it is really needed. For u-boot or 
> the kernel, we always copy the images with the same name as they were built. If 
> that is not what the ROM boot loader expects, the name can be changed in the 
> image generation script. For example, genimage.cfg could contain:
> 
> image boot.vfat {
>          vfat {
>                  file MLO {
> 			"barebox-am33xx-beaglebone-mlo.img"
> 		}
> 		file barebox.img {
> 			"barebox-am33xx-beaglebone.img"
>                  }
>          }
>          size = 8M
> }
> 
> 
>   What do you think?

I agree, we don't do this for U-Boot/kernel or any other thing, so I
don't think we should be doing it for Barebox.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
