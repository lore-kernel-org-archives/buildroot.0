From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:29:09 +0100
Subject: [Buildroot] [PATCH v2] csky_gx6605s_defconfig: bump gcc to
 6.3.0, kernel to 4.9.56
In-Reply-To: <20181215181129.9218-1-juju@cotds.org>
References: <20181211224312.25814-1-juju@cotds.org>
 <20181215181129.9218-1-juju@cotds.org>
Message-ID: <20181216212909.23a7d7a1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Dec 2018 19:11:29 +0100, Julien Olivain wrote:
> This patch updates the csky custom external toolchain to fix a broken
> host dependency of gdb on libexpat.so.0 (most hosts now ship
> libexpat.so.1). gdb is required to copy and and boot the kernel
> (see board/csky/readme.txt). The updated gdb does no longer have this
> host dependency, which solve the issue.
> 
> Since this external toolchain was built and tested with csky kernel
> 4.9.56, this patch also update to that kernel version.
> 
> Finally, this 4.9.56 csky kernel changed its default bootargs. So we
> add a patch to preserve the same behavior as the previous version.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
> Changes v1 -> v2:
> - explain why the update is needed in the commit log
> ---
>  ...ine-for-serial-console-and-rootfs-on.patch | 25 +++++++++++++++++++
>  configs/csky_gx6605s_defconfig                |  7 +++---
>  2 files changed, 29 insertions(+), 3 deletions(-)
>  create mode 100644 board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
