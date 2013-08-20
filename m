From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 20 Aug 2013 07:00:39 +0200
Subject: [Buildroot] Removing/solving gettext dependencies in libuio
In-Reply-To: <20130820002556.4d735bb3@skate>
References: <CAAXf6LWskVXQjvLYeEBx_JJxuTujMZEq2JzqLMftXXUSaPTQHg@mail.gmail.com>
 <20130820002556.4d735bb3@skate>
Message-ID: <CAAXf6LXTU-ABLkcHYJfy9fSRdgGrWr3f37Udno-vpCbqA-kY-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 20-aug.-2013 00:26 schreef "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> het volgende:
>
> Dear Thomas De Schampheleire,
>
> On Tue, 30 Jul 2013 14:28:05 +0200, Thomas De Schampheleire wrote:
>
> > A second alternative is to change libuio to recognize --disable-nls.
> > However, I'm not sure how to do that.
> > The configure.ac file contains:
> >
> >   AM_GNU_GETTEXT([external])
> >   AM_GNU_GETTEXT_VERSION([0.17])
> >
> > This macro is provided by gettext itself, so without gettext this
doesn't work.
>
> This should only require host-gettext, which provides the .m4 file that
> contains the m4 macro to autoreconf the package. Once you upstream the
> patch, at the next release an updated 'configure' script will be part
> of lsuio tarball, and we'll be able to remove the _AUTORECONF=YES and
> therefore the dependency on host-gettext.
>
> Am I missing something here?
>

Can you elaborate a bit?

With 'patch', do you mean the proposal of adding --disable-nls as I sent in
my first mail ? Come to think of it, does that even make sense? Isn't that
flag normally provided by gettext itself?

Regardless, how will upstreaming that patch remove the dependency on
gettext? Who will provide a definition for AM_GNU_GETTEXT?

(I think I now understand part of the confusion: libuio comes from git,
there are no packaged tarballs with a preboiled configure script. Hence,
autoreconf is always necessary.)

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130820/1dfb9027/attachment.html>
