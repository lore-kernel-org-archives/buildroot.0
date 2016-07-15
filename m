From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Jul 2016 18:03:21 +0200
Subject: [Buildroot] [PATCH v3] package/weston: Add demo clients install
 option
In-Reply-To: <1468588449-20390-1-git-send-email-xerpi.g.12@gmail.com>
References: <1468588449-20390-1-git-send-email-xerpi.g.12@gmail.com>
Message-ID: <20160715160320.GF3692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergi, All,

On 2016-07-15 15:14 +0200, Sergi Granell spake thusly:
> Signed-off-by: Sergi Granell <xerpi.g.12@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/weston/Config.in | 5 +++++
>  package/weston/weston.mk | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 0812279..c1eb7da 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -104,4 +104,9 @@ config BR2_PACKAGE_WESTON_XWAYLAND
>  comment "XWayland support needs libepoxy and X.org enabled"
>  	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
>  
> +config BR2_PACKAGE_WESTON_DEMO_CLIENTS
> +	bool "demo clients"
> +	help
> +	  This enables the installation of Weston's demo clients.
> +
>  endif
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index dfcb9ac..31c9281 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -142,4 +142,10 @@ else
>  WESTON_CONF_OPTS += --disable-junit-xml
>  endif
>  
> +ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
> +WESTON_CONF_OPTS += --enable-demo-clients-install
> +else
> +WESTON_CONF_OPTS += --disable-demo-clients-install
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.7.4
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
