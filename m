From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Thu, 15 Apr 2021 22:00:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] Fix -latomic for CMake packages
In-Reply-To: <8f6e2b20-c101-effa-9584-e9bd6a697721@mind.be>
References: <20210413060942.2530596-1-glex.spb@gmail.com>
 <20210413062615.2808309-1-glex.spb@gmail.com>
 <20210414194920.318e938d@gmx.net>
 <CADjhFRDs7oHBoAhbr96z9oHSEcfQnejec8LCE+_haOs5cwjXow@mail.gmail.com>
 <20210415214448.669b3826@gmx.net>
 <8f6e2b20-c101-effa-9584-e9bd6a697721@mind.be>
Message-ID: <CADjhFRC87F8i4_7JfwRFb9pkH8E3buWXF4wO+-D6n=Koo2Df8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My host cmake is 3.20.0 from Ubuntu 20.10
It must be some environment / host cmake difference but I can't pinpoint it
either, thus my vague commit message

If I run this in a Docker container with an older Ubuntu I can't reproduce
it either

On Thu, Apr 15, 2021 at 9:46 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 15/04/2021 21:44, Peter Seiderer wrote:
> > Hello Gleb,
> >
> > On Thu, 15 Apr 2021 04:49:29 +0100, Gleb Mazovetskiy <glex.spb@gmail.com>
> wrote:
> >
> >> Hi Peter,
> >>
> >> The failing defconfig is here (it's specific to this buildroot):
> >>
> https://github.com/batocera-linux/batocera.linux/blob/8d8038a6ddaae03f0150fd28a2d23c371156ebf2/configs/batocera-odroidgoa_defconfig
> >
> > Thanks for providing the defconfig, as far as I can see nothing special
> (and no
> > poppler enabled?), normal buildroot-glibc-gcc-10.x toolchain..., and I
> am not
> > able to reproduce your problem (did only test without ccache)...
>
>  CMake is known to do weird things with -isystem, and this can change over
> cmake
> versions, and we use the host cmake if sufficiently recent. So that could
> make a
> difference.
>
>  Regards,
>  Arnout
>
> [snip]
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210415/b426bc77/attachment.html>
