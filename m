From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 20:07:02 +0200
Subject: [Buildroot] [PATCH v2] radlib: new package
In-Reply-To: <1459194027.3607.13.camel@intel.com>
References: <1459194027.3607.13.camel@intel.com>
Message-ID: <20160329200702.01fc66d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please use git send-email to send your patches. Due to not using git
send-email, your e-mail is badly line-wrapped and cannot be applied,
and even less reviewed nicely.

On Mon, 28 Mar 2016 19:40:27 +0000, Kinsella, Ray wrote:
> Delta's from v1:-
> 
>  * Complete rework of patch for the package's autotools implementation
>   * Removed references to prefix.
>   * Reworked database support to use PKG_CHECK_MODULES and
> AC_PATH_PROG.
>   * Used '--with--somedb' to indicate which database backend to build
> with. (The radlib build ends up with conflicting symbols if more than
> one is enabled at the same time, we prevent this in the package's .mk).
>  * Complete rework of the Kconfig.
>   * Database support is only enabled when BR2_PACKAGE_(mysql, sqlite or
> postgresql) are set.
>   * Database backend is selected by 'choice' when more than one is
> enabled. 
>  * Other tidy up's recommended for the v1 patch. 
>   * Included a comment on radlib.hash.
>   * Added signed off line and description to the patch.
>   * Removed no_sync from mysql.
>   * etc.

This should go below the "---" sign.

> 
> radlib is a rapid application development library for unix
> multi-process applications. It uses SYS V IPC facilities and
> FIFOs to provide an RTOS-like, event-driven, distributed
> framework. Processes may be run as daemons or have a controlling
> terminal.
> 
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
>  package/Config.in                                  |   1 +
>  ...0001-Update-to-autoconf-to-use-pkg-config.patch | 388
> +++++++++++++++++++++

This is a fairly large patch. Have you submitted it upstream?


> diff --git a/package/radlib/0001-Update-to-autoconf-to-use-pkg
> -config.patch b/package/radlib/0001-Update-to-autoconf-to-use-pkg
> -config.patch
> new file mode 100644
> index 0000000..f98b9d5
> --- /dev/null
> +++ b/package/radlib/0001-Update-to-autoconf-to-use-pkg-config.patch
> @@ -0,0 +1,388 @@
> +From d4c1b74a6624da7cc217c6b1aef59dc60b7d20c0 Mon Sep 17 00:00:00 2001
> +From: Ray Kinsella <ray.kinsella@intel.com>
> +Date: Sun, 27 Mar 2016 16:38:16 +0100
> +Subject: [PATCH] Update to autoconf to use pkg-config
> +
> +Updates to autoconf as follows;
> +
> + * Use pkg-config for postgresql and sqlite
> + * Use mysql-config for mysql
> + * Also removed unecessary conditionals from sub-makefiles

So you're doing three different things. Which calls for three different
patches.

I'll do a full review once you send it with git send-email, because the
line wrapping makes it really hard to follow.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
