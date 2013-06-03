From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 3 Jun 2013 06:13:46 +0300
Subject: [Buildroot] [PATCHv2 1/2] p11-kit: new package
In-Reply-To: <1370220653-19018-1-git-send-email-gustavo@zacarias.com.ar>
References: <1370220653-19018-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130603031346.GL11798@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Sun, Jun 02, 2013 at 09:50:52PM -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in          |  1 +
>  package/p11-kit/Config.in  | 15 +++++++++++++++
>  package/p11-kit/p11-kit.mk | 15 +++++++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 package/p11-kit/Config.in
>  create mode 100644 package/p11-kit/p11-kit.mk

[snip]

> diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
> new file mode 100644
> index 0000000..40a07d3
> --- /dev/null
> +++ b/package/p11-kit/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_P11_KIT
> +	bool "p11-kit"
> +	depends on !BR2_PREFER_STATIC_LIB
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBTASN1
> +	help
> +	  Provides a way to load and enumerate PKCS#11 modules.
> +	  Provides a standard configuration setup for installing PKCS#11
> +	  modules in such a way that they're discoverable.
> +
> +	  http://p11-glue.freedesktop.org/p11-kit.html
> +
> +comment "p11-kit requires a toolchain with thread support"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

Maybe also add BR2_PREFER_STATIC_LIB to the comment 'depends'?

baruch

> diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
> new file mode 100644
> index 0000000..2ddb27c
> --- /dev/null
> +++ b/package/p11-kit/p11-kit.mk
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# p11-kit
> +#
> +#############################################################
> +
> +P11_KIT_VERSION = 0.18.1
> +P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
> +P11_KIT_DEPENDENCIES = host-pkgconf libtasn1
> +P11_KIT_INSTALL_STAGING = YES
> +P11_KIT_CONF_OPT = --disable-static
> +P11_KIT_LICENSE = BSD-3c
> +P11_KIT_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
> --
> 1.8.1.5

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
