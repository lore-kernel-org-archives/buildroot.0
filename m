From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Jul 2014 16:19:35 +0300
Subject: [Buildroot] [PATCH v3 1/1] ccrypt: new package
In-Reply-To: <1404909226-27162-1-git-send-email-david.bachelart@bbright.com>
References: <1404909226-27162-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140709131935.GJ3003@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Wed, Jul 09, 2014 at 02:33:45PM +0200, David Bachelart wrote:
> ccrypt is a utility for encrypting and decrypting files and streams.
> 
> Signed-off-by: David Bachelart <david.bachelart@bbright.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/Config.in        |    1 +
>  package/ccrypt/Config.in |    6 ++++++
>  package/ccrypt/ccrypt.mk |   13 +++++++++++++
>  3 files changed, 20 insertions(+)
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
> index 0000000..bd48638
> --- /dev/null
> +++ b/package/ccrypt/ccrypt.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# ccrypt
> +#
> +################################################################################
> +
> +CCRYPT_VERSION = 1.10
> +CCRYPT_SITE = http://ccrypt.sourceforge.net/download/
> +
> +CCRYPT_LICENSE = GPLv2+
> +CCRYPT_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
