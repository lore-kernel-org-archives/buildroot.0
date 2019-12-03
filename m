From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Dec 2019 22:18:32 +0100
Subject: [Buildroot] [PATCH] package/cryptsetup: use external libargon2
In-Reply-To: <20191203123154.8041-1-p.debruijn@unilogic.nl>
References: <20191203123154.8041-1-p.debruijn@unilogic.nl>
Message-ID: <9986063a-45a5-9e61-8cf1-86321c3d7a8b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/12/2019 13:31, Pascal de Bruijn wrote:
> don't use cryptsetup's intree libargon2
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/cryptsetup/Config.in     | 1 +
>  package/cryptsetup/cryptsetup.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
> index 14b897a..3f94847 100644
> --- a/package/cryptsetup/Config.in
> +++ b/package/cryptsetup/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_CRYPTSETUP
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	select BR2_PACKAGE_JSON_C
> +	select BR2_PACKAGE_LIBARGON2
>  	help
>  	  This tool helps manipulate dm-crypt and luks partitions for
>  	  on-disk encryption.
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 7788bfb..5ed5013 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -14,7 +14,7 @@ CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
>  CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
>  CRYPTSETUP_INSTALL_STAGING = YES
>  CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
> -CRYPTSETUP_CONF_OPTS += --enable-blkid
> +CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2

 You also need to add it to CRYPTSETUP_DEPENDENCIES.

 Regards,
 Arnout

>  
>  # cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
>  # or kernel crypto modules instead
> 
