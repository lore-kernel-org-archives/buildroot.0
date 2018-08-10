From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Aug 2018 11:02:30 +0300
Subject: [Buildroot] [PATCH v2] package/sysdig: bump to version 0.22.1
In-Reply-To: <1533887444-29804-1-git-send-email-angelo@amarulasolutions.com>
References: <1533887444-29804-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87zhxuabu1.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

Angelo Compagnucci writes:
> This patch bumps sysdig to version 0.22.1 and adds a new dependency on
> elfutils.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/sysdig/Config.in   | 4 +++-
>  package/sysdig/sysdig.hash | 2 +-
>  package/sysdig/sysdig.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 6ccb706..93d8518 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -4,7 +4,8 @@ config BR2_PACKAGE_SYSDIG
>  	depends on BR2_INSTALL_LIBSTDCPP # libjson
>  	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> -	depends on !BR2_STATIC_LIBS # luajit
> +	depends on BR2_USE_WCHAR # elfutils
> +	depends on !BR2_STATIC_LIBS # luajit, elfutils

The BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC dependency of
elfutils is still missing.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
