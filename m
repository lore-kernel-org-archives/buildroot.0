From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Dec 2018 22:02:55 +0100
Subject: [Buildroot] [PATCH] package/waf: purge trailig '/' from WAF_SITE
In-Reply-To: <20181210184559.13181-1-casantos@datacom.com.br>
References: <20181210184559.13181-1-casantos@datacom.com.br>
Message-ID: <a106d20f-ed22-dad7-b955-f92f8c43f230@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/12/2018 19:45, Carlos Santos wrote:
> <PKG>_SITE cannot have a trailing slash.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

 Committed to master after fixing the type in the commit title and adding an
explanation why this wasn't detected by the check in generic-package.

 Regards,
 Arnout

> ---
>  package/waf/waf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/waf/waf.mk b/package/waf/waf.mk
> index cb738a38fd..97bc2a8963 100644
> --- a/package/waf/waf.mk
> +++ b/package/waf/waf.mk
> @@ -6,7 +6,7 @@
>  
>  WAF_VERSION = 1.9.5
>  WAF_SOURCE = waf-$(WAF_VERSION)
> -WAF_SITE = https://waf.io/
> +WAF_SITE = https://waf.io
>  
>  define HOST_WAF_EXTRACT_CMDS
>  	$(INSTALL) -D -m 0755 $(HOST_WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
> 
