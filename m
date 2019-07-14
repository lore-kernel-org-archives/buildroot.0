From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 11:39:16 +0200
Subject: [Buildroot] [PATCH v4 15/15] package/gcc: enable gcc 9.1 for
 ork1 (openrisc)
In-Reply-To: <CAJF2gTSD9ANSQs7S3nSnboZm7P012mzO1EfuE-P4Z5xFusvSYw@mail.gmail.com>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-16-giulio.benetti@micronovasrl.com>
 <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
 <CAJF2gTQ85czGP5BAMgn5kwbJKGTmxwAakkZGmUomquTugSwMcg@mail.gmail.com>
 <20190714084056.GI2680@scaer>
 <CAJF2gTSD9ANSQs7S3nSnboZm7P012mzO1EfuE-P4Z5xFusvSYw@mail.gmail.com>
Message-ID: <20190714093916.GK2680@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guo, All,

Peter, Thomas, Arnout, question below...

On 2019-07-14 17:18 +0800, Guo Ren spake thusly:
> On Sun, Jul 14, 2019 at 4:41 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2019-07-14 07:57 +0800, Guo Ren spake thusly:
> > > On Sun, Jul 14, 2019 at 5:24 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> > > > On 20/06/2019 12:07, Giulio Benetti wrote:
> > > > > openrisc support has been added with gcc 9.1.
> > > > > Keep for now the old gcc 5 fork for ork1.
> > > >  So, when will we remove this?
> > > >  Same for ARC (GCC 8.x fork) and C-SKY (GCC 6.x fork): they are available in
> > > > GCC9, do we need to keep those old forks?
> > > Keep the fork for C-SKY, the upstream of csky backend in gcc9 only
> > > support abiv2.
> > As far as I can see, we have no way to choose the ABI in Buildroot.
> > So, what would we loose by keeping only gcc-9?
> See package/Makefile.in
> 
> # For C-SKY abiv1 & abiv2
> ifeq ($(BR2_csky),y)
> ifeq ($(BR2_ck610),y)
> ABI = abiv1
> else
> ABI = abiv2
> endif
> endif

Ah, thanks for pointing this out. I only had a look at arch/arch.mk.csky
and arch/Config.in.csky.

This makes me wonder: should we move all this out of package/Makefile.in
and into the per-arch .mk files instead?

> gcc-9 don't support 610.

There is currently nothign in Buildroot that prevents selecting gcc9 for
the ck610...

> 
> -- 
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
