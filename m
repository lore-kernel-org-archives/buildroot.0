From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 29 Mar 2021 23:46:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/libqmi: drop unrecognized option
In-Reply-To: <20210329211957.321612-1-fontaine.fabrice@gmail.com>
References: <20210329211957.321612-1-fontaine.fabrice@gmail.com>
Message-ID: <CAAP7uc+qpS+Y9xN=C89jzupCH5qS2-_W_H7smrYa7SqMov57hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

On Mon, Mar 29, 2021 at 11:22 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> --enable-more-warnings has been dropped since version 1.26.0 and
> https://github.com/freedesktop/libqmi/commit/9f31a45d5fc137431705d47b83669f35259932b4
>

For some context, the build switched to
AX_COMPILER_FLAGS()+AX_IS_RELEASE() so, when building from a release
tarball, the build will default to --enable-compile-warnings=yes, and
when building from a git checkout, the build will default to
--enable-compile-warnings=error. As long as the buildroot makefile
relies on stable release tarballs, -Werror should be always implicitly
disabled.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libqmi/libqmi.mk | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index b02312d702..998952e47d 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -13,9 +13,6 @@ LIBQMI_INSTALL_STAGING = YES
>
>  LIBQMI_DEPENDENCIES = libglib2
>
> -# we don't want -Werror
> -LIBQMI_CONF_OPTS = --enable-more-warnings=no
> -
>  # if libgudev available, request udev support for a better
>  # qmi-firmware-update experience
>  ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> --
> 2.30.2
>


-- 
Aleksander
https://aleksander.es
