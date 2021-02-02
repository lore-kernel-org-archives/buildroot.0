From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Feb 2021 22:57:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/sox: drop unrecognized options
In-Reply-To: <20210202204626.402946-1-fontaine.fabrice@gmail.com>
References: <20210202204626.402946-1-fontaine.fabrice@gmail.com>
Message-ID: <20210202215720.GF2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-02 21:46 +0100, Fabrice Fontaine spake thusly:
> ffmpeg has been dropped since version 14.4.2 (back in 2013) and
> https://sourceforge.net/p/sox/code/ci/5ae4049727d4f29036ad541bde5863c850aa7755
> 
> --disable-gomp has also been removed since version 14.4.1 (back in 2012)
> and
> https://sourceforge.net/p/sox/code/ci/84eaacb54fd2e61154ccd95328d8a8ec5096eae1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sox/sox.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/sox/sox.mk b/package/sox/sox.mk
> index 9abbc2f636..8a1d87b230 100644
> --- a/package/sox/sox.mk
> +++ b/package/sox/sox.mk
> @@ -15,8 +15,6 @@ SOX_CPE_ID_PRODUCT = sound_exchange
>  
>  SOX_CONF_OPTS = \
>  	--with-distro="Buildroot" \
> -	--without-ffmpeg \
> -	--disable-gomp \
>  	--disable-stack-protector
>  
>  ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
> -- 
> 2.29.2
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
