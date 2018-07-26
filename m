From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Jul 2018 15:27:14 +0200
Subject: [Buildroot] [PATCH v2] libostree: override path to
 gpg-error-config
In-Reply-To: <20180726080800.5564-1-marcus.folkesson@gmail.com>
References: <20180726080800.5564-1-marcus.folkesson@gmail.com>
Message-ID: <20180726152714.045942f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jul 2018 10:08:00 +0200, Marcus Folkesson wrote:
> libostree has begun to use `gpg-error-config` in their configuration
> script.
> Point out gpg-error-config in staging dir to avoid using the one
> installed on the host system.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/447b96e449e881cf1bd9644cda0f386aa4c75724
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> 
> Notes:
>     v2:
>     	- override ac_cv_path_GPG_ERROR_CONFIG instead of  GPG_ERROR_CONFIG
> 
>  package/libostree/libostree.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index 24eda0d1db..414cca104a 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -12,6 +12,7 @@ LIBOSTREE_LICENSE = LGPL-2.0+
>  LIBOSTREE_LICENSE_FILES = COPYING
>  LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpgme xz
>  LIBOSTREE_INSTALL_STAGING = YES
> +LIBOSTREE_CONF_ENV = GPG_ERROR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config

So libostree is using libgpg-error directly, not only indirectly
through libgpgme. Should we add libgpg-error in libostree dependencies
explicitly to document this direct dependency ?

It is a bit weird to pass GPG_ERROR_CONFIG with this package not
depending on libgpg-error.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
