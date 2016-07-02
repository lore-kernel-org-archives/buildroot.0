From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 12:16:21 +0200
Subject: [Buildroot] [PATCH 08/12] package/cpio: allow generating
 host-cpio
In-Reply-To: <1465918277-30675-8-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918277-30675-8-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160702101621.GH22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:31 +0200, Gilles Chanteperdrix spake thusly:
> In order to be sure to have a cpio binary on host which supports
> --reproducible.
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  package/cpio/cpio.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
> index 1576127..87b3df8 100644
> --- a/package/cpio/cpio.mk
> +++ b/package/cpio/cpio.mk
> @@ -18,3 +18,9 @@ CPIO_DEPENDENCIES += argp-standalone
>  endif
>  
>  $(eval $(autotools-package))
> +
> +HOST_CPIO_DEPENDENCIES =
> +
> +$(eval $(host-autotools-package))

We usually write all package variables first, and eventually call the
package macros, like:

    [...existing stuff...]

    HOST_CPIO_DEPENDENCIES =

    $(eval $(autotools-package))
    $(eval $(host-autotools-package))

> +CPIO_REPRODUCIBLE = $(HOST_DIR)/usr/bin/cpio --reproducible

Since we now have host-cpio, we can alsso add:

    CPIO = $(HOST_DIR)/usr/bin/cpio

Regards,
Yann E. MORIN.

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
