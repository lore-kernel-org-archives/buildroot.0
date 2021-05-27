From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 May 2021 17:30:28 +0200
Subject: [Buildroot] [PATCH next 1/1] package/wlroots: check for
 BR2_PACKAGE_SEATD
In-Reply-To: <20210527133752.413075-1-aperez@igalia.com>
References: <20210527133752.413075-1-aperez@igalia.com>
Message-ID: <20210527153028.GT3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian,All,

On 2021-05-27 16:37 +0300, Adrian Perez de Castro spake thusly:
> Fix the wlroots packaging by checking for the correct variable to
> determine whether seatd is being built.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wlroots/wlroots.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> index 38ddba743d..0696d037df 100644
> --- a/package/wlroots/wlroots.mk
> +++ b/package/wlroots/wlroots.mk
> @@ -46,7 +46,7 @@ else
>  WLROOTS_CONF_OPTS += -Dx11-backend=disabled -Dxwayland=disabled
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT),y)
> +ifeq ($(BR2_PACKAGE_SEATD),y)
>  WLROOTS_CONF_OPTS += -Dlibseat=enabled
>  WLROOTS_DEPENDENCIES += seatd
>  else
> -- 
> 2.31.1
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
