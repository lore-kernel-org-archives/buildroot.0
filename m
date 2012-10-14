From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2012 23:26:29 +0200
Subject: [Buildroot] [PATCH 03/10] ndisc6: only needs gettext if locale
	is selected
In-Reply-To: <20121014210957.17845.97141.stgit@localhost>
References: <20121014210734.17845.64519.stgit@localhost>
 <20121014210957.17845.97141.stgit@localhost>
Message-ID: <201210142326.29656.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Sunday 14 October 2012 Arnout Vandecappelle (Essensium/Mind) wrote:
> Also add missing select in Config.in.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/ndisc6/Config.in |    1 +
>  package/ndisc6/ndisc6.mk |    2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
> index 126bfa2..6abe4ce 100644
> --- a/package/ndisc6/Config.in
> +++ b/package/ndisc6/Config.in
> @@ -4,6 +4,7 @@ comment "ndisc6 requires a toolchain with IPv6 support"
>  config BR2_PACKAGE_NDISC6
>  	bool "ndisc6 tools"
>  	depends on BR2_INET_IPV6
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	help
>  	  NDisc6 is a small collection of useful tools for IPv6 networking
>  
> diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
> index f58cc13..1d3c0e7 100644
> --- a/package/ndisc6/ndisc6.mk
> +++ b/package/ndisc6/ndisc6.mk
> @@ -10,7 +10,7 @@ NDISC6_SITE = http://www.remlab.net/files/ndisc6/
>  NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
>  NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
>  
> -ifeq ($(BR2_PACKAGE_GETTEXT),y)
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  NDISC6_DEPENDENCIES += gettext
>  NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
>  endif
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
