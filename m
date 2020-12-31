From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 15:36:58 +0100
Subject: [Buildroot] [PATCH v2] package/mono: bump to version 6.12.0.90
In-Reply-To: <20201214210516.965032-1-angelo@amarulasolutions.com>
References: <20201214210516.965032-1-angelo@amarulasolutions.com>
Message-ID: <20201231153658.33231b4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Mon, 14 Dec 2020 22:05:16 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index 0d555bfa82..93cac60d78 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -15,6 +15,8 @@ config BR2_PACKAGE_MONO
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS

You had forgotten to propagate this new dependency to the Config.in
comment. But instead of doing this, I've moved this dependency inside
BR2_PACKAGE_MONO_ARCH_SUPPORTS, so that it applies to both the
BR2_PACKAGE_MONO option and the Config.in comment.

I've applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
