From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 22:04:28 +0200
Subject: [Buildroot] [PATCH 11/13] help/manual: update help about the
 new $(LIBFOO_DL_DIR)
In-Reply-To: <20170704162211.13238-12-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-12-maxime.hadjinlian@gmail.com>
Message-ID: <c85e84dd-d50b-dd07-c3fe-c6f7c9df6a22@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 18:22, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  Config.in                               | 3 +++
>  docs/manual/adding-packages-generic.txt | 6 +++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 72ceadfde6..0ad43679f3 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -195,6 +195,9 @@ config BR2_DL_DIR
>  	  If the Linux shell environment has defined the BR2_DL_DIR
>  	  environment variable, then this overrides this configuration
>  	  item.
> +	  The directory is organized with a subdirectory for each package.
> +	  Each package has its own $(LIBFOO_DL_DIR) variable that can be used
> +	  to find the correct path.
>  
>  	  The default is $(TOPDIR)/dl
>  
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 12cf1605d6..6e3b503f6b 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -263,7 +263,7 @@ information is (assuming the package name is +libfoo+) :
>    the file using this URL. Otherwise, Buildroot will assume the file
>    to be downloaded is located at +LIBFOO_SITE+. Buildroot will not do
>    anything with those additional files, except download them: it will
> -  be up to the package recipe to use them from +$(DL_DIR)+.
> +  be up to the package recipe to use them from +$(LIBFOO_DL_DIR)+.
>  
>  * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
>    package source code. In many cases, Buildroot guesses the method
> @@ -537,8 +537,8 @@ In the action definitions, you can use the following variables:
>  * +$(@D)+, which contains the directory in which the package source
>    code has been uncompressed.
>  
> -* +$(DL_DIR)+ contains the path to the directory where all the downloads made
> -  by Buildroot are stored.
> +* +$(LIBFOO_DL_DIR)+ contains the path to the directory where all the downloads
> +  made by Buildroot are stored.

 It is no longer all the downloads, it is the downloads of this package.

 Also, we'll need to update docs/manual/download-location.txt. And we'll need to
say something in docs/manual/migrating.txt and a big warning in the changelog to
explain that people have to migrate their download dir. I believe it should be
possible to use the old DL_DIR as a PRIMARY_SITE somehow, so that should be
explained.

 Regards,
 Arnout

>  
>  * +$(TARGET_CC)+, +$(TARGET_LD)+, etc. to get the target
>    cross-compilation utilities
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
