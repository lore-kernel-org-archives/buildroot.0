From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jul 2014 01:12:57 +0200
Subject: [Buildroot] Replace libev with libuv
In-Reply-To: <CALoSW642aRZZ9koGitrGTxZ0hjpJO_9nOa5fopgkPnCrnBwM6g@mail.gmail.com>
References: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>
 <53C91D3F.4060500@zacarias.com.ar>
 <CALoSW64Uisj3oLvPVKZ1nQXgCTEnt1yLMqV+Gy7aK4U=Q9FcUA@mail.gmail.com>
 <53C9220B.9060809@zacarias.com.ar>
 <CALoSW6550gT0qvqgo2tbaz+_VKXy0mwAQxjmsjPV66-XaUC1VA@mail.gmail.com>
 <CALoSW65dFkMpRnW0h88xAh-Tq6TAnOWz9CGExo1UWzLyMjtRLA@mail.gmail.com>
 <CALoSW67tsLPqBHrX+K+fUXWz=F2+xjLpKhYHY2pdfcoOCFEv0A@mail.gmail.com>
 <20140719132007.GH3593@free.fr>
 <CALoSW642aRZZ9koGitrGTxZ0hjpJO_9nOa5fopgkPnCrnBwM6g@mail.gmail.com>
Message-ID: <20140719231257.GO3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nimai, All,

Please, do *not* top-post. Reply in-lined, like I do below...

On 2014-07-19 09:40 -0400, Nimai Mahajan spake thusly:
> Ahh yes so I did ... sorry, stupid mistake. I will use the latest
> tree. cgit web should show all the latest commits since that just
> reflects the git repo correct?

There is a configuration glitch that makes cgit not show all commits.
Compare:
    http://git.buildroot.org/buildroot
    http://git.buildroot.org/buildroot/

The former (without the ending '/') is always up-to-date, while the
latter (with the ending '/') often lags behind, by up to a few days.

> I will use that. I thought the <at> was
> some special BR syntax I'd never seen before.

Nope, that's probably your mailer trying to be too smart, and replacing
all '@' sy,mbols with '<at>' in an attempt to thwarte spammers from
harvesting email addresses.

> Thanks Yann. Hopefully I
> will be able to contribute some new packages in the future after
> learning the syntax about all the different make types.

Do not hesitate to post new packages! Reviews are here to catch problems
in the submissions, and to direct the submitter to the adequate
ressources to fix potential issues.

A good way to add a new package in Buildroot is to:
  - look at the manual: http://buildroot.net/downloads/manual/manual.html
  - look at existing packages

> Slightly off topic question but what would be your recommendation
> about taking an existing package compiled for and written for a
> regular Linux host (i.e. Mint) and integrating it into Buildroot?
> Convert the traditional Makefile into CMake? Autotools? We have a lot
> of code with traditional Makefiles that need to be integrated into an
> embedded Buildroot environment. Thanks.

Well, it all depends. Buildroot can handle a few common, generic build
systems and types of packages, as you'll see in the manual ;-) :
  - autotools,
  - cmake
  - python
  - lua
  - perl

But it also handles packages with a specific build system, such as plain
Makefiles.

So, it is not required to convert packages to include them in Buildroot.

Regards,
Yann E. MORIN.

> On Sat, Jul 19, 2014 at 9:20 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Nimai, All,
> >
> > On 2014-07-19 08:51 -0400, Nimai Mahajan spake thusly:
> >> I got it. Gustavo, took a slightly different approach but this works
> >> (idea taken from sdl.mk, which also has a broken build process):
> >>
> >> LIBUV_VERSION = v0.11.26
> >> LIBUV_SITE = $(call github,joyent,libuv,$(LIBUV_VERSION))
> >> LIBUV_DEPENDENCIES = host-pkgconf
> >> LIBUV_INSTALL_STAGING = YES
> >> LIBUV_AUTORECONF = YES
> >> LIBUV_LICENSE = BSD-2c, BSD-3c, ISC, MIT
> >> LIBUV_LICENSE_FILES = LICENSE
> >>
> >> # Tweaked autogen.sh
> >> #define LIBUV_FIXUP_AUTOGEN
> >> #    echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" >$(
> >> <at> D) m4/libuv-extra-automake-flags.m4
> >> #endef
> >
> > Oh, it looks like you really have a broken (utterly broken!) tree.
> > How did you get that  $( <at> D)  stuff? Did you by chance copy-paste
> > the patch from your mailer and applied it manualy?
> >
> > Please, try the latest Buildroot tree, it should be OK.
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
