From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 1 Dec 2015 19:14:37 -0200
Subject: [Buildroot] [PATCH] musl: add a sys/queue.h implementation
In-Reply-To: <20151201120054.7fb61926@free-electrons.com>
References: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
 <20151201112916.57ef96b3@free-electrons.com>
 <CANu7NGv0XVv-7H_p3R=QM477bNmZCZEMUrPU-VKWk0afmQ93Ww@mail.gmail.com>
 <20151201120054.7fb61926@free-electrons.com>
Message-ID: <CANu7NGv1fWBmphWPkHEoKfg7xN1D=+4y2dtSr6eE2DnNd0sNcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-12-01 9:00 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Sergio,
>
> On Tue, 1 Dec 2015 08:44:59 -0200, Sergio Prado wrote:
>
> > > Rather than bundling the queue.h file, can we download it from some
> > > location ? For example, you could use
> > > http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.30.
> >
> > One of my first questions was if we should keep queue.h inside Buildroot
> or
> > download it from somewhere. And you say we could keep it inside
> Buildroot,
>
> Hum, are you sure your question was whether we should download it or
> keep it inside Buildroot? I think your question was more "is it
> possible to keep it inside Buildroot?", to which I answered yes,
> indeed :-)
>
> But anyway, doesn't really matter. I personally believe it's better to
> download stuff when we can rather than bundling it. Hopefully others
> will agree with me.
>

OK. I'll do it.


>
>
> > > Do we really need this package to have a prompt? I think it could
> > > remain a hidden package, no?
> >
> > Since it is not included in the package/Config.in, it is still hidden,
> > right? At least I can't find it when searching inside menuconfig. I
> created
> > this file just as a matter of documentation, but I can remove if it is
> not
> > necessary.
>
> A Config.in that is not included anywhere is not useful at all, so it
> shouldn't exist.
>

Right.


>
> > > > +# source included in buildroot
> > > > +SYS_QUEUE_SOURCE =
> > > > +SYS_QUEUE_VERSION = 1.70
> > >
> > > Where is this version coming from ?
> >
> > From the source code.
> > http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70
>
> Alright, so it can be used in <pkg>_SOURCE. You will have to overwrite
> the EXTRACT_CMDS however, because it's not a tarball. See jquery.mk for
> example.
>

OK, thanks.


>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151201/e2357a96/attachment.html>
