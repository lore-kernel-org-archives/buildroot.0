From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 24 Jan 2016 08:23:57 +0200
Subject: [Buildroot] [git commit] package/cups: Un-deprecate,
 and update CUPS to 2.1.2
In-Reply-To: <20160123170613.GC3363@free.fr>
References: <20160121223830.DD957803E9@busybox.osuosl.org>
 <20160123162456.GB3363@free.fr> <20160123170613.GC3363@free.fr>
Message-ID: <CALdGskJ2qCvYG7zGBjesroKzofo=n-c1xCHHn+D2HroxzsZb6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, All,

That's a tough one.  I don't see an easy way to break the dependency
without building one of the dependant packages twice.

To me it seems like we would have to decide on which functionality is least
important at this stage.  Disabling Avahi LibGTK support when building Cups
with Avahi and LibGTK, or disabling Cups Avahi support when building Cups
with Avahi and LibGTK, or disabling LibGTK Cups support. (Unfortunately
those are the easy fixes that lose some functionality)

I'm open to suggestions.

Regards
Olivier



On 23 January 2016 at 19:06, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Olivier, Thomas, All,
>
> On 2016-01-23 17:24 +0100, Yann E. MORIN spake thusly:
> > On 2016-01-21 23:37 +0100, Thomas Petazzoni spake thusly:
> > > commit:
> http://git.buildroot.net/buildroot/commit/?id=d37ce8e1a4edc9a06831e6b0842996866534b1ea
> > > branch:
> http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> > >
> > >  - Remove 0001-fix-static.patch - Fixed upstream
> > >  - Remove 0002-fix-stack-protector-check.patch - Fixed upstream
> > >  - Remove 0003-mantohtml.patch - Replaced by
> > >    0001-Remove-man-from-BUILDDIRS-in- configure.patch
> > >  - Add 0002-Do-not-use-genstrings.patch
> > >  - Add CUPS_PDFTOPS option to Config.in.legacy - This support was
> > >    moved to the cups-filters package.
> >
> > This is causing circular dependencies in make:
> >
> >     make[1]: Circular cups-all-source <- avahi-all-source dependency
> dropped.
>
> I managed to get the reason for that. Here's what we have:
>
>     cups depends on avahi depends on libgtk3 depends on cups
>
> So, we must cut the dependency chain somewhere. Ideas?
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160124/790796af/attachment-0001.html>
