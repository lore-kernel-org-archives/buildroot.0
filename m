From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Oct 2016 17:31:01 +0100
Subject: [Buildroot] [PATCH 03/10] docs/manual: document the waf-package
 infra
In-Reply-To: <e41ab5eee8961c89c1fe9c4566383844e36b24f9.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <e41ab5eee8961c89c1fe9c4566383844e36b24f9.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <f3643009-90a7-30fa-94ae-e7bc41c452d5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 30/10/2016 ? 17:02, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  docs/manual/adding-packages-waf.txt | 67 +++++++++++++++++++++++++++++++++++++
>  docs/manual/adding-packages.txt     |  2 ++
>  2 files changed, 69 insertions(+)
>  create mode 100644 docs/manual/adding-packages-waf.txt
> 
> diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
> new file mode 100644
> index 0000000..31c7167
> --- /dev/null
> +++ b/docs/manual/adding-packages-waf.txt
> @@ -0,0 +1,67 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +=== Infrastructure for Waf-based packages
> +
> +[[waf-package-tutorial]]
> +
> +==== +waf-package+ tutorial
> +
> +First, let's see how to write a +.mk+ file for a Waf-based package, with
> +an example :
> +
> +------------------------
> +01: ################################################################################
> +02: #
> +03: # libfoo
> +04: #
> +05: ################################################################################
> +06:
> +07: LIBFOO_VERSION = 1.0
> +08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
> +09: LIBFOO_SITE = http://www.foosoftware.org/download
> +10: LIBFOO_CONF_OPTS = --eanble-bar --disable-baz
> +11: LIBFOO_DEPENDENCIES = bar
> +12:
> +13: $(eval $(waf-package))
> +------------------------
> +
> +On line 7, we declare the version of the package.
> +
> +On line 8 and 9, we declare the name of the tarball (xz-ed tarball
> +recommended) and the location of the tarball on the Web. Buildroot
> +will automatically download the tarball from this location.
> +
> +On line 10, we tell Buildroot what options to enable for libfoo.
> +
> +On line 11, we tell Buildroot the depednencies of libfoo.
> +
> +Finally, on line line 13, we invoke the +waf-package+
> +macro that generates all the Makefile rules that actually allows the
> +package to be built.
> +
> +[[waf-package-reference]]
> +
> +==== +waf-package+ reference
> +
> +The main macro of the Waf package infrastructure is +waf-package+.
> +It is similar to the +generic-package+ macro.
> +
> +Just like the generic infrastructure, the Waf infrastructure works
> +by defining a number of variables before calling the +waf-package+
> +macro.
> +
> +First, all the package metadata information variables that exist in
> +the generic infrastructure also exist in the Waf infrastructure:
> ++LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
> ++LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
> ++LIBFOO_INSTALL_TARGET+.
> +
> +An additional variable, specific to the Waf infrastructure, can
> +also be defined.
> +
> +* +LIBFOO_BUNDLED_WAF+ can be set to +YES+ or +NO+ to tell Buildroot to
> +  use the bundled +waf+ executable. If set to +YES+, the default, then
> +  Buildroot will use the waf executable in the package source tree; if
> +  set to +NO+, then Buidlroot will download and install waf as a
> +  host-tool.
> diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
> index 76f90c9..4595991 100644
> --- a/docs/manual/adding-packages.txt
> +++ b/docs/manual/adding-packages.txt
> @@ -29,6 +29,8 @@ include::adding-packages-kconfig.txt[]
>  
>  include::adding-packages-rebar.txt[]
>  
> +include::adding-packages-waf.txt[]
> +
>  include::adding-packages-kernel-module.txt[]
>  
>  include::adding-packages-asciidoc.txt[]
> 
