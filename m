From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 23:10:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: replace
 host-intltool by $(TARGET_NLS_DEPENDENCIES)
In-Reply-To: <20200101211448.3162049-1-fontaine.fabrice@gmail.com>
References: <20200101211448.3162049-1-fontaine.fabrice@gmail.com>
Message-ID: <20200101221054.GS3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-01-01 22:14 +0100, Fabrice Fontaine spake thusly:
> intltool has been replaced by gettext since version 12.99.1 and
> https://gitlab.freedesktop.org/pulseaudio/pulseaudio/commit/57e3ccaf51f714eec8ca29005c3cc4fde456e84e
> so replace host-intltool by $(TARGET_NLS_DEPENDENCIES)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pulseaudio/pulseaudio.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index 0e78724634..08f548180a 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -17,7 +17,7 @@ PULSEAUDIO_CONF_OPTS = \
>  	--disable-running-from-build-tree
>  
>  PULSEAUDIO_DEPENDENCIES = \
> -	host-pkgconf libtool libsndfile speex host-intltool \
> +	host-pkgconf libtool libsndfile speex $(TARGET_NLS_DEPENDENCIES) \

I moved $(TARGET_NLS_DEPENDENCIES) to its own line, and applied to
master, thanks.

Regards,
Yann E. MORIN.

>  	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
>  	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
>  	$(if $(BR2_PACKAGE_DBUS),dbus) \
> -- 
> 2.24.0
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
