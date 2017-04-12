From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:43:03 +0200
Subject: [Buildroot] [PATCH] linux: select BR2_PACKAGE_HOST_UBOOT_TOOLS
 instead of BR2_LINUX_KERNEL_UBOOT_IMAGE
In-Reply-To: <20170410160511.16278-1-arnout@mind.be>
References: <20170410160511.16278-1-arnout@mind.be>
Message-ID: <20170412214303.1ce5077a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Apr 2017 18:05:11 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> A long time ago, the blind config option BR2_LINUX_KERNEL_UBOOT_IMAGE
> was introduced to be able to trigger the linux -> host-uboot-tools
> dependency. Back in those days, there was no user-configurable
> BR2_PACKAGE_HOST_UBOOT_TOOLS.
> 
> Now, however, it is possible to select a custom kernel image name that
> needs uboot-tools, and manually enable BR2_PACKAGE_HOST_UBOOT_TOOLS. In
> this case, however, the linux -> host-uboot-tools is missed and the
> build is not reproducible. An example of such a situation is the
> upcoming CI40 defconfig.
> 
> As a solution, remove BR2_LINUX_KERNEL_UBOOT_IMAGE entirely. Instead,
> just select BR2_PACKAGE_HOST_UBOOT_TOOLS and add the dependency if it
> is selected.
> 
> Note that this may introduce a redundant dependency in case the user
> selected BR2_PACKAGE_HOST_UBOOT_TOOLS for some other reason (e.g. to
> be able to generate a U-Boot environment to include in the image, while
> the kernel is built as a zImage). However, the redundant dependency
> shouldn't hurt much.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Abhimanyu Vishwakarma <abhimanyu.v@gmail.com>
> ---
>  linux/Config.in | 13 +++++--------
>  linux/linux.mk  |  4 +++-
>  2 files changed, 8 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
