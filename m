From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 19:53:58 +0200
Subject: [Buildroot] [PATCH v6 01/32] xproto_dri3proto: New package
In-Reply-To: <1399716164-6452-2-git-send-email-bernd.kuhls@t-online.de>
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
 <1399716164-6452-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140512195358.58b15414@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 10 May 2014 12:02:13 +0200, Bernd Kuhls wrote:

> diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
> index 8685ca1..087b816 100644
> --- a/package/x11r7/Config.in
> +++ b/package/x11r7/Config.in
> @@ -227,6 +227,7 @@ if BR2_PACKAGE_XORG7
>  		source package/x11r7/xproto_damageproto/Config.in
>  		source package/x11r7/xproto_dmxproto/Config.in
>  		source package/x11r7/xproto_dri2proto/Config.in
> +		source package/x11r7/xproto_dri3proto/Config.in
>  		source package/x11r7/xproto_fixesproto/Config.in
>  		source package/x11r7/xproto_fontcacheproto/Config.in
>  		source package/x11r7/xproto_fontsproto/Config.in
> diff --git a/package/x11r7/xproto_dri3proto/Config.in b/package/x11r7/xproto_dri3proto/Config.in
> new file mode 100644
> index 0000000..e4dbf23
> --- /dev/null
> +++ b/package/x11r7/xproto_dri3proto/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_XPROTO_DRI3PROTO
> +	bool "dri3proto"
> +	select BR2_PACKAGE_XUTIL_UTIL_MACROS
> +	help
> +	  X.Org DRI3 protocol headers
> diff --git a/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk b/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
> new file mode 100644
> index 0000000..0af39d1
> --- /dev/null
> +++ b/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# xproto_dri3proto
> +#
> +################################################################################
> +
> +XPROTO_DRI3PROTO_VERSION = 1.0
> +XPROTO_DRI3PROTO_SOURCE = dri3proto-$(XPROTO_DRI3PROTO_VERSION).tar.bz2
> +XPROTO_DRI3PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
> +XPROTO_DRI3PROTO_LICENSE = MIT
> +XPROTO_DRI3PROTO_LICENSE_FILES = COPYING
> +XPROTO_DRI3PROTO_INSTALL_STAGING = YES
> +XPROTO_DRI3PROTO_INSTALL_TARGET = NO
> +XPROTO_DRI3PROTO_DEPENDENCIES = xutil_util-macros
> +
> +$(eval $(autotools-package))

This looks good. I'm just wondering why we have the xutil_util-macros
dependency here. The package configure.ac looks the same as the one in
dri2proto, which does not have the xutil_util-macros dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
