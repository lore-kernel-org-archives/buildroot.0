From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Mar 2018 16:43:10 +0100
Subject: [Buildroot] [PATCH v4 1/9] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
In-Reply-To: <20180324163716.1818c77e@windsurf>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-2-thomas.petazzoni@bootlin.com>
 <20180324152852.GA2620@scaer> <20180324163716.1818c77e@windsurf>
Message-ID: <20180324154310.GC2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-24 16:37 +0100, Thomas Petazzoni spake thusly:
> On Sat, 24 Mar 2018 16:28:52 +0100, Yann E. MORIN wrote:
> > > +ifneq ($(1),host-skeleton)
> > > +$(2)_DEPENDENCIES += host-skeleton
> > > +endif  
> > 
> > In fact, I'm not too sure I should have given my Reviewed-by tag,
> > because now the graph-depends are all borked: all packages have a
> > dependency arrow toward host-skeleton.
> 
> It is not borked, that's completely correct. Maybe not pretty and
> convenient, but definitely not "borked".

Yeah, not broken, just not "nice-looking"... You got what I meant. ;-)

> > Or we can also just add host-skeleton as a special case in
> > support/scripts/graph-depends...
> 
> That feels like a much better solution to me. We already do that for
> the skeleton anyway. Would that be OK for you?

Yeah, but we should be cautious not to add too much exceptions in that
script, because we'll have to be sure to sync it with the infra...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
