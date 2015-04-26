From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:09:22 +0200
Subject: [Buildroot] [PATCH v2 2/6] package/perl-encode-detect: new
 package
In-Reply-To: <1430041039-13905-2-git-send-email-bernd.kuhls@t-online.de>
References: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
 <1430041039-13905-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426120922.229faa20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 11:37:15 +0200, Bernd Kuhls wrote:

> diff --git a/package/perl-encode-detect/Config.in b/package/perl-encode-detect/Config.in
> new file mode 100644
> index 0000000..049eae0
> --- /dev/null
> +++ b/package/perl-encode-detect/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PERL_ENCODE_DETECT
> +	bool "perl-encode-detect"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  An Encode::Encoding subclass that detects the encoding of data

Line slightly too long, and should end with a '.'.

> new file mode 100644
> index 0000000..53b882b
> --- /dev/null
> +++ b/package/perl-encode-detect/perl-encode-detect.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# perl-encode-detect
> +#
> +################################################################################
> +
> +PERL_ENCODE_DETECT_VERSION = 1.01
> +PERL_ENCODE_DETECT_SOURCE = Encode-Detect-$(PERL_ENCODE_DETECT_VERSION).tar.gz
> +PERL_ENCODE_DETECT_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JG/JGMYERS
> +PERL_ENCODE_DETECT_DEPENDENCIES = perl host-perl-module-build
> +PERL_ENCODE_DETECT_LICENSE = open_source

open_source is not really a good license description. The license is
really MPL-1.1.

Applied with those two issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
