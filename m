From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Mon, 07 Jul 2014 17:07:54 +0200
Subject: [Buildroot] [PATCH 0/14 v3] freescale: update userspace
 packages (branch yem/fsl-imx)
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <53BAB7CA.9000603@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary, Yann,

On Mon, 30 Jun 2014 23:52:10 +0200, Yann E. Morin wrote:
> This series updates the Freescale userland components to the latest
> available (stable) versions:
> 
>  1     : bump the global freescale version
>  2..5  : adapt packages to the new version
>  6..9  : bump packages which version does not follow the global version
>  10    : tentative patch to re-use the generic i.MX platform in
>          gst-fsl-plugins
>  11..14: bump a few iMX defconfigs
> 
> Although I did some changes to Gary's initial submission, I only did
> mostly cosmetic changes, so the following should still apply:
> 
>     ---8<---
>     Same as last time, testing has been done on a Nitrogen6x using the
>     kernel patch committed previously.
> 
>     GPU test (gpu-viv-bin-mx6q):
>     # cd /usr/share/examples/viv_samples/vdk/
>     # ./tutorial7
> 
>     VPU test (libfslvpuwrap, libfslcodec, gst-fsl-plugins, imx-vpu):
>     # VSALPHA=1 gst-launch-0.10 filesrc location=trailer_1080p_h264_mp3.avi \
>                                 ! avidemux ! vpudec ! mfw_isink
>     ---8<---

Gary, did you have time to test this series? When I tested your previous
series I was able to run some tutorialX demo programs, but they was
quite weird and ugly (black and white with strips), and now I can't run
anything with this series.
I didn't test the VPU for now.

If it works for you, could you provide a defconfig so that I can look
what I'm missing?

Thanks,

Hadrien
