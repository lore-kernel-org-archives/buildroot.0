From: Andrew Webster <Awebster@arcx.com>
Date: Mon, 6 Jun 2016 15:57:33 +0000
Subject: [Buildroot] [PATCH 00/10] Bump NXP package versions
In-Reply-To: <CAAMH-ytGSshRJTZiqmQ4DeztuA5L_GtfnF8aTCUorx9vw87baA@mail.gmail.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <CAAMH-ytGSshRJTZiqmQ4DeztuA5L_GtfnF8aTCUorx9vw87baA@mail.gmail.com>
Message-ID: <0f097ae31f8444679d97f85146459fd5@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Gary Bisson [mailto:gary.bisson at boundarydevices.com]
> Sent: Monday, June 06, 2016 10:32 AM
> To: Andrew Webster
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 00/10] Bump NXP package versions
> 
> Andrew, All,
> 
> First of all, thank you for taking care of this update. It's good to have
> someone else looking at those ;-)

Glad to help.  Thanks for all your work on these packages.

> 
> On Fri, Jun 3, 2016 at 3:10 PM, Andrew Webster <awebster@arcx.com>
> wrote:
> > The following packages were renamed:
> >  libfslcodec -> imx-codec
> >  libfslparser -> imx-parser
> >  libfslvpuwrap -> imx-vpuwrap
> > In addition to renaming, I also moved them into the freescale-imx
> > directory which seems consistent with other similarily named packages
> > (although that directory may be due for a rename now too).  Not sure
> > if this was appropriate or not.
> 
> I'm ok moving things to freescale-imx, I think it makes it easier for people
> looking at i.MX-specific packages instead of browsing through both hardware
> handling packages and multimedia libraries.
> However I guess Thomas and/or Peter will have ack this change.
> 
> As for changing the 'freescale-imx' name, I agree this will need to happen but
> there's no rush in my opinion. Especially since the Yocto layer is still called
> meta-*fsl*-arm.
> 
> > Andrew Webster (10):
> >   firmware-imx: bump to version 5.4
> >   gst1-imx: bump to version 0.12.1
> >   imx-vpu: bump to version 5.4.33
> >   imx-codec: rename from libfslcodec and bump version to 4.0.9
> >   imx-parser: rename from libfslparser and bump version to 4.0.9
> >   imx-vpuwrap: rename from libfslvpuwrap and bump version to 1.0.65
> >   imx-gpu-viv: bump version to 5.0.11-p8.3
> >   libimxvpuapi: bump version to 0.10.2
> >   imx-lib: bump version to 5.4
> >   xdriver_xf86-video-imx-viv: bump version to 5.0.11-p8.3
> 
> I will comment on each individual patch above but I have a couple of
> questions:
> - Why isn't there the kernel-module-imx-gpu-viv update? It is very important
> to keep it in line with imx-gpu-viv.

We don't use this (yet), so I didn't want to update it without testing it.

> - What about imx-kobs?

We also don't use this (no NAND on the board).  As above, I didn't want to update without testing.

I can certainly update these versions and confirm that they build, if someone else can test.

> - Can you share your testing setup (platform name + defconfig)?

Tested on a custom i.MX6Q board.  I used the freescale_imx6qsabresd defconfig, but with a different kernel and toolchain.

We are in the process of updating to the latest 4.1.15 kernel release.  I will update the gpu packages to p8.4 after that and resubmit.

> 
> Regards,
> Gary

Andrew
