From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 11 Dec 2020 06:37:08 +0100
Subject: [Buildroot] [RFC v2] package/ninja: fix to be cmake-3.10
 compatible again
In-Reply-To: <20201210215405.12318-1-ps.report@gmx.net>
References: <20201210215405.12318-1-ps.report@gmx.net>
Message-ID: <CAGm1_kuufhqwTTyUeLBcqY5FA7X3U99Or+JVG4d+PxfGsH1c8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 10, 2020 at 10:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Fixes (see [1]):
>
> ToDo: ...
>
> [1] http://lists.busybox.net/pipermail/buildroot/2020-December/298159.html
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Works like a charm.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Regards,
Yegor

> ---
> Changes v1 -> v2:
>   - really use COMPILE_FLAGS (as the patch subject says)
>     (suggested by Yegor Yefremov)
> ---
>  ...onform-COMPILE_FLAGS-instead-of-3.15.patch | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
>
> diff --git a/package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch b/package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> new file mode 100644
> index 0000000000..d92959a938
> --- /dev/null
> +++ b/package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> @@ -0,0 +1,27 @@
> +From 71840d514511291410d514790c25956be9d4dfe5 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Thu, 10 Dec 2020 20:29:19 +0100
> +Subject: [PATCH] use cmake-3.10 conform COMPILE_FLAGS instead of 3.15
> + INCLUDE_DIRECTORIES property
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7f03c35..f582d2f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -156,7 +156,7 @@ if(platform_supports_ninja_browse)
> +       set_source_files_properties(src/browse.cc
> +               PROPERTIES
> +                       OBJECT_DEPENDS "${CMAKE_BINARY_DIR}/build/browse_py.h"
> +-                      INCLUDE_DIRECTORIES "${CMAKE_BINARY_DIR}"
> ++                      COMPILE_FLAGS "-I${CMAKE_BINARY_DIR}"
> +                       COMPILE_DEFINITIONS NINJA_PYTHON="python"
> +       )
> + endif()
> +--
> +2.29.2
> +
> --
> 2.29.2
>
