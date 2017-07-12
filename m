From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 15:39:40 +0200
Subject: [Buildroot] [PATCH] configs: nexbox_a95x_defconfig: bump to
 kernel 4.12
In-Reply-To: <20170712122322.12281-1-peter@korsgaard.com>
References: <20170712122322.12281-1-peter@korsgaard.com>
Message-ID: <20170712153940.610cae5e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 14:23:22 +0200, Peter Korsgaard wrote:
> Main difference is that the drm driver now supports the hdmi output.
> 
> The gxl variant device tree has been renamed in:
> 
> commit 7eea67101b9713ae438955e8899b3c4b078419f9
> Author: Kevin Hilman <khilman@baylibre.com>
> Date:   Fri Jan 20 07:57:52 2017 -0800
> 
>     ARM64: dts: meson-gxl: rename Nexbox A95x for consistency
> 
>     Since the GXL family has S905X and S905D SoCs, we're keeping the SoC
>     name in the DTS filename for clarity.  Rename this file accordingly to
>     be consistent with the rest of the GXL DTS files.
> 
>     Cc: Neil Armstrong <narmstrong@baylibre.com>
>     Reviewed-by: Andreas F?rber <afaerber@suse.de>
>     Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> 
> So adjust the defconfig and boot script to match.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Since you used this board, perhaps you could remove the bit in the
post-build.sh script that generates boot.scr, and use
BR2_TARGET_UBOOT_BOOT_SCRIPT instead ? Should be a separate patch of
course.

Sadly, this will not allow to remove completely post-build.sh, as it
needs a special AArch64 uImage for the kernel. But I wonder why this is
done in the post-build.sh script and not the post-image.sh script.

And the post-image.sh script can be refactored to use the common
genimage script :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
