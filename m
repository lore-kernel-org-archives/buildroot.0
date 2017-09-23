From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:14:47 +0200
Subject: [Buildroot] [PATCH 14/49 v2] package/asterisk: add optional
 libilbc dependency
In-Reply-To: <e8a80370d0d41b49efcd7f57a9fe933ddb6601cb.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <e8a80370d0d41b49efcd7f57a9fe933ddb6601cb.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <7d8abafb-a857-4c35-056e-72ee68f4defd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-17 23:39, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Since I turned libilbc into a mandatory dependency, I rejected this patch.

 Regards,
 Arnout

> ---
>  package/asterisk/asterisk.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 342c642feb..bd5b794117 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -46,7 +46,6 @@ ASTERISK_CONF_OPTS = \
>  	--without-cpg \
>  	--without-curses \
>  	--without-dahdi \
> -	--without-ilbc \
>  	--without-gtk2 \
>  	--without-gmime \
>  	--without-h323 \
> @@ -143,6 +142,13 @@ else
>  ASTERISK_CONF_OPTS += --without-bluetooth
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBILBC),y)
> +ASTERISK_DEPENDENCIES += libilbc
> +ASTERISK_CONF_OPTS += --with-ilbc
> +else
> +ASTERISK_CONF_OPTS += --without-ilbc
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  ASTERISK_DEPENDENCIES += libcurl
>  ASTERISK_CONF_OPTS += --with-libcurl
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
