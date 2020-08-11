From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Aug 2020 17:57:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: crypto support needs
 linux-headers
In-Reply-To: <CAPi7W80cauJfB1B1WG_MLp0Ae-jSf+r2hyfT1KY_y6fv2biBOA@mail.gmail.com>
References: <20200811091917.1545019-1-fontaine.fabrice@gmail.com>
 <20200811123010.4355db2a@windsurf.home>
 <CAPi7W80cauJfB1B1WG_MLp0Ae-jSf+r2hyfT1KY_y6fv2biBOA@mail.gmail.com>
Message-ID: <20200811155740.GE13263@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-08-11 17:01 +0200, Fabrice Fontaine via buildroot spake thusly:
> Le mar. 11 ao?t 2020 ? 12:30, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> > On Tue, 11 Aug 2020 11:19:17 +0200
> > Fabrice Fontaine via buildroot <buildroot@busybox.net> wrote:
> > > crypto support needs linux-headers as it includes <linux/hash_info.h>
> > > since version 2.1.2 and
> > You can't do that, as linux-headers is only used for the internal
> > toolchain backend. Also the kernel headers are already present in all
> > toolchains, so how could this change anything ?
> I was not aware that kernel headers were already present in all
> toolchains. Thanks for spotting my mistake. I'll send a v2 adding a
> dependency on headers 4.12 as this is the real issue.

Yes.

> However, it should be noted that we have an "issue" with the iputils
> package as it has an optional dependency on linux-headers since commit
> 9ffcd9279e5505535a73cf1200b3a86fd425cf32.
> I assume that this dependency is also not needed?

s/not needed/incorrect/, yes

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
