From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Jul 2014 14:03:32 +0300
Subject: [Buildroot] [PATCH 1/1] ccrypt: new package
In-Reply-To: <1404902304-10124-1-git-send-email-david.bachelart@bbright.com>
References: <1404902304-10124-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140709110332.GG3003@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Wed, Jul 09, 2014 at 12:38:24PM +0200, David Bachelart wrote:
> ccrypt is a utility for encrypting and decrypting files and streams.
> 
> Signed-off-by: David Bachelart <david.bachelart@bbright.com>
> ---
>  package/Config.in        |    1 +
>  package/ccrypt/Config.in |    6 ++++++
>  package/ccrypt/ccrypt.mk |   20 ++++++++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/ccrypt/Config.in
>  create mode 100644 package/ccrypt/ccrypt.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f30c25f..c626968 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1094,6 +1094,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  endif
>  comment "Utilities"
>  	source "package/at/Config.in"
> +	source "package/ccrypt/Config.in"
>  	source "package/dialog/Config.in"
>  	source "package/dtach/Config.in"
>  	source "package/file/Config.in"
> diff --git a/package/ccrypt/Config.in b/package/ccrypt/Config.in
> new file mode 100644
> index 0000000..99c4d47
> --- /dev/null
> +++ b/package/ccrypt/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_CCRYPT
> +        bool "ccrypt"
> +        help
> +          ccrypt is a utility for encrypting and decrypting files and streams.
> +
> +          http://ccrypt.sourceforge.net/
> diff --git a/package/ccrypt/ccrypt.mk b/package/ccrypt/ccrypt.mk
> new file mode 100644
> index 0000000..51696c0
> --- /dev/null
> +++ b/package/ccrypt/ccrypt.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# ccrypt
> +#
> +################################################################################
> +
> +CCRYPT_VERSION = 1.10
> +CCRYPT_SOURCE = ccrypt-$(CCRYPT_VERSION).tar.gz

This is the default. Please remove.

> +CCRYPT_SITE = http://ccrypt.sourceforge.net/download/
> +
> +CCRYPT_INSTALL_STAGING = NO
> +CCRYPT_INSTALL_TARGET = YES
> +CCRYPT_CONF_OPT = 

All three are default. Please remove.

> +CCRYPT_LICENSE = GPLv2

The website (http://ccrypt.sourceforge.net/) and the README file has the "any 
later version" language, so this should be GPLv2+.

> +CCRYPT_LICENSE_FILES = COPYING
> +
> +CCRYPT_DEPENDENCIES = 

This is default. Please remove.

> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
