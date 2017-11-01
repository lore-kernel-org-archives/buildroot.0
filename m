From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 1 Nov 2017 10:05:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: fix static library
	install
In-Reply-To: <20171101072018.29979-1-bernd.kuhls@t-online.de>
References: <20171101072018.29979-1-bernd.kuhls@t-online.de>
Message-ID: <CALdGsk+D+koTEgGJjTbD5QDygM5Jg-RW2zqnfb2O1dHj1Ofj0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Olivier Schonken <olivier.schonken@gmail.com>

On 1 November 2017 at 09:20, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes
> http://autobuild.buildroot.net/results/c35/c35599e6bf09aebe456ea959d7c238
> f82090fc62/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openjpeg/0004-install-static-lib.patch | 27
> ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/openjpeg/0004-install-static-lib.patch
>
> diff --git a/package/openjpeg/0004-install-static-lib.patch
> b/package/openjpeg/0004-install-static-lib.patch
> new file mode 100644
> index 0000000000..4a3bbfa28a
> --- /dev/null
> +++ b/package/openjpeg/0004-install-static-lib.patch
> @@ -0,0 +1,27 @@
> +From 66297f07a43d2770a97c8456d20202f3d051d980 Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Mon, 9 Oct 2017 11:40:43 +0200
> +Subject: [PATCH] Unix build: fix regression of 2.3.0 where a shared-only
> or
> + static-only build lacks the installation target for the library (#1019,
> fixes
> + regression introduced by 3dfc6ca2bcf06fd1adb6b6b4cecc6c092f08ba0b)
> +
> +Downloaded from upstream commit
> +https://github.com/uclouvain/openjpeg/commit/
> 66297f07a43d2770a97c8456d20202f3d051d980
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + src/lib/openjp2/CMakeLists.txt | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/lib/openjp2/CMakeLists.txt b/src/lib/openjp2/CMakeLists.
> txt
> +index 0b4520384..f8990ccf0 100644
> +--- a/src/lib/openjp2/CMakeLists.txt
> ++++ b/src/lib/openjp2/CMakeLists.txt
> +@@ -99,6 +99,7 @@ else()
> +     set(INSTALL_LIBS ${OPENJPEG_LIBRARY_NAME} openjp2_static)
> +   else()
> +     add_library(${OPENJPEG_LIBRARY_NAME} ${OPENJPEG_SRCS})
> ++    set(INSTALL_LIBS ${OPENJPEG_LIBRARY_NAME})
> +   endif()
> + endif()
> +
> --
> 2.11.0
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171101/e67f7f3c/attachment.html>
