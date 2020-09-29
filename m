From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 29 Sep 2020 22:59:28 +0200
Subject: [Buildroot] [RFC PATCH 4/4] clang: Fix undefined reference to
 dladdr error
In-Reply-To: <20200929102618.28571-5-qais.yousef@arm.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
 <20200929102618.28571-5-qais.yousef@arm.com>
Message-ID: <9384100b-8c1d-9982-cd27-b2f6ed03dddf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Qais,

Le 29/09/2020 ? 12:26, Qais Yousef a ?crit?:
> For some reason the cmake::find_library() can't detect the path to dl,
> so we end up not including the right library when linking, hence the
> error above.
> 
> Could be a hack/workaround to the real problem.

I'm not sure about this patch. Can you describe how to reproduce the issue?

Best regards,
Romain

> 
> Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> ---
>  .../0001-fix-undefined-reference-to-dladdr.patch    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/clang/0001-fix-undefined-reference-to-dladdr.patch
> 
> diff --git a/package/clang/0001-fix-undefined-reference-to-dladdr.patch b/package/clang/0001-fix-undefined-reference-to-dladdr.patch
> new file mode 100644
> index 0000000000..b28c6a463c
> --- /dev/null
> +++ b/package/clang/0001-fix-undefined-reference-to-dladdr.patch
> @@ -0,0 +1,13 @@
> +--- ./tools/libclang/CMakeLists.txt.old	2020-08-02 10:17:54.995944248 +0100
> ++++ ./tools/libclang/CMakeLists.txt	2020-08-02 10:20:56.150147251 +0100
> +@@ -58,10 +58,7 @@
> +   endif()
> + endif ()
> + 
> +-find_library(DL_LIBRARY_PATH dl)
> +-if (DL_LIBRARY_PATH)
> +   list(APPEND LIBS dl)
> +-endif()
> + 
> + option(LIBCLANG_BUILD_STATIC
> +   "Build libclang as a static library (in addition to a shared one)" OFF)
> 
