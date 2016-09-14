From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Sep 2016 20:38:16 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <20160914183205.GB5531@free.fr>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LUrhOVJJG-1_pf4vzKMh1=7WG0xop9XY6m9fva-FepHzA@mail.gmail.com>
 <20160914110143.2f25e8a9@free-electrons.com>
 <CAAXf6LX0FwkjE8xHqjwn1TOS7cOdbVwjBRLOS7tLnKJcgBtDuQ@mail.gmail.com>
 <20160914183205.GB5531@free.fr>
Message-ID: <20160914183816.GC5531@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2016-09-14 20:32 +0200, Yann E. MORIN spake thusly:
> On 2016-09-14 19:42 +0200, Thomas De Schampheleire spake thusly:
> > On Wed, Sep 14, 2016 at 11:01 AM, Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com> wrote:
> > > Well, the question is not so much about "reconfigure", but about
> > > the configure step itself. Why isn't the configure step done inside
> > > <pkg>_CONFIGURE_CMDS ? If it had been done inside the
> > > <pkg>_CONFIGURE_CMDS, then those "hacks" to make reconfigure work
> > > would not be needed.
> > >
> > > I'm pretty sure that there's a solid reason for not doing the .config
> > > preparation inside <pkg>_CONFIGURE_CMDS, but it'd be great to remember
> > > why and document it somewhere :)
> > 
> > I think the answer to this question is simple: one of the goals was to allow:
> > 
> > 'make clean linux-menuconfig'
> > 
> > without this step first building all dependencies of linux (which is
> > quite a lot).
> > If the kconfig configuration would be part of CONFIGURE_CMDS, then
> > we'd end up in that situation.
> 
> Yes, that was the basis for our thinking at the time.
> 
> Yet, maybe we could just move the call to the $(2)_REGEN_DOT_CONFIG

I meant: $(2)_FIXUP_DOT_CONFIG

> macro into the CONFIGURE_CMDS (or in a pre-configure hook).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
