From: Pieter Smith <pieter@boesman.nl>
Date: Wed, 6 Apr 2016 22:14:10 +0200
Subject: [Buildroot] [PATCH v4 3/7] barebox: support custom barebox
	output image name
In-Reply-To: <5702F6AD.1030402@mind.be>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-4-git-send-email-pieter@boesman.nl>
 <5702F6AD.1030402@mind.be>
Message-ID: <20160406201410.GA5332@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout / Thomas,

On Tue, Apr 05, 2016 at 01:20:13AM +0200, Arnout Vandecappelle wrote:
> On 03/20/16 23:35, Pieter Smith wrote:
> >In preparation for building a 2nd barebox config, a configuration option is
> >added to allow customization of the image filename when the built image is
> >copied to the output/images directory.
> >
> >Signed-off-by: Pieter Smith <pieter@boesman.nl>
> >---
> >  boot/barebox/Config.in  | 7 +++++++
> >  boot/barebox/barebox.mk | 9 +++++++--
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> >diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> >index 4f6872c..7769866 100644
> >--- a/boot/barebox/Config.in
> >+++ b/boot/barebox/Config.in
> >@@ -106,6 +106,13 @@ config BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE
> >
> >  	  Set to barebox.bin for barebox versions older than 2012.10.
> >
> >+config BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE
> >+	string "Output image filename"
> 
>  With my suggestion of  BR2_TARGET_BAREBOX_IMAGE_NAME, this should be
> changed to e.g. BR2_TARGET_BAREBOX_OUTPUT_IMAGE_NAME. The prompt looks OK
> though.
> 
> 
>  However, on second thought I'm wondering if it is really needed. For u-boot
> or the kernel, we always copy the images with the same name as they were
> built. If that is not what the ROM boot loader expects, the name can be
> changed in the image generation script. For example, genimage.cfg could
> contain:
> 
> image boot.vfat {
>         vfat {
>                 file MLO {
> 			"barebox-am33xx-beaglebone-mlo.img"
> 		}
> 		file barebox.img {
> 			"barebox-am33xx-beaglebone.img"
>                 }
>         }
>         size = 8M
> }
> 
> 
>  What do you think?

I agree that this is cleaner from a buildroot perspective. But this would
require carrying a genimage.cfg patch for barebox as part of
beaglebone_barebox_defconfig. Is this what you are suggesting?

>  Regards,
>  Arnout

[snip]

- Pieter
