From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 23:33:50 +0200
Subject: [Buildroot] [PATCH 2/4] core/pkg-kconfig: move the kconfig
 fixups to a macro
In-Reply-To: <cdb72fa7204d35b88f2b74e79d4d1117b797712d.1433591404.git.yann.morin.1998@free.fr>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
 <cdb72fa7204d35b88f2b74e79d4d1117b797712d.1433591404.git.yann.morin.1998@free.fr>
Message-ID: <20150612233350.4511dc7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  6 Jun 2015 13:54:24 +0200, Yann E. MORIN wrote:

>  # In order to get a usable, consistent configuration, some fixup may be needed.
>  # The exact rules are specified by the package .mk file.
> -$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
> +define $(1)_FIXUP_KCONFIG
>  	$$($(2)_KCONFIG_FIXUP_CMDS)
>  	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \

We could use $(@D) instead of $$($(2)_DIR) here.

>  		$$($(2)_KCONFIG_OPTS) oldconfig
> -	$$(Q)touch $$@
> +	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done

and here. But that's indeed not very important, since they are the same.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
