From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:07:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/poppler: fix libcurl support
In-Reply-To: <20170917182818.18868-1-bernd.kuhls@t-online.de>
References: <20170917182818.18868-1-bernd.kuhls@t-online.de>
Message-ID: <8595d13b-d758-570f-528d-c7754a2449ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-09-17 20:28, Bernd Kuhls wrote:
> BR2_PACKAGE_POPPLER_LIBCURL is not defined in poppler/Config.in.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>


 Applied both to master, thanks.

 Regards,
 Arnout

> ---
>  package/poppler/poppler.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index 6796437776..1beb75a6a3 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -66,7 +66,7 @@ else
>  POPPLER_CONF_OPTS += --disable-zlib
>  endif
>  
> -ifeq ($(BR2_PACKAGE_POPPLER_LIBCURL),y)
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  POPPLER_CONF_OPTS += --enable-libcurl
>  POPPLER_DEPENDENCIES += libcurl
>  else
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
