From: Julian Lunz <git@jlunz.de>
Date: Wed, 23 May 2012 23:49:03 +0200
Subject: [Buildroot] [PATCH] New package: freerdp
In-Reply-To: <87fwaqpq4x.fsf@macbook.be.48ers.dk>
References: <1337806267-32327-1-git-send-email-git@jlunz.de>
 <87fwaqpq4x.fsf@macbook.be.48ers.dk>
Message-ID: <20120523234903.209dc90d@jl-desk-LL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

thanks for your quick reply and comments.
Fixed the patch according to your proposals.

Other git send-email failed a bit, therefore seperate mails.

Best regards,
Julian


On Wed, 23 May 2012 23:02:38 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Julian" == Julian Lunz <git@jlunz.de> writes:
> 
> Hi,
> 
>  Julian> Signed-off-by: Julian Lunz <git@jlunz.de>
>  Julian> ---
>  Julian>  package/Config.in          |    1 +
>  Julian>  package/freerdp/Config.in  |   11 +++++++++++
>  Julian>  package/freerdp/freerdp.mk |   13 +++++++++++++
>  Julian>  3 files changed, 25 insertions(+), 0 deletions(-)
>  Julian>  create mode 100644 package/freerdp/Config.in
>  Julian>  create mode 100644 package/freerdp/freerdp.mk
> 
>  Julian> diff --git a/package/Config.in b/package/Config.in
>  Julian> index fb1b08f..2d1f18d 100644
>  Julian> --- a/package/Config.in
>  Julian> +++ b/package/Config.in
>  Julian> @@ -152,6 +152,7 @@ source "package/leafpad/Config.in"
>  Julian>  source "package/midori/Config.in"
>  Julian>  source "package/pcmanfm/Config.in"
>  Julian>  source "package/rdesktop/Config.in"
>  Julian> +source "package/freerdp/Config.in"
> 
> 
> I know it logically belong with rdesktop, but we normally sort these
> sort lines alphabetically.
> 
> 
>  Julian>  source "package/sylpheed/Config.in"
>  Julian>  source "package/synergy/Config.in"
>  Julian>  source "package/torsmo/Config.in"
>  Julian> diff --git a/package/freerdp/Config.in
>  Julian> b/package/freerdp/Config.in new file mode 100644
>  Julian> index 0000000..1cc49c9
>  Julian> --- /dev/null
>  Julian> +++ b/package/freerdp/Config.in
>  Julian> @@ -0,0 +1,11 @@
>  Julian> +config BR2_PACKAGE_FREERDP
>  Julian> +	bool "freerdp"
>  Julian> +	select BR2_PACKAGE_OPENSSL
>  Julian> +	select BR2_PACKAGE_XLIB_LIBX11
>  Julian> +	select BR2_PACKAGE_XLIB_LIBXT
>  Julian> +	depends on BR2_PACKAGE_XORG7
>  Julian> +	help
>  Julian> +	  FreeRDPFreeRDP is a free implementation of the 
>  Julian> +	  Remote Desktop Protocol (RDP), released under the
>  Julian> Apache license +
>  Julian> +	  http://www.freerdp.com/
>  Julian> diff --git a/package/freerdp/freerdp.mk
>  Julian> b/package/freerdp/freerdp.mk new file mode 100644
>  Julian> index 0000000..61b6ca2
>  Julian> --- /dev/null
>  Julian> +++ b/package/freerdp/freerdp.mk
>  Julian> @@ -0,0 +1,13 @@
>  Julian> +#############################################################
>  Julian> +#
>  Julian> +# FreeRDP
>  Julian> +#
>  Julian> +#############################################################
>  Julian> +
>  Julian> +FREERDP_VERSION = 1.0.1
>  Julian> +FREERDP_SOURCE = freerdp-$(FREERDP_VERSION).tar.gz
>  Julian> +FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
>  Julian> +FREERDP_CONF_OPT = -DWITH_CUPS=OFF -DWITH_FFMPEG=OFF
>  Julian> -DWITH_ALSA=OFF -DWITH_XINERAMA=OFF
> 
> We do have packages for cups, ffmpeg, alsa and libXinerama in
> buildroot, so it would be good to add optional support for these -
> E.G.:
> 
> ifeq ($(BR2_PACKAGE_CUPS),y)
> FREERDP_DEPENDENCIES += cups
> else
> FREERDP_CONF_OPT += -DWITH_CUPS=OFF
> endif
> ..
> 
>  Julian> +FREERDP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt zlib
> 
> You don't select BR2_PACKAGE_ZLIB in Config.in, but you have it here?
> 
> Otherwise it looks good. Care to fix and resend?
> 
