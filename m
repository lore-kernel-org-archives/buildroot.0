From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 11:01:27 +0200
Subject: [Buildroot] [PATCH 02/12] reproducibility: override locale and
 timezone
In-Reply-To: <1465918277-30675-2-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918277-30675-2-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160702090127.GB22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:31 +0200, Gilles Chanteperdrix spake thusly:
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 3f5c3d3..0217ff0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -208,6 +208,13 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>  -include $(BR2_CONFIG)
>  endif
>  
> +export BR2_REPRODUCIBLE
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +export TZ=UTC
> +export LANG=C
> +export LC_ALL=C
> +endif
> +
>  # To put more focus on warnings, be less verbose as default
>  # Use 'make V=1' to see the full commands
>  ifeq ("$(origin V)", "command line")
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
