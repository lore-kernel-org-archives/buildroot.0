From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:20:53 +0200
Subject: [Buildroot] [PATCH v2 08/14] imx-vpu: bump to version 5.4.33
In-Reply-To: <6c346c15852f06257f0f42601439319ec247f258.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <6c346c15852f06257f0f42601439319ec247f258.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-ysH15rjVsyQ7MaaLLcDbeF5oBRFMrFGegUjZ=cAOvvjKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:12 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> VPU firmware has been changed to the format of Linux codec driver firmware.
> Change VPU library to adapt to firmware format change.
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/f5e1056
>
> Implicitly tested through gstreamer as the plugins rely on it:
>  # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
>  # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
>  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>    matroskademux ! imxvpudec ! imxipuvideosink
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Also confirm that gstreamer0.10 plugins are still working fine.

Regards,
Gary
