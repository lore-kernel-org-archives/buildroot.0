From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 00:47:01 +0100
Subject: [Buildroot] [PATCH 5/8] linux: add the generic help rules
In-Reply-To: <a92e7f048404917f9c9e7ed62c7041af04bf5934.1457561521.git.yann.morin.1998@free.fr>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <a92e7f048404917f9c9e7ed62c7041af04bf5934.1457561521.git.yann.morin.1998@free.fr>
Message-ID: <56E0B5F5.9040109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 23:22, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   Makefile       | 6 ------
>   linux/linux.mk | 6 ++++++
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 8134a14..cdf2dac 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -933,12 +933,6 @@ help:
>   	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
>   	@echo '  <pkg>-rebuild          - Restart the build from the build step'
>   	@$(call HELP_RULE,$(PACKAGE_HELP))
> -ifeq ($(BR2_LINUX_KERNEL),y)
> -	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
> -	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
> -	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
> -	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
> -endif
>   ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>   	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
>   endif
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7e20255..d530d00 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -8,6 +8,12 @@ LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>   LINUX_LICENSE = GPLv2
>   LINUX_LICENSE_FILES = COPYING
>
> +LINUX_HELP = \
> +	"linux-menuconfig : Run Linux kernel menuconfig" \
> +	"linux-savedefconfig : Run Linux kernel savedefconfig" \
> +	"linux-update-defconfig : Save the Linux configuration to the path specified \
> +				  by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE"

  So now this will be printed on a single line, instead of being split like it 
was before. Well, J?r?me's patch already did that as well I guess.

  Fixing that properly would make the HELP_RULE a bit too complicated, but 
starting the continuation line with " :   by..." doesn't look too shabby.

  I was also thinking that a define would have been better, but that doesn't 
work unfortunately.


  Regards,
  Arnout

> +
>   # Compute LINUX_SOURCE and LINUX_SITE from the configuration
>   ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
>   LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
