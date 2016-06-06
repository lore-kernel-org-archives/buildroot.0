From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 6 Jun 2016 16:32:28 +0200
Subject: [Buildroot] [PATCH 00/10] Bump NXP package versions
In-Reply-To: <cover.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
Message-ID: <CAAMH-ytGSshRJTZiqmQ4DeztuA5L_GtfnF8aTCUorx9vw87baA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

First of all, thank you for taking care of this update. It's good to
have someone else looking at those ;-)

On Fri, Jun 3, 2016 at 3:10 PM, Andrew Webster <awebster@arcx.com> wrote:
> The following packages were renamed:
>  libfslcodec -> imx-codec
>  libfslparser -> imx-parser
>  libfslvpuwrap -> imx-vpuwrap
> In addition to renaming, I also moved them into the freescale-imx directory
> which seems consistent with other similarily named packages (although that
> directory may be due for a rename now too).  Not sure if this was appropriate
> or not.

I'm ok moving things to freescale-imx, I think it makes it easier for
people looking at i.MX-specific packages instead of browsing through
both hardware handling packages and multimedia libraries.
However I guess Thomas and/or Peter will have ack this change.

As for changing the 'freescale-imx' name, I agree this will need to
happen but there's no rush in my opinion. Especially since the Yocto
layer is still called meta-*fsl*-arm.

> Andrew Webster (10):
>   firmware-imx: bump to version 5.4
>   gst1-imx: bump to version 0.12.1
>   imx-vpu: bump to version 5.4.33
>   imx-codec: rename from libfslcodec and bump version to 4.0.9
>   imx-parser: rename from libfslparser and bump version to 4.0.9
>   imx-vpuwrap: rename from libfslvpuwrap and bump version to 1.0.65
>   imx-gpu-viv: bump version to 5.0.11-p8.3
>   libimxvpuapi: bump version to 0.10.2
>   imx-lib: bump version to 5.4
>   xdriver_xf86-video-imx-viv: bump version to 5.0.11-p8.3

I will comment on each individual patch above but I have a couple of questions:
- Why isn't there the kernel-module-imx-gpu-viv update? It is very
important to keep it in line with imx-gpu-viv.
- What about imx-kobs?
- Can you share your testing setup (platform name + defconfig)?

Regards,
Gary
