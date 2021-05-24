From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:25:16 +0200
Subject: [Buildroot] [PATCH 2/3] package/libsndfile: add external libs
 support
In-Reply-To: <20210523101121.1517749-2-fontaine.fabrice@gmail.com>
References: <20210523101121.1517749-1-fontaine.fabrice@gmail.com>
 <20210523101121.1517749-2-fontaine.fabrice@gmail.com>
Message-ID: <20210524122516.GV3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 12:11 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libsndfile/libsndfile.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
> index 2505e8d17f..d0bceecb36 100644
> --- a/package/libsndfile/libsndfile.mk
> +++ b/package/libsndfile/libsndfile.mk
> @@ -18,7 +18,17 @@ LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
>  LIBSNDFILE_CONF_OPTS = \
>  	--disable-sqlite \
>  	--disable-alsa \
> -	--disable-external-libs \
>  	--disable-full-suite
>  
> +ifeq ($(BR2_PACKAGE_FLAC)$(BR2_PACKAGE_LIBVORBIS)$(BR2_PACKAGE_OPUS),yyy)
> +LIBSNDFILE_DEPENDENCIES += \
> +	flac \
> +	host-pkgconf \
> +	libvorbis \
> +	opus
> +LIBSNDFILE_CONF_OPTS += --enable-external-libs
> +else
> +LIBSNDFILE_CONF_OPTS += --disable-external-libs
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.30.2
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
