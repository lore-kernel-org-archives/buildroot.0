From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 13:02:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/mraa: add json-c support
In-Reply-To: <20200725092904.1163980-1-fontaine.fabrice@gmail.com>
References: <20200725092904.1163980-1-fontaine.fabrice@gmail.com>
Message-ID: <20200725110246.GM2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-25 11:29 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mraa/mraa.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
> index 9397f12cfd..89c539e793 100644
> --- a/package/mraa/mraa.mk
> +++ b/package/mraa/mraa.mk
> @@ -30,8 +30,14 @@ MRAA_CONF_OPTS += \
>  	-DBUILDSWIG=OFF \
>  	-DUSBPLAT=OFF \
>  	-DFTDI4222=OFF \
> -	-DJSONPLAT=OFF \
>  	-DENABLEEXAMPLES=OFF \
>  	-DBUILDTESTS=OFF
>  
> +ifeq ($(BR2_PACKAGE_JSON_C),y)
> +MRAA_CONF_OPTS += -DJSONPLAT=ON
> +MRAA_DEPENDENCIES += json-c
> +else
> +MRAA_CONF_OPTS += -DJSONPLAT=OFF
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.27.0
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
