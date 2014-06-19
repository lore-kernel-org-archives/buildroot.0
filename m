From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 19 Jun 2014 14:48:58 -0400 (EDT)
Subject: [Buildroot] [PATCH] Makefile: document make <package>-dirclean
In-Reply-To: <20140619182648.GB3534@free.fr>
Message-ID: <409511316.213968.1403203738913.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

> > @@ -849,6 +849,7 @@ help:
> >  	@echo '  toolchain              - build toolchain'
> >  	@echo '  <package>-rebuild      - force recompile <package>'
> >  	@echo '  <package>-reconfigure  - force reconfigure <package>'
> > +	@echo '  <package>-dirclean     - remove the whole <package>
> > build directory'
> 
> I'm not specifically opposed to this, but then we are still missing
> quite a few package-specific actions, of which the full list is
> available in the manual:
>     http://buildroot.net/downloads/manual/manual.html#pkg-build-steps
> 
> Also, it is explained in details in the manual how (and when) to
> rebuild
> a package:
>     http://buildroot.net/downloads/manual/manual.html#rebuild-pkg
> 
> Excerpt:
>     You can ask buildroot to [remove the package directory] with the
>     "make <package>-dirclean" command.
> 
> I believe we should only document the _very important_ commands in
> the
> 'make help' text, and direct the user to the manual for the others.

Having only a portion of commands is confusing.

I would say, either put every package commands in `make help` or
no `make <package>-foo` commands at all.

> E.g.
> something like:
> 
>     $ make help
>     [...]
>     Build:
>       all                    - make world
>       toolchain              - build toolchain
>       <package>-rebuild      - force recompile <package>
>       <package>-reconfigure  - force reconfigure <package>
>       <package>-graph-depends    - generate graph of the dependency
>       tree for package
>         See the manual
>         [http://buildroot.net/downloads/manual/manual.html] for
>         the complete list of per-package build actions.

I'd remove the <package>-* command from `make help` and point to the
in-tree documentation instead (docs/manual/rebuilding-packages.txt).

That'd look like:

    $ make help
    [...]
    Build:
      all (or "world"?)      - make world
      toolchain              - build toolchain
      <package>              - compile only <package>
      <package>-<action>     - See the manual [docs/manual/rebuilding-packages.txt]
                               for the list of per-package build actions.
    [...]

What do you think?

Best,
Vivien
