From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 18:27:22 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: select EXPAT for freedreno
In-Reply-To: <20210116175544.27d53874@gmx.net>
References: <20210116160948.1364227-1-festevam@gmail.com>
 <20210116175544.27d53874@gmx.net>
Message-ID: <20210116172722.GP2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-01-16 17:55 +0100, Peter Seiderer spake thusly:
> On Sat, 16 Jan 2021 13:09:48 -0300, Fabio Estevam <festevam@gmail.com> wrote:
> > Select expat when building the freedreno driver to fix the
> > following error:
> >
> > Run-time dependency expat found: NO (tried pkgconfig and cmake)
> > Looking for a fallback subproject for the dependency expat
> > Downloading expat source from https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2
> > <urlopen error unknown url type: https>
> > A fallback URL could be specified using source_fallback_url key in the wrap file
> >
> > output/build/mesa3d-20.3.2/meson.build:1366:2: ERROR: could not get https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2 is the internet available?
> >
> 
> Not 100 percent sure (and did not yet test it), but I believe this not the
> right fix...., suspect the need for expat was introduced in the mesa meson
> build with mesa commit 81a0f1eca24b8605b9f2506122ff90db7129c39e ([1]):

Yes, we've been discussing this on IRC with Titouan...

> Leading to an mandatory expat dependency in case 'not android'..., just not
> matching the commit description..., the right required line would be:
> 
> 	required: with_any_broadcom or with_any_intel)

This is the patch I am currently testing and was about to submit
upstream in a few minutes... Nice that someone else thinks it would be a
could fix. ;-)

> Not your fault, but maybe worth to check it out (or ask upstream)?

I'm taking care of that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
