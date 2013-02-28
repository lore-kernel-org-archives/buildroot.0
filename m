From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 28 Feb 2013 16:43:01 +0100 (CET)
Subject: [Buildroot] Help needed with cross-compiling libotr
In-Reply-To: <CAG2jQ8jiP6g7Fuhy_H3CgocC8CAMbT9ZF1sX22tsdOmyjhgsaQ@mail.gmail.com>
Message-ID: <1907015096.10640.1362066181409.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am torn on that one... the frontier between embedded and not embedded never was very clear, 
and there are lots of single-purpose computers that have a screen and a keyboard to run a single graphical app. 

I don't know the exact project here, but having a small screen displaying messages and implementing it with pidgin... 
that wouldn't have been my technical choice but why not...

my point is that there are lots of "obviously desktop" apps that are sometime used in the embedded world without pulling 
in the whole infrastructure, so in a way it makes sense to have them in buildroot.

the reason not to is unmaintained packages, but is it really a problem ? most mail we get about broken packages are fixes, 
not complaints, so I am not sure this is a problem...

    Cordialement

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> On 28 February 2013 15:21, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello all,
> >
> > On Thu, 28 Feb 2013 17:04:23 +0200, Stefan Fr?berg wrote:
> >
> >> I have been trying to cross-compile libotr package that makes it
> >> possible,
> >> with the help of pidgin-otr plugin, to send encrypted messages
> >> with
> >> Pidgin IM software
> >> (which I already have successfully cross-compiled for buildroot
> >> and plan
> >> to submit soon).
> >
> > I'd like to state my feeling on this: I believe that packaging
> > desktop-level software like Pidgin or the Network-Manager Applet in
> > Buildroot is useless. I don't think Buildroot is appropriate to
> > build a
> > full-blown desktop distro, and even though Stefan is doing good
> > work
> > with all those packages, I fear that once Stefan's work is over,
> > those
> > packages will bit rot.
> >
> > Stefan, are you sure that Buildroot is appropriate for what you're
> > trying to achieve? Have you looked at something like Gentoo? It
> > builds
> > from source like Buildroot, has a package management system, and
> > gazillions of desktop-level software already packaged. Since you're
> > targeting x86, you don't need cross-compilation, which would have
> > been
> > the reason for using Buildroot in the first place.
> >
> > And don't tell me you use Buildroot because of uClibc: when you're
> > doing a full-blown desktop environment, using glibc or uClibc
> > doesn't
> > make *any* difference, be it from a size perspective or a
> > performance
> > perspective.
> >
> > What do others think about this?
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> I tend to agree that these kind of packages might be too much for
> buildroot, but keep in mind that Gentoo comes with a rather big
> uClibc
> rootfs by default [1]
> 
> [1] http://distfiles.gentoo.org/experimental/x86/uclibc/
> 
> --
> Regards,
> Markos Chandras
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
