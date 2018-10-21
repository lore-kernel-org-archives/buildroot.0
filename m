From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun, 21 Oct 2018 12:53:45 +0200
Subject: [Buildroot] [PATCH 2/6] package/mesa3d: enable OpenCL support
In-Reply-To: <20181020221437.12687-3-thomas.petazzoni@bootlin.com>
References: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
 <20181020221437.12687-3-thomas.petazzoni@bootlin.com>
Message-ID: <4f7be120-98ed-8c1c-3f01-fb35dbad27cb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> From: Valentin Korenblit <valentinkorenblit@gmail.com>
>
> This patch provides Clover, the OpenCL 1.1 API implementation by Mesa
> for AMD GPUs. It generates libOpenCL.so.
>
> Add --disable-opencl-icd because in Mesa 18 it defaults to on.  When
> disabled, the shared library is named libOpenCL instead of
> libMesaOpenCL and CL headers are installed.
>
> Given that clc headers are being installed to a non-standard location,
> it is necessary to specify this path in configure.ac. Otherwise,
> pkg-config will output the absolute path to these headers located in
> STAGING_DIR, which will cause a runtime error when calling
> clBuildProgram.
>
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
> [Thomas:
>   - improve the description of the patch, based on input from Romain
>   - register as a libopencl provider]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch | 37 +++++++++++++++++++++++++
>   package/mesa3d/Config.in                        | 14 ++++++++++
>   package/mesa3d/mesa3d.mk                        | 12 +++++++-
>   3 files changed, 62 insertions(+), 1 deletion(-)
>   create mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
>
> diff --git a/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
> new file mode 100644
> index 0000000000..42ae826a36
> --- /dev/null
> +++ b/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
> @@ -0,0 +1,37 @@
> +From 94bceeb621e36f3188c6246a763def8695526578 Mon Sep 17 00:00:00 2001
> +From: Valentin Korenblit <valentinkorenblit@gmail.com>
> +Date: Sat, 20 Oct 2018 10:56:23 +0200
> +Subject: [PATCH] Set proper value for LIBCLC_INCLUDEDIR
> +
> +LIBCLC_INCLUDEDIR is the location where mesa3d OpenCL implementation
> +will look for OpenCL "headers" on the target, when building the OpenCL
> +kernels.

Maybe it is clearer to write "OpenCL library headers", so we don't get confused
with Khronos OpenCL-Headers.

Valentin

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181021/079a66b8/attachment.html>
