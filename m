From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Nov 2017 10:31:33 +0100
Subject: [Buildroot] [NEXT 05/17] libpjsip: add portaudio option
In-Reply-To: <20171110202109.25215-5-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
 <20171110202109.25215-5-aduskett@gmail.com>
Message-ID: <89962c8f-9c81-2619-8b10-01fd179939ec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-11-17 21:20, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/libpjsip/Config.in   | 4 ++++
>  package/libpjsip/libpjsip.mk | 5 +++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
> index 0a6398d508..e00a4a30b0 100644
> --- a/package/libpjsip/Config.in
> +++ b/package/libpjsip/Config.in
> @@ -26,6 +26,10 @@ config BR2_PACKAGE_LIBPJSIP_ALSA
>  config BR2_PACKAGE_LIBPJSIP_OSS
>  	bool "OSS support"
>  
> +config BR2_PACKAGE_LIBPJSIP_PORTAUDIO
> +	bool "portaudio support"
> +	select BR2_PACKAGE_PORTAUDIO
> +
>  endif # BR2_PACKAGE_LIBPJSIP_SOUND
>  
>  endif # BR2_PACKAGE_LIBPJSIP
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index d02ca4e803..774959d50b 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -78,4 +78,9 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_OSS),y)
>  LIBPJSIP_CONF_OPTS += --disable-oss
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBPJSIP_PORTAUDIO),y)
> +LIBPJSIP_DEPENDENCIES += portaudio
> +LIBPJSIP_CONF_OPTS += --with-external-pa

 It his option is not selected, will it use an internal copy of portaudio? Do we
really want that?

 Regards,
 Arnout

> +endif
> +
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
