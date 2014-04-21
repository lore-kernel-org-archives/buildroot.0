From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 21 Apr 2014 19:03:38 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-20
In-Reply-To: <20140421142444.GC3359@free.fr>
References: <20140421063009.036D5100FF4@stock.ovh.net>
 <20140421114949.59c65c31@skate> <20140421142444.GC3359@free.fr>
Message-ID: <20140421170338.GA23980@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Mon, Apr 21, 2014 at 04:24:44PM +0200, Yann E. MORIN wrote:
> Thomas, All,
>
> On 2014-04-21 11:49 +0200, Thomas Petazzoni spake thusly:
> > >        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2cb13a5bb92dabed219d49f49f0b9a2dfe65a0ca/
> >
> > cairo-gl-private.h:287:5: error: unknown type name 'GLchar'
> >
> > Could some OpenGL person look into this? Paul ? Yann ?
>
> With only a cursory look and a bit of Google-fuu, it looks like we need
> a full OpenGL provider in this case.

In fact, looking at src/cairo-gl-private.h, we can see that GLchar is used in
functions related to shader loading. But the gl2.h file from sunxi-mali
defines prototypes using "char" where the official header from the Khronos
Group uses "GLchar". The gl2.h from Raspberry userland uses GLchar.

So the issue is with Sunxi Mali and has been fixed upstream:
https://github.com/linux-sunxi/sunxi-mali/commit/b36c94609c3a335c5bbe2019a8e8a1b261786b30

Best regards,
ELB
