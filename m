From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:15:08 +0200
Subject: [Buildroot] [PATCH 1/1] Fix rasberry Pi 64bit firmware overlay
 inclusion
In-Reply-To: <6de3ad34-84b1-842f-07e3-6c34734bd1b3@mind.be> (Arnout
 Vandecappelle's message of "Sun, 14 Apr 2019 00:13:12 +0200")
References: <20190103110036.14604-1-flatmax@flatmax.org>
 <20190413210620.GP2539@scaer>
 <6de3ad34-84b1-842f-07e3-6c34734bd1b3@mind.be>
Message-ID: <87pnpb88j7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 > On 13/04/2019 23:06, Yann E. MORIN wrote:
 >> Matt, All,
 >> 
 >> On 2019-01-03 22:00 +1100, Matt Flax spake thusly:
 >>> This patch enables the inclusion of the Pi's overlays. Previously
 >>> the overlays were not included in the genimage configuration.
 >>> This patch ensures overlays are included in the sdcard (when
 >>> enabled) by defaulting to the inclusion of an empty
 >>> output/images/rpi-firmware/overlays directory in genimage cfg.
 >>> 
 >>> The Pi's overlays are built with the following config
 >>> variables:
 >>> BR2_PACKAGE_RPI_FIRMWARE=y
 >>> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
 >>> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
 >>> BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 >>> BR2_LINUX_KERNEL_IMAGE_NAME="Image"
 >>> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image modules dtbs"
 >>> 
 >>> After building, the dtbo files are present in the
 >>> output/images/rpi-firmware/overlays directory but not added
 >>> to the sdcard because they are missing from the genimage cfg
 >>> file.
 >>> 
 >>> Signed-off-by: Matt Flax <flatmax@flatmax.org>
 >> 

 >  Also, I've added a brief comment explaining why we create this empty directory.

 >  Peter, we discussed this on IRC and we feel that one empty directory doesn't
 > violate the minimalistic principle too much, because it does make life a lot
 > easier when you start from the existing defconfig.

 >  So, I've applied to master with the changes mentioned above.

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
