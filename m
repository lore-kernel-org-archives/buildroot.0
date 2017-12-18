From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Dec 2017 08:25:13 +0200
Subject: [Buildroot] [PATCH 1/1] tpm-tools: bump to version 1.3.9.1
In-Reply-To: <1513535088-8955-1-git-send-email-yairba@tkos.co.il>
References: <1513535088-8955-1-git-send-email-yairba@tkos.co.il>
Message-ID: <20171218062513.nknuj3ai5ldiilrt@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yair,

Thanks for your contribution. See a few comment inline below.

On Sun, Dec 17, 2017 at 08:24:48PM +0200, Yair Ben Avraham wrote:
> Signed-off-by: Yair Ben Avraham <yairba@tkos.co.il>

An empty commit log is fine for a simple version bump that consists of 
_VERSION and hash updates only. This patch is doing more than that, so some 
more information is needed. See below.

> ---
>  ..._nvread-include-sys-stat.h-for-open-modes.patch |  33 -------
>  ...-make-sure-libintl-is-in-LDFLAGS-when-nee.patch | 104 ---------------------
>  .../0002-configure.in-remove-Werror.patch          |  27 ------

Why are you removing these patches? Are they included in upstream version? 
Maybe they are not needed anymore? Please explain in the commit log.

>  package/tpm-tools/tpm-tools.hash                   |   6 +-
>  package/tpm-tools/tpm-tools.mk                     |   5 +-
>  5 files changed, 4 insertions(+), 171 deletions(-)
>  delete mode 100644 package/tpm-tools/0001-tpm_nvread-include-sys-stat.h-for-open-modes.patch
>  delete mode 100644 package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch
>  delete mode 100644 package/tpm-tools/0002-configure.in-remove-Werror.patch

[...]

> diff --git a/package/tpm-tools/tpm-tools.hash b/package/tpm-tools/tpm-tools.hash
> index 8c1ff89..c658071 100644
> --- a/package/tpm-tools/tpm-tools.hash
> +++ b/package/tpm-tools/tpm-tools.hash
> @@ -1,3 +1,3 @@
> -# http://sourceforge.net/projects/trousers/files/tpm-tools/1.3.8/
> -sha1 f2c799ac8dc78f3537e1dbe4ae7c6e93f37e868c tpm-tools-1.3.8.tar.gz
> -md5  85a978c4e03fefd4b73cbeadde7c4d0b         tpm-tools-1.3.8.tar.gz
> +# http://sourceforge.net/projects/trousers/files/tpm-tools/1.3.9.1/
> +sha1 c35cb031c6b5220dd1c8a03995654fdd12aa3031 tpm-tools-1.3.9.1.tar.gz
> +md5  1532293aa632a0eaa7e60df87c779855         tpm-tools-1.3.9.1.tar.gz

It would be nice to add a locally calculated cryptographically secure sha256 
hash. A license files hash would be nice as well.

> diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
> index 4dbf50a..23dd5bc 100644
> --- a/package/tpm-tools/tpm-tools.mk
> +++ b/package/tpm-tools/tpm-tools.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -TPM_TOOLS_VERSION = 1.3.8
> +TPM_TOOLS_VERSION = 1.3.9.1
>  TPM_TOOLS_SITE = http://downloads.sourceforge.net/project/trousers/tpm-tools/$(TPM_TOOLS_VERSION)
> -TPM_TOOLS_STRIP_COMPONENTS = 2

Why this change? Please explain in the commit log.

>  TPM_TOOLS_LICENSE = Common Public License Version 1.0
>  TPM_TOOLS_LICENSE_FILES = LICENSE
>  TPM_TOOLS_DEPENDENCIES = trousers openssl $(TARGET_NLS_DEPENDENCIES)
> @@ -14,8 +13,6 @@ TPM_TOOLS_DEPENDENCIES = trousers openssl $(TARGET_NLS_DEPENDENCIES)
>  TPM_TOOLS_AUTORECONF = YES
>  TPM_TOOLS_GETTEXTIZE = YES
>  
> -TPM_TOOLS_CONF_OPTS = --disable-pkcs11-support

Ditto.

>  ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  TPM_TOOLS_CONF_ENV += LIBS='-liconv'
>  endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
