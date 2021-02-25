From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2021 22:47:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/libuwsc: disable example
In-Reply-To: <20210221185812.3963708-1-fontaine.fabrice@gmail.com>
References: <20210221185812.3963708-1-fontaine.fabrice@gmail.com>
Message-ID: <20210225214748.GM2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-21 19:58 +0100, Fabrice Fontaine spake thusly:
> BUILD_EXAMPLE=OFF is already passed by cmake-package
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f5256d5a3a86112f008506f1910d0600c491a2a0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...001-CMakeLists.txt-add-BUILD_EXAMPLE.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
> 
> diff --git a/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch b/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
> new file mode 100644
> index 0000000000..0c5814d818
> --- /dev/null
> +++ b/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
> @@ -0,0 +1,33 @@
> +From bb71b21eb9407479ad729b3c858b0fc350fae335 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 21 Feb 2021 19:39:59 +0100
> +Subject: [PATCH] CMakeLists.txt: add BUILD_EXAMPLE
> +
> +Allow the user to disable example
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/zhaojh329/libuwsc/pull/30]
> +---
> + CMakeLists.txt | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 110d933..c52ab79 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -2,7 +2,11 @@ cmake_minimum_required(VERSION 2.8)
> + 
> + project(libuwsc C)
> + 
> ++option(BUILD_EXAMPLE "Build example" ON)
> ++
> + list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
> + 
> + add_subdirectory(src)
> +-add_subdirectory(example)
> ++if(BUILD_EXAMPLE)
> ++    add_subdirectory(example)
> ++endif()
> +-- 
> +2.30.0
> +
> -- 
> 2.30.0
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
