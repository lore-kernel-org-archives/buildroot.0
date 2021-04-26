From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Apr 2021 22:32:53 +0200
Subject: [Buildroot] [PATCH] package/links: graphics mode does not
 depend on DirectFB or X11
In-Reply-To: <20210423112118.3938670-1-urjaman@gmail.com>
References: <20210423112118.3938670-1-urjaman@gmail.com>
Message-ID: <20210426223253.424b4fcb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Urja,

On Fri, 23 Apr 2021 14:21:18 +0300
Urja Rannikko <urjaman@gmail.com> wrote:

> The "fb" framebuffer driver does not have any special dependencies.
> 
> Signed-off-by: Urja Rannikko <urjaman@gmail.com>

Thanks a lot for your contribution, but unfortunately, with the patch
you posted, links doesn't build anymore:

configure: error: No graphics drivers found.
make: *** [package/pkg-generic.mk:240: /home/thomas/projets/buildroot/output/build/links-2.21/.stamp_configured] Error 1

Tested configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LINKS=y
BR2_PACKAGE_LINKS_GRAPHICS=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
