From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Dec 2017 23:28:27 +0100
Subject: [Buildroot] [PATCH 1/2] json-c: build for host
In-Reply-To: <874c469c732d0301687987f41dcbd7141f319b58.1514050983.git.baruch@tkos.co.il>
References: <874c469c732d0301687987f41dcbd7141f319b58.1514050983.git.baruch@tkos.co.il>
Message-ID: <20171223222827.GA17887@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-12-23 19:43 +0200, Baruch Siach spake thusly:
> This is needed for the recent cryptsetup version host build.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/json-c/json-c.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
> index 7adbcafa7238..86636d7433eb 100644
> --- a/package/json-c/json-c.mk
> +++ b/package/json-c/json-c.mk
> @@ -11,7 +11,9 @@ JSON_C_MAKE = $(MAKE1)
>  JSON_C_CONF_OPTS = --disable-oldname-compat
>  # AUTORECONF is needed because of Makefile.am.inc patch.
>  JSON_C_AUTORECONF = YES
> +HOST_JSON_C_AUTORECONF = YES
>  JSON_C_LICENSE = MIT
>  JSON_C_LICENSE_FILES = COPYING
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.15.1
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
