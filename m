From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Dec 2019 16:43:20 +0100
Subject: [Buildroot] [arc-buildroot] [PATCH] arch/arc: Explicitly set
 "max-page-size" for GNU LD
In-Reply-To: <CY4PR1201MB0120748B829AE787E4B3A097A12A0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20191224141032.34544-1-abrodkin@synopsys.com>
 <20191225223603.360a7ffa@windsurf> <20191226170504.GP26395@scaer>
 <CY4PR1201MB0120748B829AE787E4B3A097A12A0@CY4PR1201MB0120.namprd12.prod.outlook.com>
Message-ID: <20191227154320.GQ26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2019-12-27 09:00 +0000, Alexey Brodkin spake thusly:
[--SNIP--]
> > I was also contemplating a similar solution, but I was not too happy
> > with this trick to drop the suffix. I would have prefered something
> > like:
> > 
> >     config BR2_ARC_PAGE_SIZE_KB
> >         int
> >         default 4 if BR2_ARC_PAGE_SIZE_4K
> >         default 8 if BR2_ARC_PAGE_SIZE_8K
> >         default 16 if BR2_ARC_PAGE_SIZE_16K
> > 
> > and then:
> > 
> >     ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=$(shell echo $$(($(BR2_ARC_PAGE_SIZE)*1024)))
> > 
> > and in package/uclibc/uclibc.mk:
> > 
> >     UCLIBC_ARC_PAGE_SIZE = CONFIG_ARC_PAGE_SIZE_$(BR2_ARC_PAGE_SIZE)K
> > 
> > ... and even that intermediate variable could have been dropped
> > altogether, to directly write:
> > 
> >         $(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_$(BR2_ARC_PAGE_SIZE)K,$(@D)/.config)
> > 
> > And that would have been a bit nicer, I believe.
> 
> Agree. So, Yann [as usually] are you OK if I implement that improvement?

As you wish! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
