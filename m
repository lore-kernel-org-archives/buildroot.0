From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 29 May 2013 17:09:46 +0100
Subject: [Buildroot] [PATCH v2] directfb: Make imlib2 support optional
In-Reply-To: <1369128580-15685-1-git-send-email-markos.chandras@gmail.com>
References: <1369128580-15685-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <CAG2jQ8i-3_gNChmCHYX_hMc+soQrRrokTg50SzYM+kegaFp5mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 May 2013 10:29, Markos Chandras <markos.chandras@gmail.com> wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> Changes since v1:
> - Make imlib2 support optional
> ---
>  package/directfb/Config.in   | 5 +++++
>  package/directfb/directfb.mk | 8 ++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index b9ff5f9..a6bfb6b 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -100,6 +100,11 @@ config BR2_PACKAGE_DIRECTFB_GIF
>         bool "enable GIF support"
>         default y
>
> +config BR2_PACKAGE_DIRECTFB_IMLIB2
> +       bool "enable IMLIB2 support"
> +       default y
> +       select BR2_PACKAGE_IMLIB2
> +
>  config BR2_PACKAGE_DIRECTFB_JPEG
>         bool "enable JPEG support"
>         default y
> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> index 5ead084..e5a423d 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -108,6 +108,14 @@ else
>  DIRECTFB_CONF_OPT += --disable-jpeg
>  endif
>
> +ifeq ($(BR2_PACKAGE_DIRECTFB_IMLIB2),y)
> +DIRECTFB_CONF_OPT += --enable-imlib2
> +DIRECTFB_DEPENDENCIES += imlib2
> +DIRECTFB_CONF_ENV += ac_cv_path_IMLIB2_CONFIG=$(STAGING_DIR)/usr/bin/imlib2-config
> +else
> +DIRECTFB_CONF_OPT += --disable-imlib2
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DIRECTFB_DITHER_RGB16),y)
>  DIRECTFB_CONF_OPT += --with-dither-rgb16=advanced
>  else
> --
> 1.8.2.1
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hi,

Any comments about this patch?

--
Regards,
Markos Chandras
