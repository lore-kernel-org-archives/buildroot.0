From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 17:59:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-kconfig: define
 KCONFIG_EDITORS_MAKE_ENV
In-Reply-To: <1435848100-5762-1-git-send-email-talz@ezchip.com>
References: <1435848100-5762-1-git-send-email-talz@ezchip.com>
Message-ID: <20150702175937.4733d060@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tal Zilcer,

On Thu, 2 Jul 2015 17:41:40 +0300, Tal Zilcer wrote:

>  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
>  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
> -	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> +	$$($(2)_KCONFIG_EDITORS_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \

I actually don't think adding a KCONFIG_EDITORS_MAKE_ENV variable is
really useful here. Since it's a bunch of host tools, maybe we should
just:

	$$(HOST_MAKE_ENV) $$(MAKE) -C ...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
