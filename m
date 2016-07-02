From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 11:51:27 +0200
Subject: [Buildroot] [PATCH 05/12] reproducibility/busybox: disable
 build timestamps
In-Reply-To: <1465918277-30675-5-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918277-30675-5-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160702095127.GE22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:31 +0200, Gilles Chanteperdrix spake thusly:
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  package/busybox/busybox.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 08d8e64..a3d526c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -36,6 +36,12 @@ BUSYBOX_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
>  	CFLAGS="$(BUSYBOX_CFLAGS)" \
>  	CFLAGS_busybox="$(BUSYBOX_CFLAGS_busybox)"
> +
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +BUSYBOX_MAKE_ENV += \
> +	KCONFIG_NOTIMESTAMP=1

This could have been a single line (since it is not too long). Otherwise;

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +endif
> +
>  BUSYBOX_MAKE_OPTS = \
>  	CC="$(TARGET_CC)" \
>  	ARCH=$(KERNEL_ARCH) \
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
