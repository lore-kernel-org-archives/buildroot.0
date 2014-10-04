From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 19:13:08 +0200
Subject: [Buildroot] [PATCH 11 of 15] pkg-generic: introduce helper
 function to check for a deprecated variable
In-Reply-To: <61d1ac081581b741bf4e.1411846368@localhost>
References: <patchbomb.1411846357@localhost>
 <61d1ac081581b741bf4e.1411846368@localhost>
Message-ID: <20141004191308.093ab20b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sat, 27 Sep 2014 21:32:48 +0200, Thomas De Schampheleire wrote:

>  ################################################################################
> +# check-deprecated-variable -- throw an error on deprecated variables
> +#
> +# argument 1 is the deprecated variable
> +# argument 2 is the new variable to use
> +#
> +# example:
> +#   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
> +################################################################################
> +define check-deprecated-variable
> +ifneq ($$(origin $(1)),undefined)
> +$$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
> +endif
> +endef

This helper should rather go in pkg-utils.mk. See my comment on PATCH
12 for explanations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
