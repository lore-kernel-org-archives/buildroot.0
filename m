From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2018 11:36:16 +0100
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <CADvTj4rm-vFFrMEescWYqnr4+U333R5fopVV6+aEHLCZd_EGXw@mail.gmail.com>
References: <20181227104029.GP14286@scaer>
 <CADvTj4rdOXyUF-WN+ZATt6v1L9QH7pEA2iQhP7YtfHdQRG3AjA@mail.gmail.com>
 <20181227105731.GR14286@scaer>
 <CADvTj4rcDC0hkZZ8Zfjw6Tv26PROUc7AOiuPXn6paBJjxt8szw@mail.gmail.com>
 <20181229093522.GX14286@scaer>
 <CADvTj4ri-LUvySkGaHbstAuOZ+Ez8qhOU8cExZVu3_2f7yw-bQ@mail.gmail.com>
 <20181229113847.GZ14286@scaer>
 <CADvTj4qrsN+8o7+9Qwi_h0-9XBu0BJZDQHZWNcw6tUFaTbQCtg@mail.gmail.com>
 <20181231101643.GE24224@scaer>
 <CADvTj4rm-vFFrMEescWYqnr4+U333R5fopVV6+aEHLCZd_EGXw@mail.gmail.com>
Message-ID: <20181231103616.GF24224@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-31 04:24 -0600, James Hilliard spake thusly:
> On Mon, Dec 31, 2018 at 4:16 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-12-30 02:44 -0600, James Hilliard spake thusly:
> > > On Sat, Dec 29, 2018 at 5:38 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > [--SNIP--]
> > > > Until now, only minor patching was needed (a header and two libs checks)
> > > > that were trivial to patchout. But this new gperf check is less trivial
> > > > to patch-out in a way that is maintainable long-term.
> > > What do you think of this strategy using meson's disabler feature?
> > > https://github.com/systemd/systemd/pull/11294
> >
> > To be honest, I don't really care how it's done, sorry... It just has to
> > be a solution that pleases upstream.
> >
> > I just got into the original thread to help sort out a solution in
> > Buildroot, should that were possible, but it turns out that it is not
> > really workable easily without upstream support.
> It's not super difficult to create a patch for our usage in buildroot
> in order to allow building systemd-boot by itself at least, the diff
> will just be a bit on the large side for the moment until upstream is
> refactored since I need to strip out most of the configure checks,
> does that sound ok?

No, that's not nice, as I already said (and as Peter said on IRC just
moments ago), because we'll have to maintain that patch over time:
there is no way to know when upstream will be ready, so we can drop
that patch. It may happen that upstream turns out to not be interested
at all in fact.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
