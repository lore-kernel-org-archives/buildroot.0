From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 22:15:51 +0200
Subject: [Buildroot] [PATCH v2 2/4] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_FW_FDT_PATH
In-Reply-To: <20210616050341.510702-3-drew@beagleboard.org>
References: <20210616050341.510702-1-drew@beagleboard.org>
 <20210616050341.510702-3-drew@beagleboard.org>
Message-ID: <20210718221551.30e3cf03@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 15 Jun 2021 22:03:41 -0700
Drew Fustini <drew@beagleboard.org> wrote:

> +config BR2_TARGET_OPENSBI_FW_FDT_PATH
> +	bool "Include U-Boot DTB in OpenSBI Payload"
> +	depends on BR2_TARGET_OPENSBI_PLAT != ""
> +	depends on BR2_TARGET_UBOOT

Both of these were not needed, as they are already part of
BR2_TARGET_OPENSBI_UBOOT_PAYLOAD, which you depend on.

> +	depends on BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
> +	select BR2_TARGET_OPENSBI_INSTALL_PAYLOAD_IMG

This select was not needed, as it's already done by
BR2_TARGET_OPENSBI_UBOOT_PAYLOAD, which you depend on.

However, I've added a "select BR2_TARGET_UBOOT_FORMAT_DTB" to make sure
u-boot.dtb gets installed in BINARIES_DIR.

Applied with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
