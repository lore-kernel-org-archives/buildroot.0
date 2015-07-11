From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 00:36:48 +0200
Subject: [Buildroot] [PATCH 5/7] tzdata: use <PKG>_STRIP_COMPONENTS
In-Reply-To: <1436624110-20428-5-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
 <1436624110-20428-5-git-send-email-luca@lucaceresoli.net>
Message-ID: <55A19A80.4000001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/15 16:15, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/tzdata/tzdata.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index eb6da6ce3375..c38d4fe8cd2b 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -7,6 +7,7 @@
>  TZDATA_VERSION = 2015e
>  TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
>  TZDATA_SITE = ftp://ftp.iana.org/tz/releases
> +TZDATA_STRIP_COMPONENTS = 0
>  TZDATA_DEPENDENCIES = host-tzdata
>  HOST_TZDATA_DEPENDENCIES = host-zic
>  TZDATA_LICENSE = Public domain
> @@ -45,11 +46,6 @@ define TZDATA_INSTALL_TARGET_CMDS
>  	fi
>  endef
>  
> -define HOST_TZDATA_EXTRACT_CMDS
> -	gzip -d -c $(DL_DIR)/$(TZDATA_SOURCE) \
> -		| $(TAR) --strip-components=0 -C $(@D) -xf -
> -endef
> -
>  define HOST_TZDATA_BUILD_CMDS
>  	(cd $(@D); \
>  		for zone in $(TZDATA_ZONELIST); do \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
