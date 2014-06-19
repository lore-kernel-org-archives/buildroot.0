From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Jun 2014 22:10:47 +0200
Subject: [Buildroot] [PATCH] Makefile: document make <package>-dirclean
In-Reply-To: <409511316.213968.1403203738913.JavaMail.root@mail>
References: <20140619182648.GB3534@free.fr>
 <409511316.213968.1403203738913.JavaMail.root@mail>
Message-ID: <20140619201047.GC3534@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2014-06-19 14:48 -0400, Vivien Didelot spake thusly:
> > > @@ -849,6 +849,7 @@ help:
> > >  	@echo '  toolchain              - build toolchain'
> > >  	@echo '  <package>-rebuild      - force recompile <package>'
> > >  	@echo '  <package>-reconfigure  - force reconfigure <package>'
> > > +	@echo '  <package>-dirclean     - remove the whole <package>
> > > build directory'
[--SNIP--]
> > I believe we should only document the _very important_ commands in
> > the
> > 'make help' text, and direct the user to the manual for the others.
> 
> Having only a portion of commands is confusing.
> 
> I would say, either put every package commands in `make help` or
> no `make <package>-foo` commands at all.

Well, I think we should still document a few important, usefull actions;
see below.

> > E.g.
> > something like:
> > 
> >     $ make help
> >     [...]
> >     Build:
> >       all                    - make world
> >       toolchain              - build toolchain
> >       <package>-rebuild      - force recompile <package>
> >       <package>-reconfigure  - force reconfigure <package>
> >       <package>-graph-depends    - generate graph of the dependency
> >       tree for package
> >         See the manual
> >         [http://buildroot.net/downloads/manual/manual.html] for
> >         the complete list of per-package build actions.
> 
> I'd remove the <package>-* command from `make help` and point to the
> in-tree documentation instead (docs/manual/rebuilding-packages.txt).

Note: everything in docs/manual/ is the source of the (on-line) manual.
Although readable as-is, it only gets really properly readable once
rendered into the manual.

So, I would not point to the content of docs/manual/ but to the on-line
manual, instead.

> That'd look like:
> 
>     $ make help
>     [...]
>     Build:
>       all (or "world"?)      - make world
>       toolchain              - build toolchain
>       <package>              - compile only <package>
>       <package>-<action>     - See the manual [docs/manual/rebuilding-packages.txt]
>                                for the list of per-package build actions.
>     [...]
> 
> What do you think?

'world' is an internal goal. The entry point is the 'all' gaol, and also the
default goal if no other is specified. I think we should not document
'world'.

Adding '<package>' is OK, but we should keep 'rebuild', 'reconfigure'
and 'graph-depends':
  - we want to prominently advertise the mere existence of 'graph-depends'
    to the unsuspecting user,
  - 'rebuild' and 'reconfigure' are important enough so we probably want
    to maintain them.

With those three acting as a template, and the pointer to the manual,
the user should (hopefully) easily:
  - find the other actions (from the manual)
  - remember how to toggle those actions (by memory and pattern matching
    with the actions visible in the 'make help' output)

But I usually suck at designing user-centric UI. One could say I'm a
weird, uncommon user with a tortured, twisted mind. ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
