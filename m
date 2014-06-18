From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Jun 2014 22:33:53 +0200
Subject: [Buildroot] [v2 2/2] perl-mojolicious: new package
In-Reply-To: <1402947357-6359-3-git-send-email-francois.perrad@gadz.org>
References: <1402947357-6359-1-git-send-email-francois.perrad@gadz.org>
 <1402947357-6359-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <53A1F7B1.9060104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/06/14 21:35, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                            |  1 +
>  package/perl-mojolicious/Config.in           |  6 ++++++
>  package/perl-mojolicious/perl-mojolicious.mk | 13 +++++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/perl-mojolicious/Config.in
>  create mode 100644 package/perl-mojolicious/perl-mojolicious.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f43e985..5e16ffa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -423,6 +423,7 @@ endif
>  	source "package/perl/Config.in"
>  if BR2_PACKAGE_PERL
>  menu "Perl libraries/modules"
> +source "package/perl-mojolicious/Config.in"
>  endmenu
>  endif
>  	source "package/php/Config.in"
> diff --git a/package/perl-mojolicious/Config.in b/package/perl-mojolicious/Config.in
> new file mode 100644
> index 0000000..766d109
> --- /dev/null
> +++ b/package/perl-mojolicious/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PERL_MOJOLICIOUS
> +	bool "perl-mojolicious"
> +	help
> +	  Real-time web framework
> +
> +	  http://mojolicio.us
> diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
> new file mode 100644
> index 0000000..e4ced7e
> --- /dev/null
> +++ b/package/perl-mojolicious/perl-mojolicious.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# perl-mojolicious
> +#
> +################################################################################
> +
> +PERL_MOJOLICIOUS_VERSION = 5.07
> +PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
> +PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI/
> +PERL_MOJOLICIOUS_DEPENDENCIES = perl 

 There's still trailing whitespace here.

> +PERL_MOJOLICIOUS_LICENSE = artistic_2

 artistic_2 is not in our list of licenses, and is also not a format that we
would typically use.  We already have pv with Artistic-2.0, which is also what
is used by spdx.

 Regards,
 Arnout

> +
> +$(eval $(perl-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
