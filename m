From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:39:16 +0100
Subject: [Buildroot] [PATCH v4 3/3] download: get rid of trailing slash
 removal hack for FOO_SITE
In-Reply-To: <1443892938-17039-4-git-send-email-luca@lucaceresoli.net>
References: <1443892938-17039-1-git-send-email-luca@lucaceresoli.net>
 <1443892938-17039-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <56111DF4.1040503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 18:22, Luca Ceresoli wrote:
> Not needed anymore since the URLs have been cleared, the manual states
> they are illegal and a check has been introduced to notice future
> mistakes.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> ---
> No changes in v4.
> 
> Changes v2 -> v3:
>  - move after the commit on docs/manual, update commit message.
> 
> Changes v1 -> v2:
>  - redo on current master.
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index de2fb07..3942a89 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -388,7 +388,7 @@ endif
>  $(2)_ALL_DOWNLOADS = \
>  	$$(foreach p,$$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
>  		$$(if $$(findstring ://,$$(p)),$$(p),\
> -			$$($(2)_SITE:/=)/$$(p)))
> +			$$($(2)_SITE)/$$(p)))
>  
>  ifndef $(2)_SITE
>   ifdef $(3)_SITE
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
