From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Sep 2020 18:28:32 +0200
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: update makefile in
 order to compile wlconf
In-Reply-To: <BN6PR0101MB30731CA7C4042E36578139788B210@BN6PR0101MB3073.prod.exchangelabs.com>
References: <20200916135834.400-1-mvalabdas@distech-controls.com>
 <20200916165703.266d2cb8@windsurf.hq.k.grp>
 <BN6PR0101MB30731CA7C4042E36578139788B210@BN6PR0101MB3073.prod.exchangelabs.com>
Message-ID: <20200916182832.3ab15d33@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Sep 2020 16:14:07 +0000
"Valabdas, Miken" <mvalabdas@distech-controls.com> wrote:

> Thanks for your message.
>
> The reason why I haven't changed the
> 18XX_TI_UTILS_INSTALL_TARGET_CMDS is because this tool will be used
> in a host computer (not on the target board) in conjunction with
> BR2_ROOTFS_POST_IMAGE_SCRIPT.
>
> In resume, this tool will be used by a script through
> BR2_ROOTFS_POST_IMAGE_SCRIPT. The script itself will install the
> appropriate output (after doing some stuffs).

OK, so this tool is built with the host compiler, and runs on the host
machine. It seems weird as you're passing CFLAGS="$(TARGET_CFLAGS) ..."
for example.

Also, a host tool should be installed in $(HOST_DIR)/bin or
$(HOST_DIR)/sbin.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
