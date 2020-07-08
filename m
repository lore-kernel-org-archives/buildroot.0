From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jul 2020 18:53:01 +0200
Subject: [Buildroot] [PATCH 3/9] package/pkg-utils: show-info: report
 the list of the CVEs ignored
In-Reply-To: <20200708164006.859021-4-gregory.clement@bootlin.com>
References: <20200708164006.859021-1-gregory.clement@bootlin.com>
 <20200708164006.859021-4-gregory.clement@bootlin.com>
Message-ID: <20200708185301.2bbd12bf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Jul 2020 18:40:00 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Add the list of the CVEs to ignore for each package because they
> already have a fix for it.
> 
> This information will be useful for a cve-checker.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  package/pkg-utils.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index d88a14ab0f..49ce6dc6f1 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -117,7 +117,10 @@ define _json-info-pkg
>  		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
>  	],
>  	"reverse_dependencies": [
> -		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
> +		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES))),
> +	],
> +	"ignored_cves": [
> +		$(call make-comma-list,$(sort $($(1)_IGNORE_CVES)))

While I understand the idea of labelling the property "ignored_cves", I
think it makes more sense to have a 1:1 mapping with the package
variable, i.e "ignore_cves".

This is a nitpick: do not resend the full series just for that, we can
fix it when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
