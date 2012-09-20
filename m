From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 21:57:27 +0200
Subject: [Buildroot] [PATCH 03/13] perl: add DB_File
In-Reply-To: <1347107325-4163-3-git-send-email-francois.perrad@gadz.org>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120920215727.0159e781@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  8 Sep 2012 14:28:35 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/Config.in |    6 ++++++
>  package/perl/perl.mk   |    5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/perl/Config.in b/package/perl/Config.in
> index 1f044eb..9df487a 100644
> --- a/package/perl/Config.in
> +++ b/package/perl/Config.in
> @@ -20,4 +20,10 @@ config BR2_PACKAGE_PERL_ONLY_MINIPERL
>  	  Install only miniperl (without dynamic module loader)
>  	  Usually used to bootstrap a full Perl (@INC contains only .).
>  
> +config BR2_PACKAGE_PERL_DB_FILE
> +	bool "DB_File"
> +	select BR2_PACKAGE_BERKELEYDB
> +	help
> +	  Build the DB_File module.
> +
>  endif
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index b00116f..2225f0c 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -12,6 +12,11 @@ PERL_LICENSE = Artistic
>  PERL_LICENSE_FILES = Artistic
>  PERL_INSTALL_STAGING = YES
>  
> +ifdef BR2_PACKAGE_PERL_DB_FILE

ifeq ($(BR2_PACKAGE_PERL_DB_FILE),y)

> +    PERL_DEPENDENCIES += berkeleydb
> +endif
> +HOST_PERL_DEPENDENCIES =
> +
>  ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
>      PERL_USE_DEVEL=-Dusedevel
>  endif

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
