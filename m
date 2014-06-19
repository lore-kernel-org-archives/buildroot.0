From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Jun 2014 20:26:48 +0200
Subject: [Buildroot] [PATCH] Makefile: document make <package>-dirclean
In-Reply-To: <1403199888-24237-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1403199888-24237-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20140619182648.GB3534@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2014-06-19 13:44 -0400, Vivien Didelot spake thusly:
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index a2681f6..81da5ae 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -849,6 +849,7 @@ help:
>  	@echo '  toolchain              - build toolchain'
>  	@echo '  <package>-rebuild      - force recompile <package>'
>  	@echo '  <package>-reconfigure  - force reconfigure <package>'
> +	@echo '  <package>-dirclean     - remove the whole <package> build directory'

I'm not specifically opposed to this, but then we are still missing
quite a few package-specific actions, of which the full list is
available in the manual:
    http://buildroot.net/downloads/manual/manual.html#pkg-build-steps

Also, it is explained in details in the manual how (and when) to rebuild
a package:
    http://buildroot.net/downloads/manual/manual.html#rebuild-pkg

Excerpt:
    You can ask buildroot to [remove the package directory] with the
    "make <package>-dirclean" command.

I believe we should only document the _very important_ commands in the
'make help' text, and direct the user to the manual for the others. E.g.
something like:

    $ make help
    [...]
    Build:
      all                    - make world
      toolchain              - build toolchain
      <package>-rebuild      - force recompile <package>
      <package>-reconfigure  - force reconfigure <package>
      <package>-graph-depends    - generate graph of the dependency tree for package
        See the manual [http://buildroot.net/downloads/manual/manual.html] for
        the complete list of per-package build actions.
    [...]

Regards,
Yann E. MORIN.

>  	@echo '  <package>-graph-depends    - generate graph of the dependency tree for package'
>  	@echo
>  	@echo 'Configuration:'
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
