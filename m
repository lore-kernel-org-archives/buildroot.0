From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Apr 2019 11:08:43 +0200
Subject: [Buildroot] [PATCH 04/12 v2] infra/pkg-download: make the
 DOWNLOAD macro fully parameterised
In-Reply-To: <d937e062549e9bce6658f98a5c06e663e4f5cdd2.1555273025.git.yann.morin.1998@free.fr>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
 <d937e062549e9bce6658f98a5c06e663e4f5cdd2.1555273025.git.yann.morin.1998@free.fr>
Message-ID: <bc74daf9-0a18-48aa-d60e-16f1371c7451@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/04/2019 22:17, Yann E. MORIN wrote:
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a83813e28d..f78ff2e665 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -149,7 +149,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>  			break ; \
>  		fi ; \
>  	done
> -	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
> +	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
>  	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  	$(Q)mkdir -p $(@D)
>  	@$(call step_end,download)

 Maybe this is the thing you forgot to amend, but: the DOWNLOAD macro is also
used a couple of lines lower for the actual_source.

 Regards,
 Arnout
