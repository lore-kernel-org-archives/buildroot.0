From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Nov 2019 19:33:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/freerdp: fix pulseaudio support
In-Reply-To: <20191105094215.4580-1-skif@skif-web.ru>
References: <20191105094215.4580-1-skif@skif-web.ru>
Message-ID: <20191105183343.GL2710@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2019-11-05 12:42 +0300, Alexey Lukyanchuk spake thusly:
> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
> ---
>  package/freerdp/freerdp.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 0f32ff4718..931fa49477 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -51,6 +51,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
>  FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=ON

This one should be removed, since it is in fact not used, and since ...

> +FREERDP_CONF_OPTS += -DWITH_PULSE=ON

... this is the ciorrect variable, and ...

>  FREERDP_DEPENDENCIES += pulseaudio
>  else
>  FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF

... it should also be used here too.

I've applied, fixed, expanded the commit log, and pushed now. Thanks!

Regards,
Yann E. MORIN.

> -- 
> 2.21.0
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
