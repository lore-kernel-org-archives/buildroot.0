From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 15:50:48 +0200
Subject: [Buildroot] [PATCH 01 of 20] pkg-generic: introduce helper
 function to check for a deprecated variable
In-Reply-To: <677354152366d6f52f1b.1406668348@localhost>
References: <patchbomb.1406668347@localhost>
 <677354152366d6f52f1b.1406668348@localhost>
Message-ID: <20140914135048.GC3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-29 23:12 +0200, Thomas De Schampheleire spake thusly:
> This patch introduces a helper check-deprecated-variable, that throws an
> error when a package defines a deprecated variable. This helps in detecting
> transition errors when changing the buildroot infrastructures, and also
> helps users that have created packages not part of mainline buildroot.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk |  15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff -r 6ff0cfa8a802 -r 677354152366 package/pkg-generic.mk
> --- a/package/pkg-generic.mk	Tue May 20 13:53:00 2014 +1200
> +++ b/package/pkg-generic.mk	Mon Jul 28 21:39:53 2014 +0200
> @@ -264,6 +264,21 @@
>  endef
>  
>  ################################################################################
> +# check-deprecated-variable -- throw an error on deprecated variables
> +#
> +# argument 1 is the deprecated variable
> +# argument 2 is the new variable to use
> +#
> +# example:
> +#   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
> +################################################################################
> +define check-deprecated-variable
> +ifneq ($$(origin $(1)),undefined)
> +$$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
> +endif
> +endef
> +
> +################################################################################
>  # inner-generic-package -- generates the make targets needed to build a
>  # generic package
>  #

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
