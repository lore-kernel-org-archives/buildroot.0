From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 16 Dec 2009 14:35:16 -0500
Subject: [Buildroot] [git commit master] defconfigs: use new default
	location for STAGING_DIR
In-Reply-To: <20091216190433.314B077792@busybox.osuosl.org>
References: <20091216190433.314B077792@busybox.osuosl.org>
Message-ID: <a038bef50912161135g96cd695m27e23a7811e37fe7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 16, 2009 at 2:02 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
> index e7f9358..f044e51 100644
> --- a/configs/arm_toolchain_defconfig
> +++ b/configs/arm_toolchain_defconfig
> @@ -156,7 +156,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
> ?#
> ?BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
> ?BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
> -BR2_STAGING_DIR="/usr/local/$(ARCH)/gcc-$(BR2_GCC_VERSION)-uclibc"
> +BR2_STAGING_DIR="$(BASE_DIR)/staging"
> ?# BR2_FPU_SUFFIX is not set
> ?BR2_TOPDIR_PREFIX=""
> ?BR2_TOPDIR_SUFFIX=""

Not that I know anything about arm_toolchain_defconfig but from its
name and the old BR2_STAGING_DIR value I'm guessing it attempts to
generate a standalone toolchain and install it in /usr/local. You
might want to change this one back.
