From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 08 Nov 2013 01:38:36 +0100
Subject: [Buildroot] [PATCH] log4cplus: new package
In-Reply-To: <1383859648-13759-1-git-send-email-ps.report@gmx.net>
References: <1383859648-13759-1-git-send-email-ps.report@gmx.net>
Message-ID: <527C328C.7010006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/13 22:27, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/Config.in              |  1 +
>   package/log4cplus/Config.in    | 15 +++++++++++++++
>   package/log4cplus/log4cplus.mk | 14 ++++++++++++++
>   3 files changed, 30 insertions(+)
>   create mode 100644 package/log4cplus/Config.in
>   create mode 100644 package/log4cplus/log4cplus.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index c0a3f20..7c0eb94 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -706,6 +706,7 @@ source "package/libtpl/Config.in"
>   source "package/libunwind/Config.in"
>   source "package/liburcu/Config.in"
>   source "package/linux-pam/Config.in"
> +source "package/log4cplus/Config.in"
>   source "package/log4cxx/Config.in"

  Does log4cplus replace log4cxx? The API looks a bit similar at first sight.


  Regards,
  Arnout

>   source "package/lttng-libust/Config.in"
>   source "package/mpc/Config.in"
> diff --git a/package/log4cplus/Config.in b/package/log4cplus/Config.in
> new file mode 100644
> index 0000000..8a112a4
> --- /dev/null
> +++ b/package/log4cplus/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LOG4CPLUS
> +	bool "log4cplus"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  log4cplus is a simple to use C++ logging API providing
> +	  thread-safe, flexible, and arbitrarily granular control
> +	  over log management and configuration. It is modelled
> +	  after the Java log4j API.
> +
> +	  http://sourceforge.net/projects/log4cplus
> +
> +comment "log4cplus needs a toolchain w/ C++, wchar, threads"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
> diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
> new file mode 100644
> index 0000000..292fa66
> --- /dev/null
> +++ b/package/log4cplus/log4cplus.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# log4cplus
> +#
> +################################################################################
> +
> +LOG4CPLUS_VERSION = 1.1.2
> +LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
> +LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
> +LOG4CPLUS_LICENSE = Apache-2.0
> +LOG4CPLUS_LICENSE_FILES = LICENSE
> +LOG4CPLUS_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
