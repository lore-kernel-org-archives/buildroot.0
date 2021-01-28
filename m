From: Antoine Tenart <atenart@kernel.org>
Date: Thu, 28 Jan 2021 15:24:25 +0100
Subject: [Buildroot] [PATCH v2] package/refpolicy: Add option to disable
 "dontaudit" rules
In-Reply-To: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
References: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
Message-ID: <161184386534.5198.15461432493524413541@kwain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Maxime Chevallier (2021-01-28 13:52:56)
> --- a/package/refpolicy/refpolicy.mk
> +++ b/package/refpolicy/refpolicy.mk
> @@ -116,6 +116,14 @@ define REFPOLICY_BUILD_CMDS
>         $(REFPOLICY_MAKE) -C $(@D) policy
>  endef
>  
> +ifeq ($(BR2_REFPOLICY_DISABLE_DONTAUDIT),y)
> +define REFPOLICY_DISABLE_DONTAUDIT_CMDS
> +       $(REFPOLICY_MAKE) -C $(@D) enableaudit
> +endef
> +endif
> +
> +REFPOLICY_POST_BUILD_HOOKS += REFPOLICY_DISABLE_DONTAUDIT_CMDS

I think this could be in the ifeq block as well.

Otherwise, LGTM.

Thanks!
Antoine
