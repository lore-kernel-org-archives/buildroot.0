From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 21:33:16 +0100
Subject: [Buildroot] [PATCH] Add syslinux installer host package
In-Reply-To: <20181111150652.17459-2-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-2-alexander.sverdlin@gmail.com>
Message-ID: <20181111213316.18f86c81@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution! I'm adding Carlos Santos, who also uses
syslinux.

On Sun, 11 Nov 2018 16:06:47 +0100, Alexander Sverdlin wrote:
> Add host installer for syslinux bootloader which allows to pre-install
> syslinux in the generated firmware images. BR2_ROOTFS_POST_IMAGE_SCRIPT
> can do something like this:
> 
> 	${HOST_DIR}/usr/bin/syslinux -d /syslinux/ -i ${IMGFILE}
> 
> if the rest of syslinux is installed under /syslinux inside the firmware
> image.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  package/Config.in.host                    |  1 +
>  package/syslinux-installer/Config.in.host |  7 +++++++
>  package/syslinux-installer/syslinux.mk    | 25 +++++++++++++++++++++++

Instead of making a separate package for this, what about adding a host
variant of the existing syslinux package ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
