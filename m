From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 22:41:50 +0100
Subject: [Buildroot] [PATCH] package/sngrep: add missing ncurses
 dependencies
In-Reply-To: <20170218154333.24496-1-romain.naour@gmail.com>
References: <20170218154333.24496-1-romain.naour@gmail.com>
Message-ID: <20170221224150.6fa10b18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 16:43:33 +0100, Romain Naour wrote:

> diff --git a/package/sngrep/Config.in b/package/sngrep/Config.in
> index 4d0d80c..70d2354 100644
> --- a/package/sngrep/Config.in
> +++ b/package/sngrep/Config.in
> @@ -5,6 +5,8 @@ config BR2_PACKAGE_SNGREP
>  	bool "sngrep"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_NCURSES_TARGET_PANEL
> +	select BR2_PACKAGE_NCURSES_TARGET_FORM
>  	select BR2_PACKAGE_LIBPCAP

While I agree that this fixes the build, I don't think it's the right
fix. Indeed, the ncurses package is badly broken, as it installs some
libraries in staging, but not in target.

I have therefore sent a patch fixing ncurses instead:

  http://patchwork.ozlabs.org/patch/730793/

Let me know what you think about it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
