From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 08 Mar 2013 13:18:42 +0100
Subject: [Buildroot] [PATCH 1/3] sunxi-tools: new host package
In-Reply-To: <1362695964-20697-1-git-send-email-carlo.caione@gmail.com>
References: <1362695964-20697-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <5139D722.3010006@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/2013 11:39 PM, Carlo Caione wrote:
> Tools to help hacking Allwinner A10 (aka sun4i) based devices

Submitted a patch for the same package earlier: 
http://patchwork.ozlabs.org/patch/218616/

> +SUNXI_TOOLS_VERSION = master
> +SUNXI_TOOLS_SITE = git://github.com/linux-sunxi/sunxi-tools.git
> +
> +define HOST_SUNXI_TOOLS_BUILD_CMDS
> +	$(MAKE) -C $(@D)
> +endef

Note that sunxi-tools (at least fel) has a dependency on libusb.
Your package is assuming that is always present on the host system.


Yours sincerely,

Floris Bos
