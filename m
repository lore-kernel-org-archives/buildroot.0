From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 18 May 2016 11:33:14 -0500
Subject: [Buildroot] [PATCH 1/1] package/igmpproxy: fix musl build
In-Reply-To: <20160517223147.40e5fcb8@free-electrons.com>
References: <1463348471-30704-1-git-send-email-matt@thewebers.ws>
 <20160517223147.40e5fcb8@free-electrons.com>
Message-ID: <CANQCQpYawdhZvJ7pAUEKrVUPgp7x5u-jMP9jE8DV=oe5h1_ocQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On May 17, 2016 3:32 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Sun, 15 May 2016 16:41:11 -0500, Matt Weber wrote:
>
> > diff --git
a/package/igmpproxy/0002-Use-standard-unsigned-integer-types.patch
b/package/igmpproxy/0002-Use-standard-unsigned-integer-types.patch
> > new file mode 100644
> > index 0000000..200bf23
> > --- /dev/null
> > +++ b/package/igmpproxy/0002-Use-standard-unsigned-integer-types.patch
> > @@ -0,0 +1,213 @@
> > +Fix musl build
> > +
> > +Downloaded from:
> > +
https://github.com/alpinelinux/aports/blob/master/main/igmpproxy/0001-Use-standard-unsigned-integer-types.patch
> > +
> > +Patch was reported upstream:
> > +http://sourceforge.net/p/igmpproxy/bugs/22/
> > +
> > +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>
> This should be below the commit log of the original patch, and the "Fix
> musl build" is not good. We don't care about "Fixing the musl build",
> we want to make the source code better, which has the consequence of
> fixing the musl build. So the original patch title "Use standard
> unsigned integer types" is good.

Noted.

>
> > +From ed3dff27f360239910310be6706fd54572398992 Mon Sep 17 00:00:00 2001
> > +From: Natanael Copa <ncopa@alpinelinux.org>
> > +Date: Mon, 3 Mar 2014 12:11:26 +0000
> > +Subject: [PATCH] Use standard unsigned integer types
> > +
> > +Use the stanard unsigned integer types instead of the non-standard
> > +u_char, u_short and u_int.
> > +
> > +This fixes build with musl libc.
> > +
> > +(cherry picked from commit b914bcf882c6189be7a0ce6fceb34422372c3606)
>
> From where is this commit b914bcf882c6189be7a0ce6fceb34422372c3606
> coming? Upstream seems to be https://github.com/pali/igmpproxy, and I
> don't see any commit identified as
> b914bcf882c6189be7a0ce6fceb34422372c3606.

Sorry, bad assumption on my part about the original patch's origin being
good.  I'll open an upstream issue and work  on getting it merged or at
minimum something we can reference correctly.

Thanks
-Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160518/c631dbe5/attachment.html>
