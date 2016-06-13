From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:20:46 +0200
Subject: [Buildroot] [PATCH v2 07/14] gst1-imx: bump to version 0.12.1
In-Reply-To: <5f3b9b87a008e8341a180e1c90f081453099769f.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <5f3b9b87a008e8341a180e1c90f081453099769f.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-ysGyWSF3XB3qL+BNVoE+JJZOd_SVQ7nNxiaF4Ok+yTfzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:12 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> * compositor: Rename ImxCompositor(Pad) to ImxVideoCompositor(Pad)
>   This prevents conflicts if both the NXP plugins and the gstreamer-imx
>   are installed in the same rootfs
>
> * Add switches to wscript configuration to enable/disable plugins
>   Until now, all plugins were built (unless their dependencies were
>   missing). On some i.MX machines, some features are missing. For
>   example, the i.MX7 has no VPU. To ensure deterministic builds, it is
>   useful to selectively disable plugins in the build.
>
> * ipu+pxp: : Fix deadlocks and incorrect logging in case of init error
>   This was causing a freeze if for example one tries to use PxP elements
>   on an i.MX6 Dual/Quad
>
> * imxv4l2videosrc fixes and enhancements:
>   * fixes to interlacing support (incl. workarounds for analog TV input)
>   * remove format restriction in get_caps function
>     this removes the limitation on I420 formats
>   * simplified determination of fps (necessary due to driver limitations)
>
> * eglvivsink: wayland: Do not commit before buffers are swapped
>   This fixes eglSwapBuffer swaps with damaged frames
>
> * Documentation additions
>   Adds GPU memory leak notess to the FAQ
>
> * vpu: encoder: Expose motion estimation range as property
>
> * vpu: decoder: Drop output frame if its buffer cannot be allocated
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/cec4c47
>
> Tested with the following commands on i.MX6Q (IPU):
>  # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
>  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>    matroskademux ! imxvpudec ! imxipuvideosink
>  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>    matroskademux ! imxvpudec ! imxeglvivsink
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Once merged, I'll make a follow-up patch that allows to disable
components you don't want.

Regards,
Gary
