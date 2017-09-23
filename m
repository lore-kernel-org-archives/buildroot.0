From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:14:17 +0200
Subject: [Buildroot] [PATCH 07/49 v2] package/asterisk: add optional
 curl dependency
In-Reply-To: <0964a3811a3c7a9de4790966cdd90dc390ff1c8f.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <0964a3811a3c7a9de4790966cdd90dc390ff1c8f.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <96f0b730-f80a-0153-0808-2990d9c96f3a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-17 23:39, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Curl was already a mandatory dependency so I rejected this.

 Regards,
 Arnout

> ---
>  package/asterisk/asterisk.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 6e68cd1912..29e52aef46 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -143,6 +143,13 @@ else
>  ASTERISK_CONF_OPTS += --without-asound
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +ASTERISK_DEPENDENCIES += libcurl
> +ASTERISK_CONF_OPTS += --with-libcurl
> +else
> +ASTERISK_CONF_OPTS += --without-libcurl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  ASTERISK_DEPENDENCIES += openssl
>  ASTERISK_CONF_OPTS += --with-ssl
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
