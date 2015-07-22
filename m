From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Jul 2015 12:01:57 +0300
Subject: [Buildroot] [PATCH] libiio: Add a patch from upstream to fix
 building without a C++ compiler
In-Reply-To: <1437554705-24757-1-git-send-email-paul.cercueil@analog.com>
References: <1437554705-24757-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <20150722090157.GH13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

On Wed, Jul 22, 2015 at 10:45:05AM +0200, Paul Cercueil wrote:
> This fixes a build issue reported by the autobuilder.

Please add a link to the autobuild failure.

> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> ---
>  ...ake-fix-build-on-unix-systems-without-cpp.patch | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch
> 
> diff --git a/package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch b/package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch
> new file mode 100644
> index 0000000..4839a39
> --- /dev/null
> +++ b/package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch
> @@ -0,0 +1,36 @@
> +From 2e6fa357ffbe755bfecaecad4fc82e3307fe2831 Mon Sep 17 00:00:00 2001
> +From: Paul Cercueil <paul.cercueil@analog.com>
> +Date: Wed, 22 Jul 2015 10:25:01 +0200
> +Subject: [PATCH] CMake: Fix build on UNIX systems without a C++ compiler
> +

Please add a note on the upstream status of this patch.

> +Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> +---
> + bindings/csharp/CMakeLists.txt | 2 +-
> + bindings/python/CMakeLists.txt | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/bindings/csharp/CMakeLists.txt b/bindings/csharp/CMakeLists.txt
> +index 8aafb8f..fceab88 100644
> +--- a/bindings/csharp/CMakeLists.txt
> ++++ b/bindings/csharp/CMakeLists.txt
> +@@ -1,5 +1,5 @@
> + cmake_minimum_required(VERSION 2.8.7)
> +-project(libiio-sharp)
> ++project(libiio-sharp LANGUAGES NONE)
> + 
> + find_program(MCS_EXECUTABLE
> + 	NAMES mcs csc
> +diff --git a/bindings/python/CMakeLists.txt b/bindings/python/CMakeLists.txt
> +index 22ffdb4..76ceae8 100644
> +--- a/bindings/python/CMakeLists.txt
> ++++ b/bindings/python/CMakeLists.txt
> +@@ -1,5 +1,5 @@
> + cmake_minimum_required(VERSION 2.8.7)
> +-project(libiio-py)
> ++project(libiio-py LANGUAGES NONE)
> + 
> + include(FindPythonInterp)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
