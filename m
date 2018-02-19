From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 19 Feb 2018 11:00:40 +0100
Subject: [Buildroot] [PATCH 1/3] imx-mkimage: new package
In-Reply-To: <1518960511-4823-2-git-send-email-karl.erik.larsson@gmail.com>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
 <1518960511-4823-2-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180219100040.GB10694@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 18, 2018 at 02:28:29PM +0100, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Ask Christopher if he should be stated here as well.

> +################################################################################
> +#
> +# imx-mkimage
> +#
> +################################################################################
> +
> +IMX_MKIMAGE_VERSION = imx_4.9.51_imx8m_beta
> +IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
> +IMX_MKIMAGE_SITE_METHOD = git
> +IMX_MKIMAGE_LICENSE = GPL-2.0

This should actually be GPL-2.0+ as stated in several source files... despite our internal review.

> +IMX_MKIMAGE_LICENSE_FILES = iMX8dv/COPYING
> +
> +define HOST_IMX_MKIMAGE_BUILD_CMDS
> +	$(MAKE) -C $(@D)/iMX8M -f soc.mak mkimage_imx8
> +endef
> +
> +define HOST_IMX_MKIMAGE_INSTALL_CMDS
> +	mkdir -p $(HOST_DIR)/bin
> +	$(INSTALL) -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin
> +	$(INSTALL) -m 755 $(@D)/iMX8M/mkimage_fit_atf.sh $(HOST_DIR)/bin
> +endef
> +
> +$(eval $(host-generic-package))
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Best regards
Marcus Folkesson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180219/8638281e/attachment.asc>
