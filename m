From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Dec 2018 11:39:30 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: bump to version
 18.3.1
In-Reply-To: <1544861438-11607-1-git-send-email-james.hilliard1@gmail.com>
References: <1544861438-11607-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181215103930.GC2625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-15 16:10 +0800, james.hilliard1 at gmail.com spake thusly:
> From: James Hilliard <james.hilliard1@gmail.com>

You need to provide a commit log that explains a bit the change,
especially since it is not a simple bumnp (you add a new patch).

More comment below...

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

When you send an updated patch (a v2, v3...), please add a revision
changelog here, see:

https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog

>  ...d-missing-include-stddef.h-in-egldevice.h.patch | 45 ++++++++++++++++++++++
>  package/mesa3d/mesa3d.hash                         | 10 ++---
>  package/mesa3d/mesa3d.mk                           |  2 +-
>  3 files changed, 51 insertions(+), 6 deletions(-)
>  create mode 100644 package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch
> 
> diff --git a/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch b/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch
> new file mode 100644
> index 0000000..b47a642
> --- /dev/null
> +++ b/package/mesa3d/0004-egl-add-missing-include-stddef.h-in-egldevice.h.patch
> @@ -0,0 +1,45 @@
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

Here, you should also add your own Signed-off-by tag, and a note stating
that this is backported from upstream or is grabbed from a ML thread or
whatever, so that we know whether to remove it on next bump for example;

    [james.hilliard1 at gmail.com: backport from upstream commit]
    Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
https://buildroot.org/downloads/manual/manual.html#_integrating_patches_found_on_the_web

[--SNIP--]
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index f3ee69b..2fe46bd 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 18.3.0
> +MESA3D_VERSION = 18.3.1

As Bernd already pointed out, you need to also update mesa3d-headers
too. What made you miss the notice just above? Do you have a suggestion
so that the next one who bumps either mesa3d or mesa3d-headers does not
miss it next time?

Regards,
Yann E. MORIN.

>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://mesa.freedesktop.org/archive
>  MESA3D_LICENSE = MIT, SGI, Khronos
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
