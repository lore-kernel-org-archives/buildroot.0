From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 17:21:56 +0200
Subject: [Buildroot] [PATCH v2 08/13] package/minetest: enable sound
 support
In-Reply-To: <20170612205410.20230-8-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-8-romain.naour@gmail.com>
Message-ID: <20170624172156.36a1820f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 22:54:05 +0200, Romain Naour wrote:

> diff --git a/package/minetest/Config.in b/package/minetest/Config.in
> index d0613a2..a15a8f7 100644
> --- a/package/minetest/Config.in
> +++ b/package/minetest/Config.in
> @@ -55,6 +55,14 @@ config BR2_PACKAGE_MINETEST_CLIENT_SERVER
>  
>  endchoice
>  
> +config BR2_PACKAGE_MINETEST_SOUND
> +	bool "enable sound"
> +	depends on BR2_PACKAGE_MINETEST_CLIENT
> +	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal

 -> Config.in comment for this dependency?

> +	select BR2_PACKAGE_LIBVORBIS
> +	select BR2_PACKAGE_OPENAL
> +
>  endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
