From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2021 22:28:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/babeltrace2: link with
 libatomic if needed
In-Reply-To: <20210221201452.103678-1-fontaine.fabrice@gmail.com>
References: <20210221201452.103678-1-fontaine.fabrice@gmail.com>
Message-ID: <20210225212836.GK2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-21 21:14 +0100, Fabrice Fontaine spake thusly:
> Fix build of babeltrace2 in version 2.0.3 with Bootlin SPARC uclibc
> toolchain added with commit 1348c569d0cb7f67eca30f170b782aa8b51cc259
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/31770bf70f9ce4e3be8fb310d084b214820c6829
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/babeltrace2/babeltrace2.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
> index eb29a5928b..1e03f5fdd2 100644
> --- a/package/babeltrace2/babeltrace2.mk
> +++ b/package/babeltrace2/babeltrace2.mk
> @@ -27,5 +27,9 @@ else
>  BABELTRACE2_CONF_OPTS += --disable-debug-info
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +BABELTRACE2_CONF_ENV += LIBS=-latomic
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
