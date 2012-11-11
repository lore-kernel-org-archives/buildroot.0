From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 11 Nov 2012 07:11:08 +0200
Subject: [Buildroot] [PATCH 1/2 v2] neard: new package
In-Reply-To: <1352469107-25993-1-git-send-email-spdawson@gmail.com>
References: <1352469107-25993-1-git-send-email-spdawson@gmail.com>
Message-ID: <20121111051107.GA20951@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Fri, Nov 09, 2012 at 01:51:47PM +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---

[...]

> --- /dev/null
> +++ b/package/neard/neard.mk
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# neard
> +#
> +#############################################################
> +NEARD_VERSION = 0.7

Version 0.8 seems to be available. Any reason not to use that one?

> +NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
> +NEARD_INSTALL_STAGING = YES

Why is this needed? Does this package export headers needed by others?

> +NEARD_LICENSE = GPLv2
> +NEARD_LICENSE_FILES = COPYING
> +
> +NEARD_DEPENDENCIES = dbus libglib2 libnl
> +NEARD_CONF_OPT = --disable-traces
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
