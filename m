From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 23:49:10 +0200
Subject: [Buildroot] [PATCH 12 of 15] pkg-generic: add checks on
 deprecated variables FOO_BAR_OPT
In-Reply-To: <27f6b6064904e682eccc.1411846369@localhost>
References: <patchbomb.1411846357@localhost>
 <27f6b6064904e682eccc.1411846369@localhost>
Message-ID: <20140927214910.GI4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-27 21:32 +0200, Thomas De Schampheleire spake thusly:
> This patch introduces a check for the usage of deprecated variable
> FOO_BAR_OPT, and suggests to use FOO_BAR_OPTS instead.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: collapse patches that each add one check
> 
>  package/pkg-generic.mk |  12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -717,6 +717,18 @@
>  	$$(eval $$(call virt-provides-single,$$(pkg),$$(call UPPERCASE,$$(pkg)),$(1))$$(sep)))
>  endif
>  
> +# Ensure unified variable name conventions between all packages
> +$(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
> +$(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
> +$(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
> +$(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
> +$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
> +$(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
> +$(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
> +$(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
> +$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
> +$(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
> +
>  TARGETS += $(1)
>  
>  ifneq ($$($(2)_PERMISSIONS),)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
