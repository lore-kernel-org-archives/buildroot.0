From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 00:26:50 +0200
Subject: [Buildroot] [PATCH 09 of 15] packages: rename
 FOO_GETTEXTIZE_OPT into FOO_GETTEXTIZE_OPTS
In-Reply-To: <d01765b5a984f4cb887e.1411846366@localhost>
References: <patchbomb.1411846357@localhost>
 <d01765b5a984f4cb887e.1411846366@localhost>
Message-ID: <20140927222650.GS4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-27 21:32 +0200, Thomas De Schampheleire spake thusly:
> To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
> make the same change for FOO_GETTEXTIZE_OPT.
> 
> Sed command used:
>    find * -type f | xargs sed -i 's#_GETTEXTIZE_OPT\>#&S#g'
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: rebase
> 
>  docs/manual/adding-packages-autotools.txt |  2 +-
>  package/pkg-autotools.mk                  |  4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
> --- a/docs/manual/adding-packages-autotools.txt
> +++ b/docs/manual/adding-packages-autotools.txt
> @@ -136,7 +136,7 @@
>    'gettextize'.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
>    values are +YES+ and +NO+. The default is +NO+.
>  
> -* +LIBFOO_GETTEXTIZE_OPT+, to specify additional options passed to
> +* +LIBFOO_GETTEXTIZE_OPTS+, to specify additional options passed to
>    the 'gettextize' program, if +LIBFOO_GETTEXTIZE=YES+. You may
>    use that if, for example, the +.po+ files are not located in the
>    standard place (i.e. in +po/+ at the root of the package.) By
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -96,7 +96,7 @@
>  endif
>  
>  ifeq ($(4),host)
> - $(2)_GETTEXTIZE_OPT ?= $$($(3)_GETTEXTIZE_OPT)
> + $(2)_GETTEXTIZE_OPTS ?= $$($(3)_GETTEXTIZE_OPTS)
>  endif
>  
>  ifeq ($(4),host)
> @@ -220,7 +220,7 @@
>  #
>  define GETTEXTIZE_HOOK
>  	@$$(call MESSAGE,"Gettextizing")
> -	$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) $$($$(PKG)_GETTEXTIZE_OPT)
> +	$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) $$($$(PKG)_GETTEXTIZE_OPTS)
>  endef
>  
>  #

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
