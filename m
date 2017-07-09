From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Jul 2017 14:41:24 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <855c5444-80f0-491b-5d70-aef7cd13b110@mind.be>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net>
 <20170705072538.GE3499@scaer>
 <fc53112d-c7a3-64c9-74ad-277741161711@mind.be>
 <5c9f063f-5b5c-226d-ca25-6bcb8ebf7ced@mind.be>
 <CAGt4E5ueb6x_S4ff=dAeK-x9JnO1SmhnUGz+Q3XKUtj6s24L_Q@mail.gmail.com>
 <CAGt4E5s1qdysaU2dAeYFJL_16PLxwAYWyi6yhiKsRb6wADW-5A@mail.gmail.com>
 <20170709081346.GA3196@scaer>
 <855c5444-80f0-491b-5d70-aef7cd13b110@mind.be>
Message-ID: <20170709124124.GC3196@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-09 13:10 +0200, Arnout Vandecappelle spake thusly:
> On 09-07-17 10:13, Yann E. MORIN wrote:
> > Markus, All,
> > 
> > On 2017-07-05 10:19 -0700, Markus Mayer spake thusly:
> > [--SNIP--]
> >> That said, and while I am a complete buildroot newbie, I do like the
> >> suggestion of creating sub-directories for the tools and including the
> >> makefiles from linux-tools.mk rather than relying on alphabetical
> >> sorting.
> > 
> > To be sure we're on the same line: one single sub-directory with all tools
> > in there, not one sub-dir per tool.
> 
>  Really? One sub-dir per tool would be more in-line with how we handle normal
> packages.

Well, I would find it a bit over-blown to have many sub-dirs with a
single file (the .mk) in each.

Unless you also expected that the big Config.in file be split too?

I would argue against, because its fate is already a bit special: it is
not sourced from package/Config.in but from linux/Config.in. and I would
prefer we avoid a bit more complexity...

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
