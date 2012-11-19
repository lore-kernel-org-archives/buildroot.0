From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 19 Nov 2012 12:09:09 +0000
Subject: [Buildroot] [PATCH] x11r7: deprecate a number of unused old
 X.org video drivers
In-Reply-To: <1353192419-5405-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1353192419-5405-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <50AA2165.2090807@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/11/2012 22:46, Thomas Petazzoni wrote:
> Amongst the large number of X.org video drivers that are packaged in
> Buildroot, a number of them are related to very old hardware that
> presumably nobody uses anymore, at least for embedded Linux
> developments.
>
> Mark those drivers as deprecated so that we might remove them in the
> future if nobody comes up to say that they are using such drivers.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Once a resolution is found to the mesa3d problem and committed I will 
try again to get my x11r7.7 patches upstream that removes all old 
modules from X.

In the mean time this looks sensible.

> ---
>   package/x11r7/xdriver_xf86-video-apm/Config.in     |    1 +
>   package/x11r7/xdriver_xf86-video-ark/Config.in     |    1 +
>   package/x11r7/xdriver_xf86-video-ast/Config.in     |    1 +
>   package/x11r7/xdriver_xf86-video-chips/Config.in   |    1 +
>   package/x11r7/xdriver_xf86-video-glide/Config.in   |    1 +
>   package/x11r7/xdriver_xf86-video-glint/Config.in   |    1 +
>   package/x11r7/xdriver_xf86-video-i128/Config.in    |    1 +
>   package/x11r7/xdriver_xf86-video-i740/Config.in    |    1 +
>   package/x11r7/xdriver_xf86-video-mach64/Config.in  |    1 +
>   package/x11r7/xdriver_xf86-video-mga/Config.in     |    1 +
>   .../x11r7/xdriver_xf86-video-neomagic/Config.in    |    1 +
>   package/x11r7/xdriver_xf86-video-newport/Config.in |    1 +
>   package/x11r7/xdriver_xf86-video-r128/Config.in    |    1 +
>   .../x11r7/xdriver_xf86-video-rendition/Config.in   |    1 +
>   package/x11r7/xdriver_xf86-video-s3/Config.in      |    1 +
>   package/x11r7/xdriver_xf86-video-s3virge/Config.in |    1 +
>   package/x11r7/xdriver_xf86-video-savage/Config.in  |    1 +
>   .../xdriver_xf86-video-siliconmotion/Config.in     |    1 +
>   package/x11r7/xdriver_xf86-video-sis/Config.in     |    1 +
>   package/x11r7/xdriver_xf86-video-sisusb/Config.in  |    1 +
>   package/x11r7/xdriver_xf86-video-suncg14/Config.in |    1 +
>   package/x11r7/xdriver_xf86-video-suncg3/Config.in  |    1 +
>   package/x11r7/xdriver_xf86-video-suncg6/Config.in  |    1 +
>   package/x11r7/xdriver_xf86-video-sunffb/Config.in  |    1 +
>   package/x11r7/xdriver_xf86-video-sunleo/Config.in  |    1 +
>   package/x11r7/xdriver_xf86-video-suntcx/Config.in  |    1 +
>   package/x11r7/xdriver_xf86-video-tdfx/Config.in    |    1 +
>   package/x11r7/xdriver_xf86-video-tga/Config.in     |    1 +
>   package/x11r7/xdriver_xf86-video-trident/Config.in |    1 +
>   package/x11r7/xdriver_xf86-video-tseng/Config.in   |    1 +
>   package/x11r7/xdriver_xf86-video-voodoo/Config.in  |    1 +
>   package/x11r7/xdriver_xf86-video-wsfb/Config.in    |    1 +
>   package/x11r7/xdriver_xf86-video-xgi/Config.in     |    1 +
>   package/x11r7/xdriver_xf86-video-xgixp/Config.in   |    1 +
>   34 files changed, 34 insertions(+)
>
> diff --git a/package/x11r7/xdriver_xf86-video-apm/Config.in b/package/x11r7/xdriver_xf86-video-apm/Config.in
> index dea5258..b4b852c 100644
> --- a/package/x11r7/xdriver_xf86-video-apm/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-apm/Config.in
> @@ -8,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Alliance ProMotion video driver
> diff --git a/package/x11r7/xdriver_xf86-video-ark/Config.in b/package/x11r7/xdriver_xf86-video-ark/Config.in
> index d9703de..c58401d 100644
> --- a/package/x11r7/xdriver_xf86-video-ark/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-ark/Config.in
> @@ -6,5 +6,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  X.Org driver for ark cards
> diff --git a/package/x11r7/xdriver_xf86-video-ast/Config.in b/package/x11r7/xdriver_xf86-video-ast/Config.in
> index b2a0bc8..8d255c1 100644
> --- a/package/x11r7/xdriver_xf86-video-ast/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-ast/Config.in
> @@ -1,4 +1,5 @@
>   config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST
>   	bool "xf86-video-ast"
> +	depends on BR2_DEPRECATED
>   	help
>   	  No description available
> diff --git a/package/x11r7/xdriver_xf86-video-chips/Config.in b/package/x11r7/xdriver_xf86-video-chips/Config.in
> index 29a99ec..77f4a7b 100644
> --- a/package/x11r7/xdriver_xf86-video-chips/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-chips/Config.in
> @@ -6,5 +6,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_VIDEOPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Chips and Technologies video driver
> diff --git a/package/x11r7/xdriver_xf86-video-glide/Config.in b/package/x11r7/xdriver_xf86-video-glide/Config.in
> index ea9abd7..d3a581b 100644
> --- a/package/x11r7/xdriver_xf86-video-glide/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-glide/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
>   	select BR2_PACKAGE_XPROTO_VIDEOPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
>   	depends on BROKEN # needs glide library from http://glide.sourceforge.net/
> +	depends on BR2_DEPRECATED
>   	help
>   	  video driver for glide device
> diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
> index 782b6da..9393aac 100644
> --- a/package/x11r7/xdriver_xf86-video-glint/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-glint/Config.in
> @@ -12,5 +12,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
>   	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
>   	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  GLINT/Permedia video driver
> diff --git a/package/x11r7/xdriver_xf86-video-i128/Config.in b/package/x11r7/xdriver_xf86-video-i128/Config.in
> index a66fda6..737a01a 100644
> --- a/package/x11r7/xdriver_xf86-video-i128/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-i128/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128
>   	select BR2_PACKAGE_XPROTO_VIDEOPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Number 9 I128 video driver
> diff --git a/package/x11r7/xdriver_xf86-video-i740/Config.in b/package/x11r7/xdriver_xf86-video-i740/Config.in
> index 9d1a040..85b073e 100644
> --- a/package/x11r7/xdriver_xf86-video-i740/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-i740/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740
>   	select BR2_PACKAGE_XPROTO_VIDEOPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Intel i740 video driver
> diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
> index f2464e7..d1e5e57 100644
> --- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  mach64 video driver
> diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
> index 40c6f3a..bbcffb7 100644
> --- a/package/x11r7/xdriver_xf86-video-mga/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-mga/Config.in
> @@ -11,5 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Matrox video driver
> diff --git a/package/x11r7/xdriver_xf86-video-neomagic/Config.in b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
> index 2e028a7..e015b4f 100644
> --- a/package/x11r7/xdriver_xf86-video-neomagic/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
> @@ -8,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Neomagic video driver
> diff --git a/package/x11r7/xdriver_xf86-video-newport/Config.in b/package/x11r7/xdriver_xf86-video-newport/Config.in
> index e2effe8..820c824 100644
> --- a/package/x11r7/xdriver_xf86-video-newport/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-newport/Config.in
> @@ -6,5 +6,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_VIDEOPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Newport video driver
> diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
> index 96bd8d7..56bb2bc 100644
> --- a/package/x11r7/xdriver_xf86-video-r128/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-r128/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  R128 video driver
> diff --git a/package/x11r7/xdriver_xf86-video-rendition/Config.in b/package/x11r7/xdriver_xf86-video-rendition/Config.in
> index 9238aec..8558894 100644
> --- a/package/x11r7/xdriver_xf86-video-rendition/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-rendition/Config.in
> @@ -6,5 +6,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Rendition video driver
> diff --git a/package/x11r7/xdriver_xf86-video-s3/Config.in b/package/x11r7/xdriver_xf86-video-s3/Config.in
> index 1091028..6d8d1df 100644
> --- a/package/x11r7/xdriver_xf86-video-s3/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-s3/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3
>   	select BR2_PACKAGE_XPROTO_VIDEOPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  X.Org driver for s3 cards
> diff --git a/package/x11r7/xdriver_xf86-video-s3virge/Config.in b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
> index 6f31864..7bdf3c4 100644
> --- a/package/x11r7/xdriver_xf86-video-s3virge/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE
>   	select BR2_PACKAGE_XPROTO_VIDEOPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  S3 ViRGE video driver
> diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
> index a9c8f6c..16f249c 100644
> --- a/package/x11r7/xdriver_xf86-video-savage/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-savage/Config.in
> @@ -10,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  S3 Savage video driver
> diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
> index db15116..6216167 100644
> --- a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
>   	select BR2_PACKAGE_XPROTO_VIDEOPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Silicon Motion video driver
> diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
> index ac2b632..f88a549 100644
> --- a/package/x11r7/xdriver_xf86-video-sis/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
> @@ -12,5 +12,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
>   	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
>   	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  SiS and XGI video driver
> diff --git a/package/x11r7/xdriver_xf86-video-sisusb/Config.in b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
> index b00a8a7..ecb4faf 100644
> --- a/package/x11r7/xdriver_xf86-video-sisusb/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
> @@ -8,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  SiS USB video driver
> diff --git a/package/x11r7/xdriver_xf86-video-suncg14/Config.in b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
> index 661c179..89d836c 100644
> --- a/package/x11r7/xdriver_xf86-video-suncg14/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
> @@ -5,5 +5,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14
>   	select BR2_PACKAGE_XPROTO_RANDRPROTO
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  CG14 video driver
> diff --git a/package/x11r7/xdriver_xf86-video-suncg3/Config.in b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
> index 539a95a..79024f8 100644
> --- a/package/x11r7/xdriver_xf86-video-suncg3/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
> @@ -5,5 +5,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3
>   	select BR2_PACKAGE_XPROTO_RANDRPROTO
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  CG3 video driver
> diff --git a/package/x11r7/xdriver_xf86-video-suncg6/Config.in b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
> index 9496f8d..c9203d7 100644
> --- a/package/x11r7/xdriver_xf86-video-suncg6/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
> @@ -5,5 +5,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6
>   	select BR2_PACKAGE_XPROTO_RANDRPROTO
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  GX/Turbo GX video driver
> diff --git a/package/x11r7/xdriver_xf86-video-sunffb/Config.in b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
> index 76f5b9a..807db91 100644
> --- a/package/x11r7/xdriver_xf86-video-sunffb/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
> @@ -8,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  SUNFFB video driver
> diff --git a/package/x11r7/xdriver_xf86-video-sunleo/Config.in b/package/x11r7/xdriver_xf86-video-sunleo/Config.in
> index 29d24a2..b480448 100644
> --- a/package/x11r7/xdriver_xf86-video-sunleo/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-sunleo/Config.in
> @@ -5,5 +5,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO
>   	select BR2_PACKAGE_XPROTO_RANDRPROTO
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Leo video driver
> diff --git a/package/x11r7/xdriver_xf86-video-suntcx/Config.in b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
> index 3c82739..c0aaa8f 100644
> --- a/package/x11r7/xdriver_xf86-video-suntcx/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
> @@ -5,5 +5,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX
>   	select BR2_PACKAGE_XPROTO_RANDRPROTO
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  TCX video driver
> diff --git a/package/x11r7/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
> index 57bb411..f60b7a7 100644
> --- a/package/x11r7/xdriver_xf86-video-tdfx/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
> @@ -10,5 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  3Dfx video driver
> diff --git a/package/x11r7/xdriver_xf86-video-tga/Config.in b/package/x11r7/xdriver_xf86-video-tga/Config.in
> index 800a8f6..54ffb3d 100644
> --- a/package/x11r7/xdriver_xf86-video-tga/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-tga/Config.in
> @@ -8,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  X.Org driver for tga cards
> diff --git a/package/x11r7/xdriver_xf86-video-trident/Config.in b/package/x11r7/xdriver_xf86-video-trident/Config.in
> index 4a7a477..805f58f 100644
> --- a/package/x11r7/xdriver_xf86-video-trident/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-trident/Config.in
> @@ -8,5 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Trident video driver
> diff --git a/package/x11r7/xdriver_xf86-video-tseng/Config.in b/package/x11r7/xdriver_xf86-video-tseng/Config.in
> index f72b87b..f58fa69 100644
> --- a/package/x11r7/xdriver_xf86-video-tseng/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-tseng/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG
>   	select BR2_PACKAGE_XPROTO_VIDEOPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Tseng Labs video driver
> diff --git a/package/x11r7/xdriver_xf86-video-voodoo/Config.in b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
> index 9b770be..4cffbf7 100644
> --- a/package/x11r7/xdriver_xf86-video-voodoo/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  Voodoo video driver
> diff --git a/package/x11r7/xdriver_xf86-video-wsfb/Config.in b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
> index 3b3d406..e8ed01f 100644
> --- a/package/x11r7/xdriver_xf86-video-wsfb/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
>   	depends on BROKEN # Fails to build. Actually this is OpenBSD/NetBSD stuff.
> +	depends on BR2_DEPRECATED
>   	help
>   	  WSFB based chips video driver
> diff --git a/package/x11r7/xdriver_xf86-video-xgi/Config.in b/package/x11r7/xdriver_xf86-video-xgi/Config.in
> index d0fe665..f630a6c 100644
> --- a/package/x11r7/xdriver_xf86-video-xgi/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-xgi/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  XGI based chips video driver
> diff --git a/package/x11r7/xdriver_xf86-video-xgixp/Config.in b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
> index 8d466f4..8b11e96 100644
> --- a/package/x11r7/xdriver_xf86-video-xgixp/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
> @@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
>   	select BR2_PACKAGE_XPROTO_RENDERPROTO
>   	select BR2_PACKAGE_XPROTO_XEXTPROTO
>   	select BR2_PACKAGE_XPROTO_XPROTO
> +	depends on BR2_DEPRECATED
>   	help
>   	  XGIXP based chips video driver
>


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
