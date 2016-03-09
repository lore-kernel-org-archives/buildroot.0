From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 00:47:36 +0100
Subject: [Buildroot] [PATCH 6/8] package/uclibc: use the generic help
	rules
In-Reply-To: <39c7d814fe2e6bc45b786d87529a80b3666ac7b0.1457561521.git.yann.morin.1998@free.fr>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <39c7d814fe2e6bc45b786d87529a80b3666ac7b0.1457561521.git.yann.morin.1998@free.fr>
Message-ID: <56E0B618.6090107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 23:22, Yann E. MORIN wrote:
> Note that the uclibc-menuconfig rule was guarded behind
> BR2_TOOLCHAIN_BUILDROOT, which is wrong ince we can build glibc or musl
> toolchains too...
>
> This is de facto fixed by moving the help text to the uClibc package.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   Makefile                 | 3 ---
>   package/uclibc/uclibc.mk | 2 ++
>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index cdf2dac..8973921 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -933,9 +933,6 @@ help:
>   	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
>   	@echo '  <pkg>-rebuild          - Restart the build from the build step'
>   	@$(call HELP_RULE,$(PACKAGE_HELP))
> -ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> -	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
> -endif
>   ifeq ($(BR2_TARGET_BAREBOX),y)
>   	@echo '  barebox-menuconfig     - Run barebox menuconfig'
>   	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 200de04..c685828 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -11,6 +11,8 @@ UCLIBC_LICENSE = LGPLv2.1+
>   UCLIBC_LICENSE_FILES = COPYING.LIB
>   UCLIBC_INSTALL_STAGING = YES
>
> +UCLIBC_HELP = "uclibc-menuconfig : Run uClibc menuconfig"
> +
>   # uclibc is part of the toolchain so disable the toolchain dependency
>   UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
