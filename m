From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Dec 2012 13:53:37 +0100
Subject: [Buildroot] [PATCH 03/20] package/usbredir: new package
In-Reply-To: <b6f27b8d9306f0a01bd003e2c9bdc1f5c5e87128.1355435224.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 13 Dec 2012 22:47:03 +0100")
References: <cover.1355435224.git.yann.morin.1998@free.fr>
 <cover.1355435224.git.yann.morin.1998@free.fr>
 <b6f27b8d9306f0a01bd003e2c9bdc1f5c5e87128.1355435224.git.yann.morin.1998@free.fr>
Message-ID: <87mwxgiylq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Yann> Cc: Arnout Vandecappelle <arnout@mind.be>
 Yann> ---
 Yann>  package/Config.in            |    1 +
 Yann>  package/usbredir/Config.in   |   28 ++++++++++++++++++++++++++++
 Yann>  package/usbredir/usbredir.mk |   31 +++++++++++++++++++++++++++++++
 Yann>  3 files changed, 60 insertions(+), 0 deletions(-)
 Yann>  create mode 100644 package/usbredir/Config.in
 Yann>  create mode 100644 package/usbredir/usbredir.mk

 Yann> diff --git a/package/Config.in b/package/Config.in
 Yann> index 8edadf9..9d68581 100644
 Yann> --- a/package/Config.in
 Yann> +++ b/package/Config.in
 Yann> @@ -492,6 +492,7 @@ source "package/libupnp/Config.in"
 Yann>  source "package/libvncserver/Config.in"
 Yann>  source "package/nss-mdns/Config.in"
 Yann>  source "package/ortp/Config.in"
 Yann> +source "package/usbredir/Config.in"
 Yann>  source "package/zeromq/Config.in"
 Yann>  endmenu
 
 Yann> diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
 Yann> new file mode 100644
 Yann> index 0000000..8d8ac5a
 Yann> --- /dev/null
 Yann> +++ b/package/usbredir/Config.in
 Yann> @@ -0,0 +1,28 @@
 Yann> +comment "usbredir requires libusb"
 Yann> +	depends on !BR2_PACKAGE_LIBUSB
 Yann> +

We normally use select for libraries. Any reason to not use it here?

 Yann> +USBREDIR_VERSION         = 0.4.3
 Yann> +USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
 Yann> +USBREDIR_SITE            = http://spice-space.org/download/usbredir
 Yann> +USBREDIR_LICENSE         = LGPLv2.1+
 Yann> +USBREDIR_LICENSE_FILES   = COPYING.LIB
 Yann> +USBREDIR_INSTALL_STAGING = YES
 Yann> +USBREDIR_DEPENDENCIES    = libusb
 Yann> +
 Yann> +USBREDIR_DEPENDENCIES    += host-pkgconf

Any particular reason to not merge this line with the one above?

-- 
Bye, Peter Korsgaard
