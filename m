From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 15:04:38 +0100
Subject: [Buildroot] [PATCH 2/2] package/perl-db-file: Berkeley DB 1.85
 compatibility API is not needed
In-Reply-To: <1449355343-19014-2-git-send-email-bernd.kuhls@t-online.de>
References: <1449355343-19014-1-git-send-email-bernd.kuhls@t-online.de>
 <1449355343-19014-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151220150438.2c6a94b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  5 Dec 2015 23:42:23 +0100, Bernd Kuhls wrote:
> This package is also compatible with Berkeley DB v2 or higher:
> https://metacpan.org/source/PMQS/DB_File-1.835/Changes
> 
> 1.50
>     DB_File can now build with either DB 1.x or 2.x, but not both at
>     the same time.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/perl-db-file/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/perl-db-file/Config.in b/package/perl-db-file/Config.in
> index 37bc5da..cf6cb72 100644
> --- a/package/perl-db-file/Config.in
> +++ b/package/perl-db-file/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PERL_DB_FILE
>  	bool "perl-db-file"
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_BERKELEYDB
> -	select BR2_PACKAGE_BERKELEYDB_COMPAT185
>  	help
>  	  Perl5 access to Berkeley DB version 1.x

The Config.in help text needed some update, since it now works with
Berkeley DB 2.x. I've adjusted that and applied.

Fran?ois, don't hesitate to have a look and give a comment if there is
any issue with this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
