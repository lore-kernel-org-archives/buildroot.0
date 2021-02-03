From: Federico Pellegrin <fede@evolware.org>
Date: Wed, 3 Feb 2021 11:15:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/kexec: fix build on pre 4.4
 kernels
In-Reply-To: <20210131232413.15c9ae9a@windsurf.home>
References: <20210129050312.12247-1-fede@evolware.org>
 <20210131232413.15c9ae9a@windsurf.home>
Message-ID: <CAM6O0ZhoTAtjiFm1NhwWiUkfXnO=m0v0gVTb1=2C-Q3hwcnG8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
I apologize for the very bad patch I sent last time, very sorry I
missed a level of patch indirection :-)

I've just resubmitted a few moments ago, I hope it is fine this time.

As for upstream: I contacted them on the kexec mailing list
(describing the problem, proposing informally the solution and asking
if a patch would be welcome) but got no response as of now. I will
wait a bit more and ping in case. I'm not really sure if they are
interested to support very old kernels (which may be somehow also true
for Buildroot, but I guess given that Buildroot proposes as of now
also that versions in the configuration stage, we should try to keep
all the tooling working with them as well)

Many thanks!
Federico


Il giorno dom 31 gen 2021 alle ore 23:24 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> ha scritto:
>
> Hello Federico,
>
> On Fri, 29 Jan 2021 06:03:12 +0100
> Federico Pellegrin <fede@evolware.org> wrote:
>
> > kexec build will fail on older kernels (pre 4.4) as the define VIDEO_CAPABILITY_64BIT_BASE was not present at that time.
> >
> > This patch adds it, as per linux/include/uapi/linux/screen_info.h, if not present.
> >
> > Signed-off-by: Federico Pellegrin <fede@evolware.org>
>
> Thanks a lot for your contribution! However, we need all patches added
> to packages to have a proper commit log and Signed-off-by line, and be
> generated using git format-patch. Could you adjust your patch
> accordingly ?
>
> Also, did you submit this change to upstream kexec ?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
