From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 19:18:26 +0200
Subject: [Buildroot] [PATCH 1/3 v3] aufs: new kernel extension
In-Reply-To: <c275f2001114fdf18419d7ef23d24b038d2d0599.1468759218.git.yann.morin.1998@free.fr>
References: <cover.1468759218.git.yann.morin.1998@free.fr>
 <c275f2001114fdf18419d7ef23d24b038d2d0599.1468759218.git.yann.morin.1998@free.fr>
Message-ID: <20160920191826.78817a35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 14:50:37 +0200, Yann E. MORIN wrote:
> From: Christian Stewart <christian@paral.in>
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> [Atul:
>  - Removed the duplicate conditional block.
>  - Updated the license to GPLv2.
>  - Removed the visibilty of package from menuconfig.
>  - Removed dependencies.
>  - Removed the comment.
>  - Changed the name of variable from BR2_PACKAGE_AUFS_STANDALONE_VERSION
>    to BR2_LINUX_KERNEL_EXT_AUFS_VERSION.
>  - Removed the AUFS_INSTALL_STAGING  and AUFS_INSTALL_TARGET  variables.
>  - Removed the BR2_PACKAGE_AUFS_3X and BR2_PACKAGE_AUFS_4X variables.
> ]
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> [yann.morin.1998 at free.fr:
>   - do not fail on version check if aufs ext is disabled
>   - check for empty version
>   - squash aufs package and linux extension in one patch
>   - fail if the kernel already has aufs support
>   - simplify handling of version
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  linux/Config.ext.in     | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
>  linux/linux-ext-aufs.mk | 21 ++++++++++++++++++++
>  package/Config.in       |  1 +
>  package/aufs/Config.in  | 16 +++++++++++++++
>  package/aufs/aufs.mk    | 28 ++++++++++++++++++++++++++
>  5 files changed, 118 insertions(+)
>  create mode 100644 linux/linux-ext-aufs.mk
>  create mode 100644 package/aufs/Config.in
>  create mode 100644 package/aufs/aufs.mk

Applied to master, with the following changes:

    [Thomas:
     - Fix the apply patch logic, it was using a non-existent
       AUFS_VERSION_MAJOR variable. BR2_PACKAGE_AUFS_SERIES is used
       instead.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
