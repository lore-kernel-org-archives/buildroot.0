From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 2 Apr 2020 02:27:25 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.28.0
In-Reply-To: <CADvTj4pkDTrCRAPd0Uk0EirN4T47XLTij+XVe==s9r3wt0GpOw@mail.gmail.com>
References: <20200324215809.77787-1-james.hilliard1@gmail.com>
 <20200329221302.4d9a1022@windsurf.home>
 <CADvTj4pkDTrCRAPd0Uk0EirN4T47XLTij+XVe==s9r3wt0GpOw@mail.gmail.com>
Message-ID: <20200402022725.GB702622@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Mar 2020 22:27:15 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
> On Sun, Mar 29, 2020 at 2:13 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Tue, 24 Mar 2020 15:58:09 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > Adjust fix build with musl patch for 2.28.0.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  package/wpewebkit/0001-Fix-build-with-musl.patch | 6 +++---
> > >  package/wpewebkit/wpewebkit.hash                 | 8 ++++----
> > >  package/wpewebkit/wpewebkit.mk                   | 2 +-
> > >  3 files changed, 8 insertions(+), 8 deletions(-)
> >
> > Applied to master, thanks. Why isn't the musl patch upstream ? :-)
>
> Not sure, maybe Adrian might know?

Nobody has attempted to send the patch upstream. Maybe I can do it myself :]
Note to self: The OpenBSD people are applying some patches which would be
neat having upstream as well.

Note that in WebKit trunk we have now a fix [1] which will explicitly set the
thread stack sizes using ?pthread_attr_setstacksize()?, which should further
help with Musl (and possibly uClibc) ? I have tried at backporting it over to
the 2.28 release branch but it's not trivial and it will need another attempt
at some point, or waiting until 2.30.x for it ;-)

Cheers,
?Adri?n

---
[1] https://bugs.webkit.org/show_bug.cgi?id=208223
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200402/5f924e59/attachment.asc>
