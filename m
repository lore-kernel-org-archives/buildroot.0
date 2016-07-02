From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 11:54:39 +0200
Subject: [Buildroot] [PATCH 07/12] reproducibility/libgpg-error:
 override timestamps
In-Reply-To: <1465918277-30675-7-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918277-30675-7-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160702095439.GG22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:31 +0200, Gilles Chanteperdrix spake thusly:
> with SOURCE_DATE_EPOCH
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  package/libgpg-error/libgpg-error.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 52b7058..de232eb 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -14,4 +14,8 @@ LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
>  LIBGPG_ERROR_AUTORECONF = YES
>  LIBGPG_ERROR_GETTEXTIZE = YES
>  
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +LIBGPG_ERROR_MAKE_OPTS = BUILD_TIMESTAMP=$(SOURCE_DATE)
                                              ^^^^^^^^^^^

You probably meant SOURCE_DATE_EPOCH, right?

Regards,
Yann E. MORIN.

> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.8.2
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
