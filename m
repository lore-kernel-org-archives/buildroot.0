From: lpdev at cordier.org <lpdev@cordier.org>
Date: Mon,  4 Feb 2019 10:30:54 +0100 (CET)
Subject: [Buildroot] [PATCH v2 4/6] ffmpeg: bump to version 4.1.
 ffserver is not supported anymore.
In-Reply-To: <20190202155400.6547fba9@windsurf>
Message-ID: <ea-mime-5c58064e-3d38-4e513c2d@www-5.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




> De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ? : Louis-Paul Cordier <lpdev@cordier.org>
> Sujet : Re: [Buildroot] [PATCH v2 4/6] ffmpeg: bump to version 4.1. ffserver is not supported anymore.
> Date : 02/02/2019 15:54:00 Europe/Paris
> Copie ? : buildroot at buildroot.org;
>    Bernd Kuhls <bernd.kuhls@t-online.de>;
>    MahyarKoshkouei <mahyar.koshkouei@gmail.com>
>
> Hello,
>
> The commit title should be just:
>
> package/ffmpeg: bump to version 4.1
>
> The fact that ffserver is removed should be part of the commit log.
>

Will be added.

> On Thu, 31 Jan 2019 13:15:24 +0100
> Louis-Paul Cordier <lpdev@cordier.org> wrote:
>
> > Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
>
> I'd like to hear from Bernd about this ffmpeg bump. If I remember well,
> major ffmpeg bumps are typically breaking some APIs, causing build
> issues with packages that use ffmpeg.
>

According to my experience with FFMpeg, API are marked as deprecated. They can still be used and linked correctly against all application. However, the behaviour of the program can differ. What about creating a ffmpeg4 package, just like opencv2/3 packages?

> Have you verified that other Buildroot packages that use ffmpeg do not
> break after this ffmpeg version bump ?
>
> > package/ffmpeg/0001-ffmpeg-pthreads.patch | 34 -----------------------
>
> Would be good to mention in the sommit log why this patch is removed
> (accepted upstream ? no longer relevant ?)
>

The patch did not apply to ffmpeg4. To be honest, I did not investigate this. Thank you for pointing this out I will rework this.

>
> > -config BR2_PACKAGE_FFMPEG_FFSERVER
> > - bool "Build ffserver"
> > - depends on BR2_USE_MMU # fork()
> > - help
> > - FFserver is a streaming server for both audio and video.
>
> If ffserver is no longer supported, we want to move this option to
> Config.in.legacy so that users who have configurations with this
> enabled are aware.
>

This does not appear in the official documentation. Would it be possible to add it?

> Thanks!
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
