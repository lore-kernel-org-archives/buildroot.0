From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 10:13:30 +0200
Subject: [Buildroot] [PATCH 1 of 2] check-deprecated-variable: move from
 pkg-generic.mk to pkg-utils.mk
In-Reply-To: <98b4f7f5e2ea63e41fa1.1412495911@localhost>
References: <98b4f7f5e2ea63e41fa1.1412495911@localhost>
Message-ID: <20141005081330.GB4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-05 09:58 +0200, Thomas De Schampheleire spake thusly:
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk |  15 ---------------
>  package/pkg-utils.mk   |   9 +++++++++
>  2 files changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -264,21 +264,6 @@
>  endef
>  
>  ################################################################################
> -# check-deprecated-variable -- throw an error on deprecated variables
> -#
> -# argument 1 is the deprecated variable
> -# argument 2 is the new variable to use
> -#
> -# example:
> -#   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
> -################################################################################
> -define check-deprecated-variable
> -ifneq ($$(origin $(1)),undefined)
> -$$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
> -endif
> -endef
> -
> -################################################################################
>  # inner-generic-package -- generates the make targets needed to build a
>  # generic package
>  #
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -88,6 +88,15 @@
>  
>  endef
>  
> +# check-deprecated-variable -- throw an error on deprecated variables
> +# example:
> +#   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
> +define check-deprecated-variable # (deprecated var, new var)
> +ifneq ($$(origin $(1)),undefined)
> +$$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
> +endif
> +endef
> +
>  #
>  # legal-info helper functions
>  #

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
