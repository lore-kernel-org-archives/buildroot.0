From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:20:33 +0200
Subject: [Buildroot] [PATCH v2 06/14] firmware-imx: bump to version 5.4
In-Reply-To: <f4fd172e147d310d140c323f77083d5a35c04f54.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <f4fd172e147d310d140c323f77083d5a35c04f54.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-yvJH28CuzWFU7o-UHXH+VOz1RwS1vN=AKn3hfj+wBj0rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:11 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> - Upgrade to FW v3.1.1_r46072
> - v3.1.1_r46070 plus 2 patches 391/392
> - FSLARIK-391 [Decoder/H.264] VPU is always busy when decoding an
> erroneous H264 bitstream
> - FSLARIK-392 [Decoder/VC1] VPU outputs only 1 picture
> - Change to the format of Linux coda driver firmware
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/dbb8773
>
> Implicitly tested through gstreamer as the plugin relies on it:
>  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>    matroskademux ! imxvpudec ! imxipuvideosink
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Note that I've tested the VPU firmware on a 3.14.52 kernel just fine.
The reason is that this firmware is actually loaded by the user space
imx-vpu component, so as long as firmware-imx and imx-vpu are aligned,
the endianness of the fw file doesn't matter.

Regards,
Gary
