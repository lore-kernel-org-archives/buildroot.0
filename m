From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 21:55:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.0.2
In-Reply-To: <20200319065305.172053-1-bernd.kuhls@t-online.de>
References: <20200319065305.172053-1-bernd.kuhls@t-online.de>
Message-ID: <20200320205506.GS10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-03-19 07:53 +0100, Bernd Kuhls spake thusly:
> Removed patch applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...util-remove-the-dependency-on-kcmp.h.patch | 42 -------------------
>  package/mesa3d/mesa3d.hash                    |  6 +--
>  package/mesa3d/mesa3d.mk                      |  2 +-
>  4 files changed, 5 insertions(+), 47 deletions(-)
>  delete mode 100644 package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index f4927a28c6..e6e538d1e5 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>  
>  # Not possible to directly refer to mesa3d variables, because of
>  # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 20.0.0
> +MESA3D_HEADERS_VERSION = 20.0.2
>  MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>  MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
>  MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch b/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
> deleted file mode 100644
> index 27ae021e08..0000000000
> --- a/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 63ad4535df6a0a938e7391d73adcada05e730c89 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
> -Date: Tue, 18 Feb 2020 16:12:23 -0500
> -Subject: [PATCH] util: remove the dependency on kcmp.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Fixes: f76cbc7901f7 "util: Add os_same_file_description helper"
> -
> -Acked-by: Eric Engestrom <eric@engestrom.ch>
> -Reviewed-by: Michel D?nzer <mdaenzer@redhat.com>
> -Tested-by: Marge Bot <https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3860>
> -Part-of: <https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3860>
> -
> -[ Upstream: https://cgit.freedesktop.org/mesa/mesa/commit/?id=f7bfb10c69dfe48a91e35523cb5ee641bdbf6988 ]
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - src/util/os_file.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/util/os_file.c b/src/util/os_file.c
> -index b502ff4..128fe87 100644
> ---- a/src/util/os_file.c
> -+++ b/src/util/os_file.c
> -@@ -34,11 +34,12 @@ os_file_create_unique(const char *filename, int filemode)
> - #if defined(__linux__)
> - 
> - #include <fcntl.h>
> --#include <linux/kcmp.h>
> - #include <sys/stat.h>
> - #include <sys/syscall.h>
> - #include <unistd.h>
> - 
> -+/* copied from <linux/kcmp.h> */
> -+#define KCMP_FILE 0
> - 
> - static ssize_t
> - readN(int fd, char *buf, size_t len)
> --- 
> -2.25.1
> -
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index e2ec6e625d..8f7b3ed7f6 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2020-February/000572.html
> -sha256 bb6db3e54b608d2536d4000b3de7dd3ae115fc114e8acbb5afff4b3bbed04b34  mesa-20.0.0.tar.xz
> -sha512 3968820029434682fb6644947c76e12b6bb991a3d05cb519a6ea971ecc4aa9b21d03f84b9a452cc21cc77a7981db9e40dd2dfd3ea3dee85b3dd88a59b4842bbb  mesa-20.0.0.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2020-March/000574.html
> +sha256 aa54f1cb669550606aab8ceb475105d15aeb814fca5a778ce70d0fd10e98e86f  mesa-20.0.2.tar.xz
> +sha512 d6ffc29bbc5b908cb0f08fa1b5a83e029b76c7b697c488a73e6bb60990a55beeb3ecdba1745868f6885ee2f660975f5debf7d2c9418e0a96e2f7049e83fd89ab  mesa-20.0.2.tar.xz
>  
>  # License
>  sha256 1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 9c9f38d17e..a509a92ba9 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 20.0.0
> +MESA3D_VERSION = 20.0.2
>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://mesa.freedesktop.org/archive
>  MESA3D_LICENSE = MIT, SGI, Khronos
> -- 
> 2.25.0
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
