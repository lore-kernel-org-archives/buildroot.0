From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Nov 2015 22:36:30 +0100
Subject: [Buildroot] [PATCH] pkg-download: support file:// in
 BR2_PRIMARY_SITE
In-Reply-To: <1447776478-16046-1-git-send-email-jezz@sysmic.org>
References: <1447776478-16046-1-git-send-email-jezz@sysmic.org>
Message-ID: <564B9DDE.3040602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-11-15 17:07, J?r?me Pouiller wrote:
> This feature was already discuted here:
> 
>   http://lists.busybox.net/pipermail/buildroot/2015-April/125419.html
> 
> Personally, I have a big central directory with all tarballs I have
> ever downloaded. I use this feature to isolate tarballs necessary to
> build a configuration:
> 
>   make project_defconfig
>   make BR2_DL_DIR=/tmp/mirror-project BR2_PRIMARY_SITE=file:///home/user/dl source
>   tar -C /tmp -czvf mirror-project.tgz mirror-project
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 for next

 Regards,
 Arnout

> ---
>  package/pkg-download.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index c86b9ab..f08f616 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -214,6 +214,7 @@ endef
>  define DOWNLOAD_INNER
>  	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
>  		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
> +			file) $(call $(3)_LOCALFILES,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
>  			scp) $(call $(3)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
>  			*) $(call $(3)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
>  		esac ; \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
