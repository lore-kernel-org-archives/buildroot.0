From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 00:40:35 +0200
Subject: [Buildroot] [PATCH 6/7] zic: use <PKG>_STRIP_COMPONENTS
In-Reply-To: <1436624110-20428-6-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
 <1436624110-20428-6-git-send-email-luca@lucaceresoli.net>
Message-ID: <55A19B63.2090109@mind.be>
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
>  package/zic/zic.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
> index a768ac6cfd59..03e023ae4ff4 100644
> --- a/package/zic/zic.mk
> +++ b/package/zic/zic.mk
> @@ -7,14 +7,9 @@
>  ZIC_VERSION = 2015e
>  ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
>  ZIC_SITE = ftp://ftp.iana.org/tz/releases
> +ZIC_STRIP_COMPONENTS = 0
>  ZIC_LICENSE = Public domain
>  
> -# Don't strip any path components during extraction.
> -define HOST_ZIC_EXTRACT_CMDS
> -	gzip -d -c $(DL_DIR)/$(ZIC_SOURCE) \
> -		| $(TAR) --strip-components=0 -C $(@D) -xf -
> -endef
> -
>  define HOST_ZIC_BUILD_CMDS
>  	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
>  endef
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
