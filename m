From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 00:15:06 +0200
Subject: [Buildroot] [PATCH 05 of 15] packages: rename
 FOO_INSTALL_HOST_OPT into FOO_INSTALL_HOST_OPTS
In-Reply-To: <ba7545d68ae2f0383285.1411846362@localhost>
References: <patchbomb.1411846357@localhost>
 <ba7545d68ae2f0383285.1411846362@localhost>
Message-ID: <20140927221506.GO4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-27 21:32 +0200, Thomas De Schampheleire spake thusly:
> To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
> make the same change for FOO_INSTALL_HOST_OPT.
> 
> Sed command used:
>    find * -type f | xargs sed -i 's#_INSTALL_HOST_OPT\>#&S#g'
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I have a comment that is not related to this change...

> ---
> v2: rebase
> 
>  package/pkg-cmake.mk |  4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -41,7 +41,7 @@
>  $(2)_MAKE			?= $$(MAKE)
>  $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPTS			?=
> -$(2)_INSTALL_HOST_OPT		?= install
> +$(2)_INSTALL_HOST_OPTS		?= install

The other infras do not use a 'HOST_' in the middle of host-variant
variables; 'HOST_' is only present at the beginning.

For example, we have HOST_LIBFOO_INSTALL_CMDS that contrasts to
LIBFOO_INSTALL_{TARGET,STAGING,IMAGES}_CMDS.

So, I find there is a bit of discrepancy in this variable naming. Plus,
it is not documented in the manual.

Samuel, is there a reason for the naming of this variable?

Regards,
Yann E. MORIN.

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
