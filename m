From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2016 18:06:13 +0100
Subject: [Buildroot] [git commit] package/cups: Un-deprecate,
 and update CUPS to 2.1.2
In-Reply-To: <20160123162456.GB3363@free.fr>
References: <20160121223830.DD957803E9@busybox.osuosl.org>
 <20160123162456.GB3363@free.fr>
Message-ID: <20160123170613.GC3363@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Olivier, Thomas, All,

On 2016-01-23 17:24 +0100, Yann E. MORIN spake thusly:
> On 2016-01-21 23:37 +0100, Thomas Petazzoni spake thusly:
> > commit: http://git.buildroot.net/buildroot/commit/?id=d37ce8e1a4edc9a06831e6b0842996866534b1ea
> > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> > 
> >  - Remove 0001-fix-static.patch - Fixed upstream
> >  - Remove 0002-fix-stack-protector-check.patch - Fixed upstream
> >  - Remove 0003-mantohtml.patch - Replaced by
> >    0001-Remove-man-from-BUILDDIRS-in- configure.patch
> >  - Add 0002-Do-not-use-genstrings.patch
> >  - Add CUPS_PDFTOPS option to Config.in.legacy - This support was
> >    moved to the cups-filters package.
> 
> This is causing circular dependencies in make:
> 
>     make[1]: Circular cups-all-source <- avahi-all-source dependency dropped.

I managed to get the reason for that. Here's what we have:

    cups depends on avahi depends on libgtk3 depends on cups

So, we must cut the dependency chain somewhere. Ideas?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
