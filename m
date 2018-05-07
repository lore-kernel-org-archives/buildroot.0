From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 09:08:11 +0200
Subject: [Buildroot] [PATCH 2/4] skeleton-custom: install /bin, /lib,
 and /sbin
In-Reply-To: <20180506213116.25084-3-casantos@datacom.ind.br>
References: <20180506213116.25084-1-casantos@datacom.ind.br>
 <20180506213116.25084-3-casantos@datacom.ind.br>
Message-ID: <20180507090811.18489751@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Sun,  6 May 2018 18:31:14 -0300, Carlos Santos wrote:
> skeleton-custom does not install the required /bin, /lib and /sbin
> directories (or symlinks), which may result in an imcomplete tree, The
> user could add the required directories/symlinks to the skeleton but
> they maye be invalid, depending on the state of BR2_ROOTFS_MERGED_USR.

maye -> may

> 
> Steps to reproduce:
> 
> - Enable BR2_ROOTFS_MERGED_USR and BR2_INIT_SYSTEMD
> - Set BR2_ROOTFS_SKELETON_CUSTOM_PATH to "system/skeleton"
> - Run "make skeleton"
> - target/{bin.lib,sbin} will not exist
> 
> Add calls to SYSTEM_USR_SYMLINKS_OR_DIRS to INSTALL_TARGET_CMDS and
> INSTALL_STAGING_CMDS, so the required directories or symlinks are
> created.
> 
> Add a paragraph to the documentation clarifying that custom skeletons
> should not contain /bin, /lib or /sbin.

Maybe I don't understand the full scope of the problem, but to me, it
looks weird that the full contents of the skeleton (default or custom)
are not copied to the target root filesystem. It goes against the basic
expectations of what the skeleton is.

Of course, I am fine with checking that the skeleton complies with the
BR2_ROOTFS_MERGED_USR option, but preventing the skeleton from
having /bin, /lib and /sbin looks weird. So much that it needs to be
mentioned in the documentation.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
