From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Apr 2018 16:15:41 +0200
Subject: [Buildroot] [v3 11/13] help/manual: update help about the new
 $(LIBFOO_DL_DIR)
In-Reply-To: <20180331142407.9522-11-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
 <20180331142407.9522-11-maxime.hadjinlian@gmail.com>
Message-ID: <20180401141541.GF2613@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2018-03-31 16:24 +0200, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  Config.in                               | 3 +++
>  docs/manual/adding-packages-generic.txt | 6 +++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index a74b24ae45..55b6e5e2a1 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -200,6 +200,9 @@ config BR2_DL_DIR
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
> index 9d1428ad40..a7578a782d 100644
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
> @@ -554,8 +554,8 @@ In the action definitions, you can use the following variables:
>  * +$(@D)+, which contains the directory in which the package source
>    code has been uncompressed.
>  
> -* +$(DL_DIR)+ contains the path to the directory where all the downloads made
> -  by Buildroot are stored.
> +* +$(LIBFOO_DL_DIR)+ contains the path to the directory where all the downloads
> +  made by Buildroot are stored.

... where all the downloads made by Buildroot for +libfoo+ are stored in.

Regards,
Yann E. MORIN.

>  * +$(TARGET_CC)+, +$(TARGET_LD)+, etc. to get the target
>    cross-compilation utilities
> -- 
> 2.16.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
