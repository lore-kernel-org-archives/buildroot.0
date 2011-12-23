From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 23 Dec 2011 16:37:55 -0600
Subject: [Buildroot] [PATCH] Xorg and Tslib
In-Reply-To: <CAKm6Z3UVRFhfa68gRWXu0Oj1UD0vGh6T0p93uL8C=r2xt_ijgQ@mail.gmail.com>
References: <CAKm6Z3Vnevex7hjJo7DxQRX_pnS6L1foeih=m=cQgttG7ZeaNQ@mail.gmail.com>
 <CAKm6Z3UVRFhfa68gRWXu0Oj1UD0vGh6T0p93uL8C=r2xt_ijgQ@mail.gmail.com>
Message-ID: <201112231637.59428.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri December 23 2011, Sergio Prado wrote:
>

Pardon a small bit of nit-picking...

> Sorry, I forgot to send it in rich text format. Here is the patch again:
>

Plain text works best for patches.
 
> ---
>  package/x11r7/Config.in                            |    1 +
>  package/x11r7/xdriver_xf86-input-tslib/Config.in   |    8 ++++++++
>  .../xdriver_xf86-input-tslib.mk                    |   13 +++++++++++++
>  3 files changed, 22 insertions(+), 0 deletions(-)
>  create mode 100644 package/x11r7/xdriver_xf86-input-tslib/Config.in
>  create mode 100644 package/x11r7/xdriver_xf86-input-tslib/
> xdriver_xf86-input-tslib.mk
> 
> diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
> index 50816f2..af55939 100644
> --- a/package/x11r7/Config.in
> +++ b/package/x11r7/Config.in
> @@ -176,6 +176,7 @@ endmenu
>   source package/x11r7/xdriver_xf86-input-synaptics/Config.in
>   source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
>   source package/x11r7/xdriver_xf86-input-void/Config.in
> + source package/x11r7/xdriver_xf86-input-tslib/Config.in

T before V 

Mike
>   source package/x11r7/xdriver_xf86-video-apm/Config.in
>   source package/x11r7/xdriver_xf86-video-ark/Config.in
>   source package/x11r7/xdriver_xf86-video-ast/Config.in
> diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in
> b/package/x11r7/xdriver_xf86-input-tslib/Config.in
> new file mode 100644
> index 0000000..4c3f719
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
> + bool "xf86-input-tslib"
> + select BR2_PACKAGE_XPROTO_INPUTPROTO
> + select BR2_PACKAGE_XSERVER_XORG_SERVER
> + select BR2_PACKAGE_XPROTO_RANDRPROTO
> + select BR2_PACKAGE_XPROTO_XPROTO
> + help
> +  Touch screen library input driver
> diff --git a/package/x11r7/xdriver_xf86-input-tslib/
> xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/
> xdriver_xf86-input-tslib.mk
> new file mode 100644
> index 0000000..b6455e7
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# xdriver_xf86-input-tslib -- Touch screen library input driver
> +#
> +################################################################################
> +
> +XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
> +XDRIVER_XF86_INPUT_TSLIB_SOURCE =
> xf86-input-tslib_$(XDRIVER_XF86_INPUT_TSLIB_VERSION).orig.tar.gz
> +XDRIVER_XF86_INPUT_TSLIB_SITE =
> http://ftp.de.debian.org/debian/pool/main/x/xf86-input-tslib/
> +XDRIVER_XF86_INPUT_TSLIB_AUTORECONF = NO
> +XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = xproto_inputproto
> xserver_xorg-server xproto_randrproto xproto_xproto
> +
> +$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-tslib))
