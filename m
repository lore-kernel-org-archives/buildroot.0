From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:54:20 +0200
Subject: [Buildroot] [PATCH 3/5] perl-gd: new package
In-Reply-To: <1405614782-3667-3-git-send-email-francois.perrad@gadz.org>
References: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
 <1405614782-3667-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140717205420.5db04ce1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 17 Jul 2014 18:33:00 +0200, Francois Perrad wrote:

> diff --git a/package/perl-gd/perl-gd-01-getoptions.patch b/package/perl-gd/perl-gd-01-getoptions.patch
> new file mode 100644
> index 0000000..a65e40d
> --- /dev/null
> +++ b/package/perl-gd/perl-gd-01-getoptions.patch
> @@ -0,0 +1,39 @@
> +fix option handling in Makefile.PL
> +the call to GetOptions() must be unique.

Please format the patch description as a git commit description: one
line for the summary, then one empty new line, and then more details.

And also, your SoB line.


> diff --git a/package/perl-gd/perl-gd-02-lgd.patch b/package/perl-gd/perl-gd-02-lgd.patch
> new file mode 100644
> index 0000000..1c8fe7b
> --- /dev/null
> +++ b/package/perl-gd/perl-gd-02-lgd.patch
> @@ -0,0 +1,25 @@
> +refactor -lgd in @LIBS

Ditto. The description is also a bit short...

> diff --git a/package/perl-gd/perl-gd-03-force.patch b/package/perl-gd/perl-gd-03-force.patch
> new file mode 100644
> index 0000000..908226b
> --- /dev/null
> +++ b/package/perl-gd/perl-gd-03-force.patch
> @@ -0,0 +1,29 @@
> +let @INC and @LIBPATH empty when ignore_missing_gd

Same.

> diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
> new file mode 100644
> index 0000000..abca8c9
> --- /dev/null
> +++ b/package/perl-gd/perl-gd.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# perl-gd
> +#
> +################################################################################
> +
> +PERL_GD_VERSION = 2.53
> +PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
> +PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS/
> +PERL_GD_DEPENDENCIES = perl zlib libpng freetype gd

No license / license file?

> +
> +PERL_GD_CONF_OPT = \
> +	-options=FT,PNG \
> +	-lib_gd_path=$(STAGING_DIR)/usr \
> +	-lib_ft_path=$(STAGING_DIR)/usr \
> +	-lib_png_path=$(STAGING_DIR)/usr \
> +	-lib_zlib_path=$(STAGING_DIR)/usr \
> +	-ignore_missing_gd
> +
> +$(eval $(perl-package))

Other than that, looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
