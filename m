From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Nov 2015 18:57:23 +0100
Subject: [Buildroot] [PATCH 1/5] pkg-download: do not test SITE_METHOD
In-Reply-To: <1447929366-8972-2-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
 <1447929366-8972-2-git-send-email-jezz@sysmic.org>
Message-ID: <20151129175723.GD3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2015-11-19 11:36 +0100, J?r?me Pouiller spake thusly:
> SITE_METHOD is always set in inner-generic-package. So, it is useless
> to test it in pkg-download.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index c86b9ab..757bafe 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -222,12 +222,7 @@ define DOWNLOAD_INNER
>  		exit 1 ; \
>  	fi ; \
>  	if test -n "$(1)" ; then \
> -		if test -z "$($(PKG)_SITE_METHOD)" ; then \
> -			scheme="$(call geturischeme,$(1))" ; \
> -		else \
> -			scheme="$($(PKG)_SITE_METHOD)" ; \
> -		fi ; \
> -		case "$$scheme" in \
> +		case "$($(PKG)_SITE_METHOD)" in \
>  			git) $($(3)_GIT) && exit ;; \
>  			svn) $($(3)_SVN) && exit ;; \
>  			cvs) $($(3)_CVS) && exit ;; \
> -- 
> 2.1.4
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
