From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 17:04:25 +0200
Subject: [Buildroot] [PATCH 6/8] package/apr: Fix for Apache when
 listening to multiple ports
In-Reply-To: <1412516718-12597-6-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
 <1412516718-12597-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141005150425.GK4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-05 15:45 +0200, Bernd Kuhls spake thusly:
> For details:
> https://issues.apache.org/bugzilla/show_bug.cgi?id=56727#c6
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/apr/apr.mk |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> index 82b1ad2..7eda611 100644
> --- a/package/apr/apr.mk
> +++ b/package/apr/apr.mk
> @@ -20,6 +20,7 @@ APR_CONF_ENV = \
>  	apr_cv_tcp_nodelay_with_cork=yes \
>  	ac_cv_sizeof_struct_iovec=8 \
>  	ac_cv_struct_rlimit=yes \
> +	ac_cv_o_nonblock_inherited=no \
>  	apr_cv_mutex_recursive=yes
>  APR_CONFIG_SCRIPTS = apr-1-config
>  
> -- 
> 1.7.10.4
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
