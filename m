From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:39:56 +0200
Subject: [Buildroot] [PATCH v5 6/8] libglu: new package
In-Reply-To: <1396588694-6377-7-git-send-email-bernd.kuhls@t-online.de>
References: <1396588694-6377-1-git-send-email-bernd.kuhls@t-online.de>
 <1396588694-6377-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140417223956.6703f9f5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  4 Apr 2014 07:18:12 +0200, Bernd Kuhls wrote:

> diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
> new file mode 100644
> index 0000000..9a4ebc1
> --- /dev/null
> +++ b/package/libglu/libglu.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# libglu
> +#
> +################################################################################
> +
> +LIBGLU_VERSION = 9.0.0
> +LIBGLU_SITE = http://cgit.freedesktop.org/mesa/glu/snapshot
> +LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.gz
> +LIBGLU_LICENSE = SGI-B-2.0
> +LIBGLU_LICENSE_FILES = include/GL/glu.h
> +LIBGLU_INSTALL_STAGING = YES
> +LIBGLU_AUTORECONF = YES
> +LIBGLU_DEPENDENCIES = mesa3d
> +
> +LIBGLU_CONF_OPT = --disable-osmesa

Since you're passing --disable-osmesa, libGLU is using libGL. So what
makes it depend on mesa3d specifically, and not any other OpenGL
compatible implementation? Maybe it needs to use
BR2_PACKAGE_HAS_OPENGL instead?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
