From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 17 Apr 2014 20:23:03 +0200
Subject: [Buildroot] [PATCH v3] package/zile: add Zile is Lossy Emacs
 editor
In-Reply-To: <1397737179-12262-2-git-send-email-alex.bennee@linaro.org>
References: <1397737179-12262-1-git-send-email-alex.bennee@linaro.org>
 <1397737179-12262-2-git-send-email-alex.bennee@linaro.org>
Message-ID: <53501C07.9060800@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Alex,

> This is a lightweight Emacs clone useful for embedded systems. I nabbed
> the help2man disable patch from OpenEmbedded.
>
> Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
>
> ---
> v2 - review comments
> - fixup dependancies
> - add s-o-b tag to patch
> - fix whitespace
>
> v3
> - fix typo for DEPENDENCIES
> - force AUTORECONF
> - remove +=
> - use BR2_GNU_MIRROR
> - rename patch to zile-0001-remove-help2man.patch
> ---
>   package/Config.in                            |  1 +
>   package/zile/Config.in                       | 13 ++++++++++++
>   package/zile/zile-0001-remove-help2man.patch | 30 ++++++++++++++++++++++++++++
>   package/zile/zile.mk                         | 15 ++++++++++++++
>   4 files changed, 59 insertions(+)
>   create mode 100644 package/zile/Config.in
>   create mode 100644 package/zile/zile-0001-remove-help2man.patch
>   create mode 100644 package/zile/zile.mk
>

[...]

> diff --git a/package/zile/zile.mk b/package/zile/zile.mk
> new file mode 100644
> index 0000000..07226c6
> --- /dev/null
> +++ b/package/zile/zile.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# Zile

Here you should use only lower-case.

Regards,
Jerzy

> +#
> +################################################################################
> +
> +ZILE_VERSION = 2.4.11
> +ZILE_SITE = $(BR2_GNU_MIRROR)/zile
> +ZILE_LICENSE = GPLv1+
> +ZILE_LICENSE_FILES = COPYING
> +ZILE_AUTORECONF = YES
> +ZILE_CONF_OPT = --without-help2man
> +ZILE_DEPENDENCIES = libgc
> +
> +$(eval $(autotools-package))
