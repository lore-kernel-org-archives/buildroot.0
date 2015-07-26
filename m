From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Jul 2015 00:56:51 +0300
Subject: [Buildroot] [PATCH 1/1] cmocka: new package
In-Reply-To: <1437884269-6134-1-git-send-email-nimaim@gmail.com>
References: <1437884269-6134-1-git-send-email-nimaim@gmail.com>
Message-ID: <20150726215651.GJ17029@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nimai,

On Sun, Jul 26, 2015 at 12:17:49AM -0400, Nimai Mahajan wrote:
> From: Nimai Mahajan <nimaim@gmail.com>
> 
> Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
> ---

[snip]

> diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
> new file mode 100644
> index 0000000..740ff64
> --- /dev/null
> +++ b/package/cmocka/cmocka.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# cmocka
> +#
> +################################################################################
> +
> +CMOCKA_VERSION = 1.0.1
> +CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
> +CMOCKA_SITE = https://cmocka.org/files/1.0/
> +CMOCKA_LICENSE = Apache-2.0
> +CMOCKA_LICENSE_FILES = COPYING
> +CMOCKA_DEPENDENCIES = host-cmake

The cmake infrastructure automatically adds the host-cmake dependency.

> +CMOCKA_INSTALL_STAGING = YES
> +
> +# cmocka only supports out of source builds
> +CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +$(eval $(cmake-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
