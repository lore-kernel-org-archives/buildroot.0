From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Oct 2014 22:26:07 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: use select instead of
 epoll
In-Reply-To: <1412193302-5794-1-git-send-email-limpens@gmail.com>
References: <1412193302-5794-1-git-send-email-limpens@gmail.com>
Message-ID: <20141001202607.GC4245@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-10-01 21:55 +0200, Eric Limpens spake thusly:
> As discussed with Gustavo on the mailing-list, remove EPOLL flag.
> wpa_supplicant isn't able to answer DBUS message as events are
> never delivered.
> 
> Signed-off-by: Eric Limpens <limpens@gmail.com>

I also followed the discussion on IRC, so:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 0ca2ce5..f825d86 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -20,7 +20,6 @@ WPA_SUPPLICANT_CONFIG_EDITS =
>  WPA_SUPPLICANT_CONFIG_SET =
>  
>  WPA_SUPPLICANT_CONFIG_ENABLE = \
> -	CONFIG_ELOOP_EPOLL	\
>  	CONFIG_IEEE80211AC	\
>  	CONFIG_IEEE80211N	\
>  	CONFIG_IEEE80211R	\
> -- 
> 1.9.1
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
