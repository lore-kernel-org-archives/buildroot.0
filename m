From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jun 2016 14:59:37 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: add support for simple
 background scan
In-Reply-To: <1465661589-10963-1-git-send-email-martin@barkynet.com>
References: <1465661589-10963-1-git-send-email-martin@barkynet.com>
Message-ID: <20160618125937.GE3573@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2016-06-11 17:13 +0100, Martin Bark spake thusly:
> CONFIG_BGSCAN_SIMPLE is missing from the defconfig included with
> wpa_supplicant.  Many programs that depend on wpa_supplicant assume
> bgscan is enabled, for example connman will try to set bgscan by default.
> It is safe to always enable CONFIG_BGSCAN_SIMPLE since it is only used if
> wpa_supplicant is configured to do so.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index ba1180d..21bbd3e 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -20,7 +20,8 @@ WPA_SUPPLICANT_INSTALL_STAGING = YES
>  
>  WPA_SUPPLICANT_CONFIG_EDITS =
>  
> -WPA_SUPPLICANT_CONFIG_SET =
> +# Add support for simple background scan
> +WPA_SUPPLICANT_CONFIG_SET = CONFIG_BGSCAN_SIMPLE
>  
>  WPA_SUPPLICANT_CONFIG_ENABLE = \
>  	CONFIG_IEEE80211AC	\
> -- 
> 2.7.4
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
