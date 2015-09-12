From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 12 Sep 2015 10:52:20 +0100
Subject: [Buildroot] [PATCH 2/3] lttng-libust: bump version to 2.6.2 and
 enable aarch64 build
In-Reply-To: <1442009293-4289-2-git-send-email-benjamin.h.shelton@intel.com>
References: <1442009293-4289-1-git-send-email-benjamin.h.shelton@intel.com>
 <1442009293-4289-2-git-send-email-benjamin.h.shelton@intel.com>
Message-ID: <55F3F5D4.70707@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ben Shelton,

same comment again. "Bumping the version" and "adding support for a new 
architecture" should be separate patches, IMHO.

Regards,

Vincent.

On 11/09/15 23:08, Ben Shelton wrote:
> Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
> ---
>   package/lttng-libust/Config.in         | 4 ++--
>   package/lttng-libust/lttng-libust.hash | 4 ++--
>   package/lttng-libust/lttng-libust.mk   | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
> index 1c26843..3c26055 100644
> --- a/package/lttng-libust/Config.in
> +++ b/package/lttng-libust/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
>   	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>   	depends on BR2_USE_WCHAR # util-linux
>   	# liburcu only works on some architectures and requires threads support"
> -	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
> +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_STATIC_LIBS
> @@ -18,7 +18,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
>   	  http://lttng.org
>
>   comment "lttng-libust needs a toolchain w/ dynamic library, wchar, threads"
> -	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
> +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
>
> diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
> index 65db612..aafc2ba 100644
> --- a/package/lttng-libust/lttng-libust.hash
> +++ b/package/lttng-libust/lttng-libust.hash
> @@ -1,2 +1,2 @@
> -# http://www.lttng.org/files/lttng-ust/lttng-ust-2.6.0.tar.bz2.sha1
> -sha1  774fc2052781ba6fd789d422223c739d5f64482d  lttng-ust-2.6.0.tar.bz2
> +# http://www.lttng.org/files/lttng-ust/lttng-ust-2.6.2.tar.bz2.sha1
> +sha1  bfa9cbdabd8698cf5b98667eac5c39775127f634  lttng-ust-2.6.2.tar.bz2
> diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
> index 2afcd61..4976ff4 100644
> --- a/package/lttng-libust/lttng-libust.mk
> +++ b/package/lttng-libust/lttng-libust.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>
>   LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
> -LTTNG_LIBUST_VERSION = 2.6.0
> +LTTNG_LIBUST_VERSION = 2.6.2
>   LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
>   LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
>   LTTNG_LIBUST_LICENSE_FILES = COPYING
>
