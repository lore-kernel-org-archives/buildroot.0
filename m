From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 16:38:20 +0200
Subject: [Buildroot] [PATCH 10 of 20] packages: rename
 FOO_INSTALL_HOST_OPT into FOO_INSTALL_HOST_OPTS
In-Reply-To: <9e1787054648d6f2f78a.1406668357@localhost>
References: <patchbomb.1406668347@localhost>
 <9e1787054648d6f2f78a.1406668357@localhost>
Message-ID: <20140914143820.GI3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-29 23:12 +0200, Thomas De Schampheleire spake thusly:
> To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
> make the same change for FOO_INSTALL_HOST_OPT.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Weird, I was expecting this one to be a bit bigger than that. But that's
because the other package infras do not use the _INSTALL_HOST_OPT
variables, but just _INSTALL_OPT.

I think for consistency, we should rename this variable from the cmake
infra, so it is like the other package infras. But that can be a
separate patch. Thoughts?

Regards,
Yann E. MORIN.

> ---
>  package/pkg-cmake.mk |  4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff -r 26c25594f920 -r 9e1787054648 package/pkg-cmake.mk
> --- a/package/pkg-cmake.mk	Tue Jul 29 22:02:01 2014 +0200
> +++ b/package/pkg-cmake.mk	Tue Jul 29 22:08:53 2014 +0200
> @@ -41,7 +41,7 @@
>  $(2)_MAKE			?= $$(MAKE)
>  $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPTS			?=
> -$(2)_INSTALL_HOST_OPT		?= install
> +$(2)_INSTALL_HOST_OPTS		?= install
>  $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
>  
> @@ -124,7 +124,7 @@
>  #
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_HOST_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
