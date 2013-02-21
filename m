From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 21:01:24 +0100
Subject: [Buildroot] [PATCH 09/13] libplist: new package
In-Reply-To: <28cc50d3bae240e6956876b657cafabc7f2187b0.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <28cc50d3bae240e6956876b657cafabc7f2187b0.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302212101.24646.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> LIBPLIST is a client for manipulating Apple Property List (.plist) files
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index a9cb9ed..382d859 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -559,6 +559,7 @@ source "package/gsl/Config.in"
>  source "package/libglib2/Config.in"
>  source "package/libical/Config.in"
>  source "package/lockdev/Config.in"
> +source "package/libplist/Config.in"
>  source "package/libnspr/Config.in"

Alphabetical order, please.

[--SNIP--]
> diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
> new file mode 100644
> index 0000000..16ea5ff
> --- /dev/null
> +++ b/package/libplist/libplist.mk
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# libplist
> +#
> +#############################################################
> +
> +LIBPLIST_VERSION = 1.6
> +LIBPLIST_SITE = http://cgit.sukimashita.com/libplist.git/snapshot
> +LIBPLIST_DEPENDENCIES = libxml2
> +LIBPLIST_INSTALL_STAGING = YES
> +LIBPLIST_MAKE = $(MAKE1)
> +LIBPLIST_LICENSE = GPLv2

Although both COPYING and COPYING.LESSER are present, there's no file I
could find under the GPLv2. They all refer to the LGPLv2.1+.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
