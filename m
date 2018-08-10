From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 13:57:55 +0200
Subject: [Buildroot] [PATCH v3] package/sysdig: bump to version 0.22.1
In-Reply-To: <1533888631-7613-1-git-send-email-angelo@amarulasolutions.com>
References: <1533888631-7613-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180810135755.121222b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 10:10:31 +0200, Angelo Compagnucci wrote:
> This patch bumps sysdig to version 0.22.1, adds a new dependency on
> elfutils and adds hash for the license file.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/sysdig/Config.in   | 5 ++++-
>  package/sysdig/sysdig.hash | 5 +++--
>  package/sysdig/sysdig.mk   | 4 ++--
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 6ccb706..f87b5dd 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -4,7 +4,9 @@ config BR2_PACKAGE_SYSDIG
>  	depends on BR2_INSTALL_LIBSTDCPP # libjson
>  	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> -	depends on !BR2_STATIC_LIBS # luajit
> +	depends on !BR2_STATIC_LIBS # luajit, elfutils
> +	depends on BR2_USE_WCHAR # elfutils
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils

When you add dependencies, the Config.in comment mentioning the
dependencies should be updated as well.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
