From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:38:29 +0200
Subject: [Buildroot] [PATCH] uboot: add option customizing the name of
 environment image
In-Reply-To: <20171218145557.19360-1-didin@synopsys.com>
References: <20171218145557.19360-1-didin@synopsys.com>
Message-ID: <20180402003829.77272238@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 17:55:57 +0300, Evgeniy Didin wrote:
> Historically, in buildroot the name of binary environment image
> file is "uboot-env.bin". But in upstream u-boot default name
> for this file is "uboot.env":
> 
> http://git.denx.de/?p=u-boot.git;a=blob;f=env/Kconfig#l394
> 
> For some boards U-Boot environment is stored in FAT partition, not as
> a raw blob on SD-card, so the name of environment file must be correct.
> For customizing name of envimage file option BR2_TARGET_UBOOT_ENVIMAGE_FILENAME
> has been added. For backward compatibility by default value of this
> option is set to "uboot-env.bin".
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/uboot/Config.in | 8 ++++++++
>  boot/uboot/uboot.mk  | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)

In the mean time, we merged the ARC HS Development Kit development kit,
and the rename of the u-boot environment image is done directly by
genimage:

+image boot.vfat {
+  vfat {
+    files = {
+      "uImage"
+    }
+    file uboot.env {
+      image = "uboot-env.bin"
+    }
+  }
+  size = 100M
+}

This makes this patch no longer useful, so I've marked it as Rejected
in our patch tracking system. Let me know if you disagree for some
reason. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
