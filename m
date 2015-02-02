From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Feb 2015 10:11:29 +0100
Subject: [Buildroot] [RFC 2/8] pkg-kconfig: extend per-package help text
 with kconfig targets
In-Reply-To: <1422394913-13257-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1422394913-13257-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150202091129.GB4918@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Al,,

On 2015-01-27 22:41 +0100, Thomas Petazzoni spake thusly:
> This commit makes the kconfig-package infrastructure use the
> $(2)_HELP_HOOKS mechanism to extend the per-package help text with the
> specific kconfig targets. These targets allow to run *config editors,
> and perform other configuration related actions.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-kconfig.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index ec58d69..7e7b776 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -36,6 +36,14 @@ $(2)_KCONFIG_EDITORS ?= menuconfig
>  $(2)_KCONFIG_OPTS ?=
>  $(2)_KCONFIG_FIXUP_CMDS ?=
>  
> +define $(2)_KCONFIG_PACKAGE_HELP
> +	$$(foreach editor,$$($(2)_KCONFIG_EDITORS),\
> +            @$(call pkg-print-help-opt,$(1)-$$(editor),"Run the $$(editor) configuration tool")$(sep))
> +	@$(call pkg-print-help-opt,$(1)-update-config,"Update configuration")
> +endef
> +
> +$(2)_HELP_HOOKS += $(2)_KCONFIG_PACKAGE_HELP
> +
>  # FOO_KCONFIG_FILE is required
>  ifndef $(2)_KCONFIG_FILE
>  $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
