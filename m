From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 22:44:48 +0200
Subject: [Buildroot] [PATCH 05/18] perl-x10: new package
In-Reply-To: <20180820115519.24046-6-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-6-chrismcc@gmail.com>
Message-ID: <20180912224448.6d7f28ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

On Mon, 20 Aug 2018 04:55:06 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/perl-x10/Config.in     | 13 +++++++++++++
>  package/perl-x10/perl-x10.hash |  6 ++++++
>  package/perl-x10/perl-x10.mk   | 14 ++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/perl-x10/Config.in
>  create mode 100644 package/perl-x10/perl-x10.hash
>  create mode 100644 package/perl-x10/perl-x10.mk

I have applied your patch, but I have a few questions. I have also
added Fran?ois in Cc, he can probably help.

> diff --git a/package/perl-x10/Config.in b/package/perl-x10/Config.in
> new file mode 100644
> index 0000000000..984a561b05
> --- /dev/null
> +++ b/package/perl-x10/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PERL_X10
> +	bool "perl-x10"
> +	depends on !BR2_STATIC_LIBS

Why do we have this dependency ? It seems to be a pure Perl module,
what makes it require dynamic library support ?

> +PERL_X10_VERSION = 0.04
> +PERL_X10_SOURCE = X10-$(PERL_X10_VERSION).tar.gz
> +PERL_X10_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
> +PERL_X10_DEPENDENCIES = perl-astro-suntime perl-device-serialport perl-time-parsedate

Are these really build-time dependencies ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
