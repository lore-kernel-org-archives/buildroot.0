From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jun 2021 21:37:19 +0200
Subject: [Buildroot] [PATCH next 1/1] package/weston: enable libseat
 launcher if seatd is enabled
In-Reply-To: <20210527133503.412330-1-aperez@igalia.com>
References: <20210527133503.412330-1-aperez@igalia.com>
Message-ID: <20210616193719.GP2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-27 16:35 +0300, Adrian Perez de Castro spake thusly:
> Enable building Weston's libseat launcher, now that the seatd package
> is available.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/weston/weston.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index f59963bf2e..6afc5e269c 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -25,6 +25,13 @@ else
>  WESTON_CONF_OPTS += -Dsimple-clients=
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SEATD),y)
> +WESTON_CONF_OPTS += -Dlauncher-libseat=true
> +WESTON_DEPENDENCIES += seatd
> +else
> +WESTON_CONF_OPTS += -Dlauncher-libseat=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
>  WESTON_CONF_OPTS += -Dlauncher-logind=true
>  WESTON_DEPENDENCIES += dbus systemd
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
