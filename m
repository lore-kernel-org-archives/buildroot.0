From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 13:27:03 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: expose 'graph-depends' to
 generate a graph of the dependency tree
In-Reply-To: <20131228130647.78e56259@skate>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
 <0fad080c135d79abdbe042514e30b393c25f5a77.1388185918.git.yann.morin.1998@free.fr>
 <20131228124607.193ac484@skate> <20131228115634.GC3373@free.fr>
 <20131228130647.78e56259@skate>
Message-ID: <20131228122703.GD3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-12-28 13:06 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sat, 28 Dec 2013 12:56:34 +0100, Yann E. MORIN wrote:
> 
> > > Why isn't that one done in the package infrastructure, i.e in
> > > pkg-generic.mk ?
> > 
> > For two reasons:
> >   - to have both graph-depends and %-graph-depends side-by-side, so it
> >     is easier to update the rules,
> 
> Right, that's a pretty good reason.
> 
> >   - to limit the number of rules in the Makefile, which is already a bit
> >     long to parse.
> 
> Well, you still have the rule in pkg-generic.mk, which you added to
> make the completion work. So practically speaking, the number of rules
> is the same.

Doh, you're right...

> > I initially added that in package/pkg-generic.mk:
> >     $(1)-graph-depends:
> >         @install -d $(O)/graphs
> 
> Should be $(INSTALL) maybe?

Yes, I'll change that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
