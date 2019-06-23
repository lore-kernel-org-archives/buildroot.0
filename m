From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 23 Jun 2019 13:01:42 -0600
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build without
 cairo-svg
In-Reply-To: <20190623205807.02d2cd3e@windsurf>
References: <20190623185232.61138-1-james.hilliard1@gmail.com>
 <20190623205807.02d2cd3e@windsurf>
Message-ID: <CADvTj4rxHyXQ6yvtNsXF8PyO1AHc0Xwiz0jAhhP8qfcfeYYGLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 23, 2019 at 12:58 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 23 Jun 2019 12:52:32 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Fixes:
> > test-ot-color.cc:40:10: fatal error: cairo-svg.h: No such file or directory
> >    40 | #include <cairo-svg.h>
> >       |          ^~~~~~~~~~~~~
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Hum, we fixed the same build issue with:
>
>   https://git.buildroot.org/buildroot/commit/?id=ced273e4f1a0048319441a01be367c0bb65f6a2d
>
> But probably your change is better, if the SVG dependency is in fact
> not really needed ?
yeah, it shouldn't be needed
>
> Fabrice, could you look at James patch and tell what you think ?
>
> James: such patches should contain a reference to the autobuilder
> failure it's fixing, like this:
ah, I had only caught this in my local build
>
> Fixes:
>
>   http://autobuild.buildroot.org/results/.../
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
