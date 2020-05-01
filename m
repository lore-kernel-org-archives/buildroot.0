From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 14:11:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: fix build
 without threads
In-Reply-To: <20200501102758.2136958-1-fontaine.fabrice@gmail.com>
References: <20200501102758.2136958-1-fontaine.fabrice@gmail.com>
Message-ID: <20200501121149.GU11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-01 12:27 +0200, Fabrice Fontaine spake thusly:
> Use --{en,dis}able-{threading,slotevent} to fix build without threads
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d6eefca3ab1fb86e148e998238eed1df2310775f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, with two little changes: move earlier; use
single-line assignments. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/pkcs11-helper/pkcs11-helper.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
> index a95340daf7..4d0974dd0f 100644
> --- a/package/pkcs11-helper/pkcs11-helper.mk
> +++ b/package/pkcs11-helper/pkcs11-helper.mk
> @@ -48,4 +48,14 @@ PKCS11_HELPER_CONF_OPTS += \
>  	--disable-crypto-engine-openssl
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +PKCS11_HELPER_CONF_OPTS += \
> +	--enable-slotevent \
> +	--enable-threading
> +else
> +PKCS11_HELPER_CONF_OPTS += \
> +	--disable-slotevent \
> +	--disable-threading
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.26.2
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
