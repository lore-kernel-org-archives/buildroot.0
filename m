From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2020 19:51:14 +0100
Subject: [Buildroot] [PATCH v2 1/1] libuv, uvw: bump to versions 1.34.0,
 2.3.0_libuv-v1.34
In-Reply-To: <20200109173206.25322-1-asafka7@gmail.com>
References: <20200109173206.25322-1-asafka7@gmail.com>
Message-ID: <20200109185114.GO17943@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2020-01-09 19:32 +0200, Asaf Kahlon spake thusly:
> Remove uvw patch (now on upstream).
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v1->v2: bump libuv and uvw in the same patch.
> ---
>  package/libuv/libuv.hash                      |  2 +-
>  package/libuv/libuv.mk                        |  2 +-
>  ...-CMakeLists.txt-add-BUILD_DOC-option.patch | 28 -------------------
>  package/uvw/uvw.hash                          |  2 +-
>  package/uvw/uvw.mk                            |  2 +-
>  5 files changed, 4 insertions(+), 32 deletions(-)
>  delete mode 100644 package/uvw/0001-CMakeLists.txt-add-BUILD_DOC-option.patch
> 
> diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
> index 3890c8af94..e49822ad0d 100644
> --- a/package/libuv/libuv.hash
> +++ b/package/libuv/libuv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  63794499bf5da1720e249d3fc14ff396b70b8736effe6ce5b4e47e0f3d476467  libuv-1.33.1.tar.gz
> +sha256  2c36b49bcf82c0d06ab0d77f98805605efa071d58ca29dee7c790912598b005d  libuv-1.34.0.tar.gz
>  sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
> diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
> index 618b25d5f6..4865c54551 100644
> --- a/package/libuv/libuv.mk
> +++ b/package/libuv/libuv.mk
> @@ -6,7 +6,7 @@
>  
>  # When bumping libuv, check if a new version of uvw is available
>  # and bump it too.
> -LIBUV_VERSION = 1.33.1
> +LIBUV_VERSION = 1.34.0
>  LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
>  LIBUV_DEPENDENCIES = host-pkgconf
>  LIBUV_INSTALL_STAGING = YES
> diff --git a/package/uvw/0001-CMakeLists.txt-add-BUILD_DOC-option.patch b/package/uvw/0001-CMakeLists.txt-add-BUILD_DOC-option.patch
> deleted file mode 100644
> index ae52362fa1..0000000000
> --- a/package/uvw/0001-CMakeLists.txt-add-BUILD_DOC-option.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 8038b6343466b9a58fd5ef5f13d3255ecbfce5aa Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 31 Oct 2019 13:41:04 +0100
> -Subject: [PATCH] CMakeLists.txt: add BUILD_DOC option
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/skypjack/uvw/pull/165]
> ----
> - CMakeLists.txt | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 9fc5538..da6a02d 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -62,7 +62,8 @@ find_package(Doxygen 1.8)
> - # Referenced directories and targets
> - #
> - 
> --if(DOXYGEN_FOUND)
> -+option(BUILD_DOC "Build documentation" ON)
> -+if(BUILD_DOC AND DOXYGEN_FOUND)
> -     add_subdirectory(docs)
> - endif()
> - 
> --- 
> -2.23.0
> -
> diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
> index e6129e559d..0fd93d3924 100644
> --- a/package/uvw/uvw.hash
> +++ b/package/uvw/uvw.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  266a354f0c64a8e85f29b10f20f4d08a35bc1e8caa7cc94a8afecf9ca43f4442  uvw-2.2.0_libuv-v1.33.tar.gz
> +sha256  e10b3ea2df202ef8de24b9922cc30f4de89f30ed4533a6ebfc9d979e7b7c66aa  uvw-2.3.0_libuv-v1.34.tar.gz
>  sha256  ea786619b4d1b2ba0a188e923111122dfefea1d01c86e37f9e8c80bdbc3ea400  LICENSE
> diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
> index 2e46721b52..46ee05bb08 100644
> --- a/package/uvw/uvw.mk
> +++ b/package/uvw/uvw.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UVW_VERSION = 2.2.0_libuv-v1.33
> +UVW_VERSION = 2.3.0_libuv-v1.34
>  UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
>  UVW_INSTALL_STAGING = YES
>  UVW_INSTALL_TARGET = NO
> -- 
> 2.20.1
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
