From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 22:28:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/xvisor: bump to version 0.3.0
In-Reply-To: <20200628210450.1299847-1-fontaine.fabrice@gmail.com>
References: <20200628210450.1299847-1-fontaine.fabrice@gmail.com>
Message-ID: <20200629202800.GQ20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-28 23:04 +0200, Fabrice Fontaine spake thusly:
> - Drop patch (already in version)
> - Update indentation in hash file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...MAKEFILE-Unconditionally-disable-SSP.patch | 35 -------------------
>  package/xvisor/xvisor.hash                    |  4 +--
>  package/xvisor/xvisor.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 38 deletions(-)
>  delete mode 100644 package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch
> 
> diff --git a/package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch b/package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch
> deleted file mode 100644
> index ffa486d7d4..0000000000
> --- a/package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From f04d1b73a9060e8f09cf1173f89daab73d6c0a18 Mon Sep 17 00:00:00 2001
> -From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> -Date: Sat, 9 Nov 2019 17:13:46 +0100
> -Subject: [PATCH] [MAKEFILE] Unconditionally disable SSP
> -
> -Though -nostdlib is passed in $(cflags), -fno-stack-protector must also be
> -passed to avoid linking errors related to undefined references to
> -'__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
> --fstack-protector.
> -
> -Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> -[yann.morin.1998 at free.fr:
> -  - applied upstream: https://github.com/avpatel/xvisor-next/commit/6edd4a8bf16c42aac8bea9e0a61e8b3b47e2aa7c
> -]
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index d6bcf519..de8e1043 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -137,7 +137,7 @@ cppflags+=$(cpu-cppflags)
> - cppflags+=$(board-cppflags)
> - cppflags+=$(libs-cppflags-y)
> - cc=$(CROSS_COMPILE)gcc
> --cflags=-g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -D__VMM__
> -+cflags=-g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -D__VMM__ -fno-stack-protector
> - cflags+=$(board-cflags) 
> - cflags+=$(cpu-cflags) 
> - cflags+=$(libs-cflags-y) 
> --- 
> -2.21.0
> -
> diff --git a/package/xvisor/xvisor.hash b/package/xvisor/xvisor.hash
> index dee1ef1d08..6938e20e7b 100644
> --- a/package/xvisor/xvisor.hash
> +++ b/package/xvisor/xvisor.hash
> @@ -1,3 +1,3 @@
>  # Locally generated
> -sha256 a0c9537bd7fb06084c3da663f71bf6f2b1709e34b3b2fca2473c8db1cdd3de1d  xvisor-0.2.11.tar.xz
> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  81660d26a0bc63979ba40872f10511df777185712eba2d0e19e816438388de05  xvisor-0.3.0.tar.xz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
> index 6094370cc7..fe3ec05855 100644
> --- a/package/xvisor/xvisor.mk
> +++ b/package/xvisor/xvisor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XVISOR_VERSION = 0.2.11
> +XVISOR_VERSION = 0.3.0
>  XVISOR_SOURCE = xvisor-$(XVISOR_VERSION).tar.xz
>  XVISOR_SITE = http://www.xhypervisor.org/tarball
>  XVISOR_LICENSE = GPL-2.0+
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
