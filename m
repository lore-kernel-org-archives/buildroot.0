From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 16:04:42 +0200
Subject: [Buildroot] [PATCH 07/11] package/easybus: temporarily disabled
 with Lua 5.4
In-Reply-To: <20200702202230.1531929-8-francois.perrad@gadz.org>
References: <20200702202230.1531929-1-francois.perrad@gadz.org>
 <20200702202230.1531929-8-francois.perrad@gadz.org>
Message-ID: <20200727160442.41ccbd9f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  2 Jul 2020 22:22:26 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/easydbus/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
> index 1fe8689cc..ae0dbf2b5 100644
> --- a/package/easydbus/Config.in
> +++ b/package/easydbus/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_EASYDBUS
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_USE_MMU # libglib2
> +	depends on !BR2_PACKAGE_LUA_5_4
>  	select BR2_PACKAGE_LIBGLIB2
>  	help
>  	  Easy to use DBus library for Lua.

The Config.in comment also needs to be updated:

comment "easydbus needs a toolchain w/ wchar, threads"
        depends on BR2_USE_MMU
        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

and this is true also for many of your other patches in this series.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
