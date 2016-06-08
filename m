From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 8 Jun 2016 20:20:38 +0200
Subject: [Buildroot] [PATCH 01/10] firmware-imx: bump to version 5.4
In-Reply-To: <8ef1df9a47e640e7b013c25300844747@WEBMAIL.arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <642a0f54088507a92effa0f935950326f752d0c8.1464958470.git.awebster@arcx.com>
 <CAAMH-ysqVQDCw1_OmC79tqOEKrTftaOJk=0gNrW7-j3fNMHURQ@mail.gmail.com>
 <282d0384157042e28d80a63646119b3b@WEBMAIL.arcx.com>
 <CAAMH-ysUdKhcab9-F6CjhYJQVFsq__jQ__pOQUU7+Hf03ipofg@mail.gmail.com>
 <8ef1df9a47e640e7b013c25300844747@WEBMAIL.arcx.com>
Message-ID: <CAAMH-yt_t3dTuy2jkBmsP1iUg+Jf6xewSQfq5HCdsWeO9TWi=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

Le 8 juin 2016 7:33 PM, "Andrew Webster" <Awebster@arcx.com> a ?crit :
>
> Gary,
>
> >From: Gary Bisson [mailto:gary.bisson at boundarydevices.com]
> >Sent: Tuesday, June 07, 2016 3:37 AM
> >
> >>> Hmm, that's cool because it means the firmware can now be used by
> >>> mainline kernel seamlessly, but it also means that it won't work on
> >>> any kernel < 4.1.15. Do you confirm you've tried it on 4.1.15 kernel
only?
> >>
> >> Correct, tested against the 4.1.15 kernel only.
> >
> >I'll try but I'm pretty sure this won't work on 3.14.52.
>
> There will be a similar problem with the imx-gpu-viv package.  I believe
that the kernel version and the gpu library need to match (correct me if
I'm wrong).  This would mean that if either the kernel or imx-gpu-viv are
updated without the other, things may not work properly at run-time.  I
expect that the X-windows driver also needs to match the others.  So, no
matter the order of the patches, run-time will be broken between some
patches until others have been applied.

The difference is that there is nothing you can do about the VPU whereas
the graphics libraries always match the kernel module which can be built
against any kernel >= 3.10.53.

Also I don't mind the order that much, it is just that it makes more sense
to have graphics patches together and multimedia one on their own as they
are not dependent on each other.

> I am thinking to re-order the patches as follows:
>
>  1. defconfig kernel version bump [NEW]
>  2. kernel-module-imx-gpu-viv [NEW]
>  3. imx-gpu-viv bump
>  4. xdriver_xf86-video-viv bump
>  5. firmware-imx bump
>  6. gst1-imx bump
>  7. imx-vpu bump
>  8. imx-codec bump/rename
>  9. imx-parser bump/rename
>  10. imx-vpuwrap bump/rename
>  11. libimxvpuapi bump
>  12. imx-lib bump
>  13. imx-kobs bump [NEW]
>
> Does this make sense to you?

Yes that looks good to me.

Regards,
Gary
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160608/c253546c/attachment.html>
