From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 20:53:05 +0100
Subject: [Buildroot] [PATCH 08/13] libnfs: new package
In-Reply-To: <6f49fb1679eb12c011edfaf52648c065a049c101.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <6f49fb1679eb12c011edfaf52648c065a049c101.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302212053.06244.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> nfs userspace implementation.
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index ac021e8..a9cb9ed 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -404,6 +404,7 @@ source "package/gamin/Config.in"
>  source "package/libconfig/Config.in"
>  source "package/libconfuse/Config.in"
>  source "package/libfuse/Config.in"
> +source "package/libnfs/Config.in"
>  source "package/liblockfile/Config.in"

Alphabetical order, please.

> diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
> new file mode 100644
> index 0000000..693de46
> --- /dev/null
> +++ b/package/libnfs/libnfs.mk
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +# libnfs
> +#
> +#############################################################
> +
> +LIBNFS_VERSION = libnfs-1.3.0
> +LIBNFS_SITE = http://github.com/sahlberg/libnfs/tarball/$(LIBNFS_VERSION)
> +LIBNFS_INSTALL_STAGING = YES
> +LIBNFS_AUTORECONF = YES
> +LIBNFS_MAKE = $(MAKE1)
> +LIBNFS_LICENSE = LGPLv2.1

It looks like it is in fact LGPLv2.1+.

There's at least one file (lib/init.c) that does not have the 'or later'
clause, but just a terse reference to the license, while all other files
I've looked at explicitly state 'or later'.

So, I'd be enclined to believe it is LGPLv2.1+.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
