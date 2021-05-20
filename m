From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 09:19:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20210520064729.154411-1-fontaine.fabrice@gmail.com>
References: <20210520064729.154411-1-fontaine.fabrice@gmail.com>
Message-ID: <20210520071959.GV2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-20 08:47 +0200, Fabrice Fontaine spake thusly:
> libraw needs __sync_fetch_and_add since version 0.20.0 and
> https://github.com/LibRaw/LibRaw/commit/d1975cb0e055d2bfe58c9d845c9a3e57c346a2f9
> 
> This will fix the following build failure with imagemagick which is
> raised since commit 2f47cfade4b298350d056f6d9a7525b837e2ba23:
> 
> /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libraw_r.so: undefined reference to `__sync_fetch_and_add_4'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/900df43bd418d2da0c3ec875db1c5564dd857e94
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/efl/Config.in    | 1 +
>  package/libraw/Config.in | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 305d1469a7..05ded72cf7 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -258,6 +258,7 @@ config BR2_PACKAGE_EFL_WEBP
>  
>  config BR2_PACKAGE_EFL_LIBRAW
>  	bool "libraw loader"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libraw
>  	select BR2_PACKAGE_LIBRAW
>  	help
>  	  This option enables the Evas generic Libraw loader
> diff --git a/package/libraw/Config.in b/package/libraw/Config.in
> index de763cd36a..631123c2d3 100644
> --- a/package/libraw/Config.in
> +++ b/package/libraw/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBRAW
>  	bool "libraw"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	help
>  	  libraw is a raw image manipulation library
> @@ -7,4 +8,5 @@ config BR2_PACKAGE_LIBRAW
>  	  http://www.libraw.org/
>  
>  comment "libraw needs a toolchain w/ C++"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.30.2
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
