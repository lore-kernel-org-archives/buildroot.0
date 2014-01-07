From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jan 2014 20:10:21 +0100
Subject: [Buildroot] [PATCH] Makefile: support running graph-depends
	from out-of-tree
In-Reply-To: <1389119273-18621-1-git-send-email-yann.morin.1998@free.fr>
References: <1389119273-18621-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140107191021.GB31819@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-01-07 19:27 +0100, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile               | 3 ++-
>  package/pkg-generic.mk | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4320e7b..dd21133 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -647,7 +647,8 @@ graph-build: $(O)/build/build-time.log
>  
>  graph-depends:
>  	@$(INSTALL) -d $(O)/graphs
> -	@./support/scripts/graph-depends \
> +	@cd "$(CONFIG_DIR)"; \
> +	$(TOPDIR)/support/scripts/graph-depends \
>  	|dot -T$(BR2_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR2_GRAPH_OUT)
>  
>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b519d69..279303e 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -470,7 +470,8 @@ $(1)-show-depends:
>  
>  $(1)-graph-depends:
>  			@$(INSTALL) -d $(O)/graphs
> -			@./support/scripts/graph-depends $(1) \
> +			@cd "$(CONFIG_DIR))"; \

Doh, I forgot to commit the fix for the double-) before submitting... :-(

> +			$(TOPDIR)/support/scripts/graph-depends $(1) \
>  			|dot -T$(BR2_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR2_GRAPH_OUT)
>  
>  $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
> -- 
> 1.8.1.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
