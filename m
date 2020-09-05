From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2020 21:30:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/matchbox: fix build with gcc 10
In-Reply-To: <20200905122611.522633-1-fontaine.fabrice@gmail.com>
References: <20200905122611.522633-1-fontaine.fabrice@gmail.com>
Message-ID: <20200905193031.GX14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-09-05 14:26 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/3f552248869d9842b3db8b71c1ca0b030b1a64ba
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0002-src-Fix-build-with-gcc-10.patch      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/matchbox/0002-src-Fix-build-with-gcc-10.patch
> 
> diff --git a/package/matchbox/0002-src-Fix-build-with-gcc-10.patch b/package/matchbox/0002-src-Fix-build-with-gcc-10.patch
> new file mode 100644
> index 0000000000..1556c6be24
> --- /dev/null
> +++ b/package/matchbox/0002-src-Fix-build-with-gcc-10.patch
> @@ -0,0 +1,47 @@
> +From 844f61069896fe3f549ab425d731c061028f697c Mon Sep 17 00:00:00 2001
> +From: Adrian Bunk <bunk@stusta.de>
> +Date: Tue, 12 May 2020 09:44:05 +0300
> +Subject: src: Fix build with gcc 10
> +
> +gcc 10 enables -fno-common by default which fails without these typedefs
> +
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +[Retrieved from:
> +http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-window-manager/commit/?id=844f61069896fe3f549ab425d731c061028f697c]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/mbtheme.h | 2 +-
> + src/structs.h | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/mbtheme.h b/src/mbtheme.h
> +index aa9a7c5..ad03bde 100644
> +--- a/src/mbtheme.h
> ++++ b/src/mbtheme.h
> +@@ -46,7 +46,7 @@ typedef struct _mb_theme_param
> + 
> + } MBThemeParam;
> + 
> +-enum {
> ++typedef enum {
> +   LAYER_GRADIENT_HORIZ = 1,
> +   LAYER_GRADIENT_VERT,
> +   LAYER_LABEL,
> +diff --git a/src/structs.h b/src/structs.h
> +index 24985e7..8f53e72 100644
> +--- a/src/structs.h
> ++++ b/src/structs.h
> +@@ -148,7 +148,7 @@
> + 
> + /* Atoms, if you change these check ewmh_init() first */
> + 
> +-enum {
> ++typedef enum {
> +   WM_STATE = 0,
> +   WM_CHANGE_STATE,
> +   WM_PROTOCOLS,
> +-- 
> +cgit v1.2.2-1-g5e49
> +
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
