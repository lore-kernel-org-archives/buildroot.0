From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 20:20:17 +0200
Subject: [Buildroot] [PATCH 7/8] core/show-info: report the ordered list
 of build steps
In-Reply-To: <CAB4xu_15BFXQ3VFnrp8j5b8ivr=pGN2HN5UarW8dz-R+XRk5Dw@mail.gmail.com>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
 <20200411103950.4a21b23e@windsurf.home>
 <CAB4xu_1Bv4gsebOQrUfKM_ChD6q7-e15YTGPqwj4PBx3hzkrOA@mail.gmail.com>
 <20200411161903.7b007feb@windsurf.home>
 <CAB4xu_15BFXQ3VFnrp8j5b8ivr=pGN2HN5UarW8dz-R+XRk5Dw@mail.gmail.com>
Message-ID: <20200411182017.GQ29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2020-04-11 11:06 -0400, Philippe Proulx spake thusly:
> On Sat, Apr 11, 2020 at 10:19 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
[--SNIP--]
> If you tell me that things such build step order and stamp file names do
> not change for many years and as such can be considered as interfaces,
> I'm fine with this.

They are not an interface, definitely not (IMHO). But they are stable
enough that you can build something on them and not expect a breakage
that often.

But an interface? No, we can't commit to that.

> It's always a balance between adding the same logic to all the viewers
> and generating less data.

Since the output of show-info is for machine consumption, and is not
geared at human consuption without first being processed, I don;t see a
problem with generating "more" data.

> My tool could be part of the Buildroot project, but I doubt you'll want
> something that depends on PyQt5 in there.

Not a problem, as it is not a mandatory tool. We already have
utils/brmake that uses unbuffer, which is not available on most distros
by default.

> However, I could certainly
> contribute a Python module which offers utilities over the `show-info`
> output so as to have a versioned, object-oriented API, and then import
> it from an external tool. This way, even if `show-info` changes, the
> Python module can continue to offer the same (non-breaking) interface.

You can't guarantee that either: some keys may disapear, so such a
module could not expose them any more either, so not a stable API.

All you could provide as a stable API, is a way to rerieve basic
information, like the list of packages and such. Or a way to query
keys, which would not provide much more than what 'import json' would.

Regards,
Yann E. MORIN.

> I still think we somewhat need the `build_dir` entry though.
> 
> Phil
> 
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
