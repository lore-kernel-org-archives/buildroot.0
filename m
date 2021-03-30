From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Mar 2021 21:56:27 +0200
Subject: [Buildroot] [PATCH] package/pkg-kconfig: fix error string
In-Reply-To: <20210329224154.3716438-1-giulio.benetti@benettiengineering.com>
References: <20210329224154.3716438-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210330195627.GC24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2021-03-30 00:41 +0200, Giulio Benetti spake thusly:
> Current error string speaks only about "fragment" but here we also deal
> with Kconfig files, so let's add "file or fragment" instead of "fragment".
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-kconfig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 2aecf2e203..dd727b7200 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -117,7 +117,7 @@ $(2)_KCONFIG_STAMP_DOTCONFIG = .stamp_dotconfig
>  $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
>  	for f in $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES); do \
>  		if [ ! -f "$$$${f}" ]; then \
> -			printf "Kconfig fragment '%s' for '%s' does not exist\n" "$$$${f}" "$(1)"; \
> +			printf "Kconfig file or fragment '%s' for '%s' does not exist\n" "$$$${f}" "$(1)"; \
>  			exit 1; \
>  		fi; \
>  	done
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
