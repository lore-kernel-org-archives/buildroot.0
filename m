From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Jul 2014 20:46:07 -0300
Subject: [Buildroot] [PATCH 1/5 v2] pkg-autotools: add support to
	gettextize a package
In-Reply-To: <0408fc7f5abc9973f99ef3afffab4b88aab32a28.1405463657.git.yann.morin.1998@free.fr>
References: <cover.1405463657.git.yann.morin.1998@free.fr>
 <0408fc7f5abc9973f99ef3afffab4b88aab32a28.1405463657.git.yann.morin.1998@free.fr>
Message-ID: <53C5BD3F.8050003@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/2014 07:37 PM, Yann E. MORIN wrote:

Hi, a couple of late-night fixes:

> +ifndef $(2)_GETTEXTIZE
> + ifdef $(3)_GETTEXTIZE
> +  $(2)_GETTEXTIZE = $($(3)_GETTEXTIZE)

$(2)_GETTEXTIZE = $$($(3)_GETTEXTIZE)

> +ifndef $(2)_GETTEXTIZE_OPT
> + ifdef $(3)_GETTEXTIZE_OPT
> +  $(2)_GETTEXTIZE_OPT = $($(3)_GETTEXTIZE)

$(2)_GETTEXTIZE_OPT = $$($(3)_GETTEXTIZE_OPT)

>  ifeq ($$($(2)_AUTORECONF),YES)
> +# This has to come before autoreconf
> +ifeq ($$($(2)_GETTEXTIZE),YES)
> +$(2)_PRE_CONFIGURE_HOOK += GETTEXTIZE_HOOK

$(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK

Regards.
