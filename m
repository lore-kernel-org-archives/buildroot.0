From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 09:21:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.1
In-Reply-To: <20200611060538.175469-1-bernd.kuhls@t-online.de>
References: <20200611060538.175469-1-bernd.kuhls@t-online.de>
Message-ID: <20200621072132.GV2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-11 08:05 +0200, Bernd Kuhls spake thusly:
> Removed patches applied upstream:
> 
> - 0005-vc4_bufmgr-fix-time_t-printf.patch
>   https://cgit.freedesktop.org/mesa/mesa/commit/?h=20.1&id=ad81207d00623cb2156ca0ecab39d0bcad5b28c9
> - 0006-pan_bo.h-add-time.h-include-for-time_t.patch
>   https://cgit.freedesktop.org/mesa/mesa/commit/?h=20.1&id=eedeee0094841c863e2f6ddd8bc2212d011e0e2f
> - 0007-v3d_bufmgr-fix-time_t-printf.patch
>   https://cgit.freedesktop.org/mesa/mesa/commit/?h=20.1&id=9f67806f141986c1d8310c5e0f1b2493434118d9
> 
> Renumbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...t-isinf-for-uclibc-based-toolchains.patch} |  0
>  ...ion-to-disable-optional-neon-suppor.patch} |  0
>  .../0005-vc4_bufmgr-fix-time_t-printf.patch   | 33 ------------------
>  ...n_bo.h-add-time.h-include-for-time_t.patch | 34 -------------------
>  .../0007-v3d_bufmgr-fix-time_t-printf.patch   | 33 ------------------
>  package/mesa3d/mesa3d.hash                    |  6 ++--
>  package/mesa3d/mesa3d.mk                      |  2 +-
>  8 files changed, 5 insertions(+), 105 deletions(-)
>  rename package/mesa3d/{0004-c99_math-import-isinf-for-uclibc-based-toolchains.patch => 0003-c99_math-import-isinf-for-uclibc-based-toolchains.patch} (100%)
>  rename package/mesa3d/{0007-vc4-add-meson-option-to-disable-optional-neon-suppor.patch => 0004-vc4-add-meson-option-to-disable-optional-neon-suppor.patch} (100%)
>  delete mode 100644 package/mesa3d/0005-vc4_bufmgr-fix-time_t-printf.patch
>  delete mode 100644 package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
>  delete mode 100644 package/mesa3d/0007-v3d_bufmgr-fix-time_t-printf.patch
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 008c2c3cf4..246abbd033 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>  
>  # Not possible to directly refer to mesa3d variables, because of
>  # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 20.1.0
> +MESA3D_HEADERS_VERSION = 20.1.1
>  MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>  MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
>  MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/0004-c99_math-import-isinf-for-uclibc-based-toolchains.patch b/package/mesa3d/0003-c99_math-import-isinf-for-uclibc-based-toolchains.patch
> similarity index 100%
> rename from package/mesa3d/0004-c99_math-import-isinf-for-uclibc-based-toolchains.patch
> rename to package/mesa3d/0003-c99_math-import-isinf-for-uclibc-based-toolchains.patch
> diff --git a/package/mesa3d/0007-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0004-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> similarity index 100%
> rename from package/mesa3d/0007-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> rename to package/mesa3d/0004-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> diff --git a/package/mesa3d/0005-vc4_bufmgr-fix-time_t-printf.patch b/package/mesa3d/0005-vc4_bufmgr-fix-time_t-printf.patch
> deleted file mode 100644
> index 56357e1f3a..0000000000
> --- a/package/mesa3d/0005-vc4_bufmgr-fix-time_t-printf.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 4ed48324b032857c95e6803409d5def9660d5b46 Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Sun, 22 Mar 2020 11:42:35 +0100
> -Subject: [PATCH] vc4_bufmgr: fix time_t printf
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Fixes:
> -
> -  error: format ?%ld? expects argument of type ?long int?, but argument 3 has type ?time_t? {aka ?long long int?}
> -
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - src/gallium/drivers/vc4/vc4_bufmgr.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/gallium/drivers/vc4/vc4_bufmgr.c b/src/gallium/drivers/vc4/vc4_bufmgr.c
> -index f7ac1698ee3..a786e8ee939 100644
> ---- a/src/gallium/drivers/vc4/vc4_bufmgr.c
> -+++ b/src/gallium/drivers/vc4/vc4_bufmgr.c
> -@@ -100,7 +100,7 @@ vc4_bo_dump_stats(struct vc4_screen *screen)
> -                 struct timespec time;
> -                 clock_gettime(CLOCK_MONOTONIC, &time);
> -                 fprintf(stderr, "  now:               %ld\n",
> --                        time.tv_sec);
> -+                        (long)time.tv_sec);
> -         }
> - }
> - 
> --- 
> -2.25.1
> -
> diff --git a/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch b/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
> deleted file mode 100644
> index f90fb85aca..0000000000
> --- a/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From fc93d357efd207525a4ddaac609ab5a6bf469bcd Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Sun, 22 Mar 2020 11:48:31 +0100
> -Subject: [PATCH] pan_bo.h: add time.h include for time_t
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Fixes:
> -
> -  ../src/panfrost/encoder/pan_bo.h:93:9: error: unknown type name ?time_t?
> -
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> -[Bernd: rebased on 20.1]
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - src/panfrost/encoder/pan_bo.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/panfrost/encoder/pan_bo.h b/src/panfrost/encoder/pan_bo.h
> -index 414c356b95c..6dda393095d 100644
> ---- a/src/panfrost/encoder/pan_bo.h
> -+++ b/src/panfrost/encoder/pan_bo.h
> -@@ -29,6 +29,7 @@
> - #include <panfrost-misc.h>
> - #include "util/list.h"
> - #include "pan_device.h"
> -+#include <time.h>
> - 
> - /* Flags for allocated memory */
> - 
> --- 
> -2.25.1
> -
> diff --git a/package/mesa3d/0007-v3d_bufmgr-fix-time_t-printf.patch b/package/mesa3d/0007-v3d_bufmgr-fix-time_t-printf.patch
> deleted file mode 100644
> index f8031c2847..0000000000
> --- a/package/mesa3d/0007-v3d_bufmgr-fix-time_t-printf.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From c4984ce2b7d3bd7129ddb02e4e423bf00498607a Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Sun, 22 Mar 2020 13:03:00 +0100
> -Subject: [PATCH] v3d_bufmgr: fix time_t printf
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Fixes:
> -
> -  error: format ?%ld? expects argument of type ?long int?, but argument 3 has type ?time_t? {aka ?long long int?}
> -
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - src/gallium/drivers/v3d/v3d_bufmgr.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/gallium/drivers/v3d/v3d_bufmgr.c b/src/gallium/drivers/v3d/v3d_bufmgr.c
> -index 50e4081dafd..31a08036b38 100644
> ---- a/src/gallium/drivers/v3d/v3d_bufmgr.c
> -+++ b/src/gallium/drivers/v3d/v3d_bufmgr.c
> -@@ -81,7 +81,7 @@ v3d_bo_dump_stats(struct v3d_screen *screen)
> -                 struct timespec time;
> -                 clock_gettime(CLOCK_MONOTONIC, &time);
> -                 fprintf(stderr, "  now:               %ld\n",
> --                        time.tv_sec);
> -+                        (long)time.tv_sec);
> -         }
> - }
> - 
> --- 
> -2.25.1
> -
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index c8eda7b2ba..73dcf6ad81 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2020-May/000585.html
> -sha256  2109055d7660514fc4c1bcd861bcba9db00c026119ae222720111732dba27c83  mesa-20.1.0.tar.xz
> -sha512  f49230d18febe1bfd7c6282ab95fc244530f5cef56df0f804d8bece8a70bafcb445b8b83df96ad1b4c5af022c4e39a71f19a8f7e47b1fb09ada2b1a1317ff3be  mesa-20.1.0.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2020-June/000587.html
> +sha256  3ea6e46ea7881c656f7b4724639eaa4672d4e0e0b70869651e8f955ebae3d476  mesa-20.1.1.tar.xz
> +sha512  a8ae02915305488e5e0d8c104da73df1cdd61ab0b5c5d27a6851c418d25a2c9beeea9cddf93a341afa63cec52d356fe68b194c8c36e78c26f66fa884fc27f147  mesa-20.1.1.tar.xz
>  
>  # License
>  sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index e726bd33b3..0b21619e41 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 20.1.0
> +MESA3D_VERSION = 20.1.1
>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://mesa.freedesktop.org/archive
>  MESA3D_LICENSE = MIT, SGI, Khronos
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
