From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Apr 2019 14:46:08 +0200
Subject: [Buildroot] [PATCH 04/10] infra/pkg-download: make the DOWNLOAD
 macro fully parameterised
In-Reply-To: <ab4eea8e4f41632061e7793bb15f1d800821dbe0.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <ab4eea8e4f41632061e7793bb15f1d800821dbe0.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <20190407124608.GN2659@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2019-04-07 13:51 +0200, Yann E. MORIN spake thusly:
> Change the macro to expect the upper-case package name as a
> parameter, rather than expect it from a variable.
[--SNIP--]
>  		$(patsubst %,-u %,$(call DOWNLOAD_URIS,$(1),$(PKG))) \
> +		$(patsubst %,-u %,$(call DOWNLOAD_URIS,$(1),$(2))) \

Of course, there was an incorrect rebase on that one. Fixed locally.

Regards,
Yann E. MORIN.

>  		$(QUIET) \
>  		-- \
> -		$($(PKG)_DL_OPTS)
> +		$($(2)_DL_OPTS)
>  endef
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
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
