From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2014 16:02:47 +0200
Subject: [Buildroot] [PATCH 1 of 6] pkg-utils: kconfig helpers: add
 basic usage documentation
In-Reply-To: <4a53bf323d8a1808dd1b.1405338625@localhost>
References: <patchbomb.1405338624@localhost>
 <4a53bf323d8a1808dd1b.1405338625@localhost>
Message-ID: <20140714140247.GG3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-14 13:50 +0200, Thomas De Schampheleire spake thusly:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-utils.mk |  6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff -r 7c17407eb26e -r 4a53bf323d8a package/pkg-utils.mk
> --- a/package/pkg-utils.mk	Sat Jul 12 14:41:41 2014 -0300
> +++ b/package/pkg-utils.mk	Wed Jul 09 20:27:38 2014 +0200
> @@ -33,17 +33,17 @@
>  # package, and more.
>  #
>  
> -define KCONFIG_ENABLE_OPT
> +define KCONFIG_ENABLE_OPT # (option, file)
>  	$(SED) "/\\<$(1)\\>/d" $(2)
>  	echo "$(1)=y" >> $(2)
>  endef
>  
> -define KCONFIG_SET_OPT
> +define KCONFIG_SET_OPT # (option, value, file)
>  	$(SED) "/\\<$(1)\\>/d" $(3)
>  	echo "$(1)=$(2)" >> $(3)
>  endef
>  
> -define KCONFIG_DISABLE_OPT
> +define KCONFIG_DISABLE_OPT # (option, file)
>  	$(SED) "/\\<$(1)\\>/d" $(2)
>  	echo "# $(1) is not set" >> $(2)
>  endef

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
