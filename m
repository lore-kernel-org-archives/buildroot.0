From: Pawel Sikora <sikor6@gmail.com>
Date: Tue, 28 Mar 2017 19:56:42 +0200
Subject: [Buildroot] [git commit] xenomai: bump version to 3.0.3
In-Reply-To: <20170326230252.GM22954@waldemar-brodkorb.de>
References: <20170325181551.035B88226E@busybox.osuosl.org>
 <20170326123433.GL22954@waldemar-brodkorb.de>
 <20170326213845.279e722b@free-electrons.com>
 <20170326230252.GM22954@waldemar-brodkorb.de>
Message-ID: <CAKfV1CaGiFXJupriJLgS=NdeMOwmSEbt9ZQ2a+zWDk+U6OrbOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


Hi,
> Thomas Petazzoni wrote,
>
> > Hello,
> >
> > On Sun, 26 Mar 2017 14:34:33 +0200, Waldemar Brodkorb wrote:
> >
> > > is this well tested?
> > > Simple uClibc-ng for ARM breaks with:
> > > obstack.c:103:24: fatal error: exitfail.h: No such file or directory
> >
> > I did do a build test (since I added a patch to make things build
> > properly), but I don't remember if it was a glibc or uClibc build.
> > Apparently, it was a glibc build.
> >
> > > I am not an Xenomai expert, just started experimenting with it, but
> > > I see no option to switch between "cobalt" and "mercury" mode.
> >
> > $ ./configure --help
> > [...]
> >   --with-core=<cobalt | mercury>
> >                           build for dual kernel or single image
> >
>
> I mean a switch inside buildroot. But I have seen your comment now,
> that it might be added later.
>
>

I am thinking right now about some good solution about configs regarding
choosing
Xenomai core. I will present a patch when it is ready and invite you for
the discussion ;-)

Regarding failing build with uClibc-ng on ARM I am not completely sure how
big will
be the effort to make it working... (it seems to be a case of _LIBC
definition inside
Xenomai package in lib/boilerplate/obstack.c:)

...
 # include <stdlib.h>
 # ifdef _LIBC
 int obstack_exit_failure = EXIT_FAILURE;
 # else
 #  include "exitfail.h"
 #  define obstack_exit_failure exit_failure
 # endif
...

but I will try to find if there is something more )

 I will try to look at it. Just don't know when - because of the studies,
but I will ;-)

Kind Regards,
Pawel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170328/177a29a5/attachment.html>
