From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 7 Jul 2014 10:11:28 -0700
Subject: [Buildroot] [PATCH 0/14 v3] freescale: update userspace
	packages (branch yem/fsl-imx)
In-Reply-To: <53BAB7CA.9000603@gmail.com>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
 <53BAB7CA.9000603@gmail.com>
Message-ID: <CADCpmyOEGFGsuExD4mskncbqRJBxDoHy6CbqtyZ0TRjEKGqjNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hadrien,

On Mon, Jul 7, 2014 at 8:07 AM, Hadrien Boutteville <
hadrien.boutteville@gmail.com> wrote:

> Hello Gary, Yann,
>
> On Mon, 30 Jun 2014 23:52:10 +0200, Yann E. Morin wrote:
> > This series updates the Freescale userland components to the latest
> > available (stable) versions:
> >
> >  1     : bump the global freescale version
> >  2..5  : adapt packages to the new version
> >  6..9  : bump packages which version does not follow the global version
> >  10    : tentative patch to re-use the generic i.MX platform in
> >          gst-fsl-plugins
> >  11..14: bump a few iMX defconfigs
> >
> > Although I did some changes to Gary's initial submission, I only did
> > mostly cosmetic changes, so the following should still apply:
> >
> >     ---8<---
> >     Same as last time, testing has been done on a Nitrogen6x using the
> >     kernel patch committed previously.
> >
> >     GPU test (gpu-viv-bin-mx6q):
> >     # cd /usr/share/examples/viv_samples/vdk/
> >     # ./tutorial7
> >
> >     VPU test (libfslvpuwrap, libfslcodec, gst-fsl-plugins, imx-vpu):
> >     # VSALPHA=1 gst-launch-0.10 filesrc
> location=trailer_1080p_h264_mp3.avi \
> >                                 ! avidemux ! vpudec ! mfw_isink
> >     ---8<---
>
> Gary, did you have time to test this series? When I tested your previous
> series I was able to run some tutorialX demo programs, but they was
> quite weird and ugly (black and white with strips), and now I can't run
> anything with this series.
> I didn't test the VPU for now.
>
> If it works for you, could you provide a defconfig so that I can look
> what I'm missing?
>

The latest series I've tested is my PATCHv2 one, I will do it on Yann's
asap but in the meantime here is the defconfig I was using.
When you say it is not working, could you tell me more (nothing on the
screen, seg fault etc..)?
Do you see the FPS average on the serial output? (at least tutorial7 is
printing that info)
Could you send your dmesg?
What platform are you using?
What kind of display?

Thanks,
Gary


> Thanks,
>
> Hadrien
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140707/8dd0608c/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mx6_nitrogen_test_defconfig
Type: application/octet-stream
Size: 94552 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140707/8dd0608c/attachment.obj>
