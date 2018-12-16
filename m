From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:17:33 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.3.1
In-Reply-To: <1544950714-19774-1-git-send-email-james.hilliard1@gmail.com>
References: <1544950714-19774-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181216121733.5013fbfe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Dec 2018 16:58:34 +0800, james.hilliard1 at gmail.com wrote:

> diff --git a/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch b/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch
> new file mode 100644
> index 0000000..56f94bc
> --- /dev/null
> +++ b/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch
> @@ -0,0 +1,48 @@
> +From eb44c36cf1729e7e200b77cf8ea755dff72d1639 Mon Sep 17 00:00:00 2001
> +From: Gurchetan Singh <gurchetansingh@chromium.org>
> +Date: Wed, 28 Nov 2018 08:39:34 -0800
> +Subject: [PATCH] egl: add missing #include <stddef.h> in egldevice.h
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Otherwise, I get this error:
> +
> +main/egldevice.h:54:13: error: ?NULL? undeclared (first use in this function)
> +       dev = NULL;
> +             ^~~~
> +with this config:
> +
> +./autogen.sh --enable-gles1 --enable-gles2 --with-platforms='surfaceless' --disable-glx
> +             --with-dri-drivers="i965" --with-gallium-drivers="" --enable-gbm
> +
> +v3: Use stddef.h (Matt)
> +v4: Modify commit message (Eric)
> +
> +Reviewed-by: Matt Turner <mattst88@gmail.com>
> +Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
> +---

This separator here shouldn't be there, i.e the following two lines,
should be right after the two Reviewed-by.

> +Backported from upstream commit eb44c36cf1729e7e200b77cf8ea755dff72d1639
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
