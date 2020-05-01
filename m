From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 15:23:36 +0200
Subject: [Buildroot] [PATCH] package/grantlee: bump to 5.2.0,
 use github upstream, remove obsolete patch
In-Reply-To: <20200113115512.20589-1-zgyarmati@zgyarmati.de>
References: <20200113115512.20589-1-zgyarmati@zgyarmati.de>
Message-ID: <20200501132336.GB11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoltan, All,

On 2020-01-13 12:55 +0100, Zoltan Gyarmati spake thusly:
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-Remove-vestigial-ansi-flag.patch     | 27 -------------------
>  package/grantlee/grantlee.hash                |  4 +--
>  package/grantlee/grantlee.mk                  |  4 +--
>  3 files changed, 4 insertions(+), 31 deletions(-)
>  delete mode 100644 package/grantlee/0001-Remove-vestigial-ansi-flag.patch
> 
> diff --git a/package/grantlee/0001-Remove-vestigial-ansi-flag.patch b/package/grantlee/0001-Remove-vestigial-ansi-flag.patch
> deleted file mode 100644
> index 250463c2fd..0000000000
> --- a/package/grantlee/0001-Remove-vestigial-ansi-flag.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From c989fcf192d01d26866faf6405a28ba4fdce64c3 Mon Sep 17 00:00:00 2001
> -From: Stephen Kelly <steveire@gmail.com>
> -Date: Sun, 21 Jul 2019 16:00:41 +0100
> -Subject: [PATCH] Remove vestigial -ansi flag
> -
> -This causes the compiler to not operate in C++11 mode, meaning that
> -headers such as <type_traits> issue errors.
> -[Retrieved from:
> -https://github.com/steveire/grantlee/commit/c989fcf192d01d26866faf6405a28ba4fdce64c3]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 6d51110..9172213 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -59,7 +59,7 @@ endif()
> - 
> - if (CMAKE_COMPILER_IS_GNUCXX)
> -   set (CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wno-long-long -std=iso9899:1990 -Wundef -Wcast-align -Werror-implicit-function-declaration -Wchar-subscripts -Wall -W -Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attribute -fno-common")
> --  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnon-virtual-dtor -Wno-long-long -ansi -Wundef -Wcast-align -Wchar-subscripts -Wall -W -Wpointer-arith -Wformat-security -fno-check-new -fno-common ")
> -+  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnon-virtual-dtor -Wno-long-long -Wundef -Wcast-align -Wchar-subscripts -Wall -W -Wpointer-arith -Wformat-security -fno-check-new -fno-common ")
> - 
> -   if (CMAKE_BUILD_TYPE MATCHES TestCocoon)
> -     # Needed on 64 bit
> diff --git a/package/grantlee/grantlee.hash b/package/grantlee/grantlee.hash
> index 2be423bd95..f93380bd96 100644
> --- a/package/grantlee/grantlee.hash
> +++ b/package/grantlee/grantlee.hash
> @@ -1,5 +1,5 @@
> -# Locally calculated after checking pgp signature
> -sha256  ea2e402466c74bb533eee2c7252209ec61cd93a5d236fecd625b4a0eb13a1478    grantlee-5.1.0.tar.gz
> +# Locally calculated
> +sha256  139acee5746b957bdf1327ec0d97c604d4c0b9be42aec5d584297cb5ed6a990a    grantlee-5.2.0.tar.gz
>  
>  # Hash for license file
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861    COPYING.LIB
> diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
> index 575b63fef5..7079679ca4 100644
> --- a/package/grantlee/grantlee.mk
> +++ b/package/grantlee/grantlee.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -GRANTLEE_VERSION = 5.1.0
> -GRANTLEE_SITE = http://downloads.grantlee.org
> +GRANTLEE_VERSION = 5.2.0
> +GRANTLEE_SITE = $(call github,steveire,grantlee,v$(GRANTLEE_VERSION))
>  GRANTLEE_INSTALL_STAGING = YES
>  GRANTLEE_LICENSE = LGPL-2.1+
>  GRANTLEE_LICENSE_FILES = COPYING.LIB
> -- 
> 2.17.1
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
