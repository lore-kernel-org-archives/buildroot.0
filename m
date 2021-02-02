From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2021 22:29:52 +0100
Subject: [Buildroot] [PATCH v2 6/7] Makefile: add new missing-cpe target
In-Reply-To: <20210131133819.1818537-7-thomas.petazzoni@bootlin.com>
References: <20210131133819.1818537-1-thomas.petazzoni@bootlin.com>
 <20210131133819.1818537-7-thomas.petazzoni@bootlin.com>
Message-ID: <0d90e2c4-cd95-1709-398c-b730c4e6deb8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/01/2021 14:38, Thomas Petazzoni wrote:
> It invokes the recently introduced gen-missing-cpe script.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  Makefile | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 4d334adcd6..962931e0a5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -945,6 +945,14 @@ pkg-stats:
>  		--html $(O)/pkg-stats.html \
>  		--nvd-path $(DL_DIR)/buildroot-nvd
>  
> +.PHONY: missing-cpe
> +missing-cpe:
> +	$(Q)mkdir -p $(O)/cpe-updates
> +	$(Q)cd "$(CONFIG_DIR)" ; \
> +	$(TOPDIR)/support/scripts/gen-missing-cpe \
> +		--nvd-path $(DL_DIR)/buildroot-nvd \
> +		--output $(O)/cpe-updates
> +
>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  
>  # Some subdirectories are also package names. To avoid that "make linux"
> @@ -1163,6 +1171,7 @@ help:
>  	@echo '  legal-info             - generate info about license compliance'
>  	@echo '  show-info              - generate info about packages, as a JSON blurb'
>  	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
> +	@echo '  missing-cpe            - generate XML snippets for missing CPE identifiers'
>  	@echo '  printvars              - dump internal variables selected with VARS=...'
>  	@echo
>  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
> 
