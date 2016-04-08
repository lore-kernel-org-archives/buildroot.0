From: Pieter Smith <pieter@boesman.nl>
Date: Fri, 8 Apr 2016 09:51:15 +0200
Subject: [Buildroot] [PATCH v4 3/7] barebox: support custom barebox
	output image name
In-Reply-To: <57059689.8070200@mind.be>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-4-git-send-email-pieter@boesman.nl>
 <5702F6AD.1030402@mind.be> <20160406201410.GA5332@smipidev>
 <57059689.8070200@mind.be>
Message-ID: <20160408075115.GA20544@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 07, 2016 at 01:06:49AM +0200, Arnout Vandecappelle wrote:
> On 04/06/16 22:14, Pieter Smith wrote:
> >Hi Arnout / Thomas,
> >
> >On Tue, Apr 05, 2016 at 01:20:13AM +0200, Arnout Vandecappelle wrote:
> [snip]
> >>  However, on second thought I'm wondering if it is really needed. For u-boot
> >>or the kernel, we always copy the images with the same name as they were
> >>built. If that is not what the ROM boot loader expects, the name can be
> >>changed in the image generation script. For example, genimage.cfg could
> >>contain:
> >>
> >>image boot.vfat {
> >>         vfat {
> >>                 file MLO {
> >>			"barebox-am33xx-beaglebone-mlo.img"
> >>		}
> >>		file barebox.img {
> >>			"barebox-am33xx-beaglebone.img"
> >>                 }
> >>         }
> >>         size = 8M
> >>}
> >>
> >>
> >>  What do you think?
> >
> >I agree that this is cleaner from a buildroot perspective. But this would
> >require carrying a genimage.cfg patch for barebox as part of
> >beaglebone_barebox_defconfig. Is this what you are suggesting?
> 
>  I don't really understand what you mean. As I suggested in that patch, it
> would be nice to add a genimage config as well. When you do that, you can
> use a fragment like above to make sure the files will have the correct name
> in the filesystem. (Like above, except I screwed up the indentation :-)

The vfat file attribute also expects an "image=" key, not just the image name.

Thanks! This will be in v5 of the patch-set.

[snip]

- Pieter Smith
