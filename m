From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 10 Apr 2015 11:20:52 +0200
Subject: [Buildroot] [PATCH v2 1/3] doxygen: new package
In-Reply-To: <1428653766-22734-2-git-send-email-bgolaszewski@baylibre.com>
References: <1428653766-22734-1-git-send-email-bgolaszewski@baylibre.com>
 <1428653766-22734-2-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <CAMpxmJU_wsEqkm0UPA2eMGVcts3giLLdAxyKLR=0KRjyLMJqcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-04-10 10:16 GMT+02:00 Bartosz Golaszewski <bgolaszewski@baylibre.com>:
> Host package only.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/doxygen/doxygen.hash |  2 ++
>  package/doxygen/doxygen.mk   | 25 +++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 package/doxygen/doxygen.hash
>  create mode 100644 package/doxygen/doxygen.mk
>
> diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
> new file mode 100644
> index 0000000..40cfe16
> --- /dev/null
> +++ b/package/doxygen/doxygen.hash
> @@ -0,0 +1,2 @@
> +# Computed locally
> +sha256 d4ab6e28d4d45d8956cad17470aade3fbe2356e8f64b92167e738c1887feccec  doxygen-1.8.9.1.src.tar.gz
> diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
> new file mode 100644
> index 0000000..40884d4
> --- /dev/null
> +++ b/package/doxygen/doxygen.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# doxygen
> +#
> +################################################################################
> +
> +DOXYGEN_VERSION = 1.8.9.1
> +DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
> +DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri/
> +DOXYGEN_LICENSE = GPLv2
> +DOXYGEN_LICENSE_FILES = LICENSE
> +
> +define HOST_DOXYGEN_CONFIGURE_CMDS
> +       (cd $(@D); ./configure --shared --prefix=$(HOST_DIR)/usr)
> +endef
> +
> +define DOXYGEN_BUILD_CMDS
> +       ($(MAKE) -C $(@D))
> +endef
> +
> +define HOST_DOXYGEN_INSTALL_CMDS
> +       ($(MAKE) install -C $(@D))
> +endef
> +
> +$(eval $(host-autotools-package))
> --
> 2.1.4
>

Sorry, for that - I eventually forgot to change host-autotools-package
to host-generic-package. Surprisingly it works.

Version 3 coming right up.

Best regards,
Bartosz Golaszewski
