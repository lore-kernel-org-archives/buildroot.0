From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 20:03:31 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-20
In-Reply-To: <20140421175641.GB23980@ned>
References: <20140421063009.036D5100FF4@stock.ovh.net>
 <20140421114949.59c65c31@skate> <20140421142444.GC3359@free.fr>
 <20140421170338.GA23980@ned> <20140421171703.GF3359@free.fr>
 <20140421175641.GB23980@ned>
Message-ID: <20140421180331.GI3359@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-04-21 19:56 +0200, Eric Le Bihan spake thusly:
> On Mon, Apr 21, 2014 at 07:17:03PM +0200, Yann E. MORIN wrote:
> > Eric, All,
> >
> > On 2014-04-21 19:03 +0200, Eric Le Bihan spake thusly:
> > > On Mon, Apr 21, 2014 at 04:24:44PM +0200, Yann E. MORIN wrote:
> > > > Thomas, All,
> > > >
> > > > On 2014-04-21 11:49 +0200, Thomas Petazzoni spake thusly:
> > > > > >        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2cb13a5bb92dabed219d49f49f0b9a2dfe65a0ca/
> > > > >
> > > > > cairo-gl-private.h:287:5: error: unknown type name 'GLchar'
> > > > >
> > > > > Could some OpenGL person look into this? Paul ? Yann ?
> > > >
> > > > With only a cursory look and a bit of Google-fuu, it looks like we need
> > > > a full OpenGL provider in this case.
> > >
> > > In fact, looking at src/cairo-gl-private.h, we can see that GLchar is used in
> > > functions related to shader loading. But the gl2.h file from sunxi-mali
> > > defines prototypes using "char" where the official header from the Khronos
> > > Group uses "GLchar". The gl2.h from Raspberry userland uses GLchar.
> > >
> > > So the issue is with Sunxi Mali and has been fixed upstream:
> > > https://github.com/linux-sunxi/sunxi-mali/commit/b36c94609c3a335c5bbe2019a8e8a1b261786b30
> >
> > Nice! Care to send a patch bumping sunxi-mali?
> 
> Too bad, the pull request fixing the issue has not been merged yet! So I'll
> only post a small patch for sunxi-mali header files, as the pull request also
> covers the *.pc files issue, which has not been acked by upstream yet.

Ah, OK. I'll have a look at your patch shortly. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
