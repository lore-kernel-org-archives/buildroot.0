From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Mar 2021 21:54:08 +0200
Subject: [Buildroot] [PATCH] package/perl-parse-yapp: remove useless
 dependencies
In-Reply-To: <20210330090026.2049071-1-francois.perrad@gadz.org>
References: <20210330090026.2049071-1-francois.perrad@gadz.org>
Message-ID: <20210330195408.GB24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-03-30 11:00 +0200, Francois Perrad spake thusly:
> Parse-Yapp comes with a Makefile.PL,
> so it is built with the perl core module ExtUtils-MakeMaker
> 
> regenerated with `utils/scancpan -force -host Parse-Yapp`
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/perl-parse-yapp/Config.in            | 2 +-
>  package/perl-parse-yapp/perl-parse-yapp.hash | 5 ++++-
>  package/perl-parse-yapp/perl-parse-yapp.mk   | 2 --
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/perl-parse-yapp/Config.in b/package/perl-parse-yapp/Config.in
> index 5cde3d921..278168267 100644
> --- a/package/perl-parse-yapp/Config.in
> +++ b/package/perl-parse-yapp/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_PERL_PARSE_YAPP
>  	bool "perl-parse-yapp"
>  	help
> -	  A perl frontend to the Parse::Yapp module
> +	  A perl frontend to the Parse::Yapp module.
>  
>  	  https://metacpan.org/release/Parse-Yapp
> diff --git a/package/perl-parse-yapp/perl-parse-yapp.hash b/package/perl-parse-yapp/perl-parse-yapp.hash
> index d5880a2a7..36541592f 100644
> --- a/package/perl-parse-yapp/perl-parse-yapp.hash
> +++ b/package/perl-parse-yapp/perl-parse-yapp.hash
> @@ -1,3 +1,6 @@
> -# locally computed
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5  69584d5b0f0304bb2a23cffcd982c5de  Parse-Yapp-1.21.tar.gz
>  sha256  3810e998308fba2e0f4f26043035032b027ce51ce5c8a52a8b8e340ca65f13e5  Parse-Yapp-1.21.tar.gz
> +
> +# locally computed
>  sha256  a5d97e3ee50ba12b7897841a117790f723795e4a61e5ad1668dc064956c84e96  lib/Parse/Yapp.pm
> diff --git a/package/perl-parse-yapp/perl-parse-yapp.mk b/package/perl-parse-yapp/perl-parse-yapp.mk
> index 94f51243f..12f05efe0 100644
> --- a/package/perl-parse-yapp/perl-parse-yapp.mk
> +++ b/package/perl-parse-yapp/perl-parse-yapp.mk
> @@ -7,11 +7,9 @@
>  PERL_PARSE_YAPP_VERSION = 1.21
>  PERL_PARSE_YAPP_SOURCE = Parse-Yapp-$(PERL_PARSE_YAPP_VERSION).tar.gz
>  PERL_PARSE_YAPP_SITE = $(BR2_CPAN_MIRROR)/authors/id/W/WB/WBRASWELL
> -PERL_PARSE_YAPP_DEPENDENCIES = host-perl-module-build
>  PERL_PARSE_YAPP_LICENSE = Artistic or GPL-1.0+
>  PERL_PARSE_YAPP_LICENSE_FILES = lib/Parse/Yapp.pm
>  PERL_PARSE_YAPP_DISTNAME = Parse-Yapp
> -HOST_PERL_PARSE_YAPP_DEPENDENCIES = host-perl-module-build
>  
>  $(eval $(perl-package))
>  $(eval $(host-perl-package))
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
