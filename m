From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Jan 2017 17:39:40 +0100
Subject: [Buildroot] Kernel Panic with BB Black + buildroot-2016.11.1
In-Reply-To: <1483536685380-153942.post@n4.nabble.com> (Ashish Kumar Mishra's
 message of "Wed, 4 Jan 2017 05:31:25 -0800 (PST)")
References: <1483536685380-153942.post@n4.nabble.com>
Message-ID: <87bmvm2303.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ashish" == Ashish Kumar Mishra <dgashu55@gmail.com> writes:

 > Hi All , 
 > I updated my build root  setup from buildroot-2016.05 to buildroot-2016.11.1
 > . 
 > I was having an working build with buildroot-2016.05. 
 > Could team members provide some pointers as to how could i debug & figure
 > the cause of this panic. 
 > *The defconfig is :*-
 > ~/my_virtual_project/release_branch_v2 :: cat defconfig 
 > BR2_arm=y
 > BR2_cortex_a8=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_LINUX_KERNEL=y
 > BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 > BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-boneblack"
 > BR2_TARGET_UBOOT=y
 > BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_boneblack"
 > # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 > BR2_TARGET_UBOOT_FORMAT_IMG=y
 > BR2_TARGET_UBOOT_SPL=y
 > BR2_TARGET_UBOOT_SPL_NAME="MLO"


So how do you create your rootfs and filesystem image?

Does it work if you instead build out beaglebone_defconfig? (E.G. make
clean; make beaglebone_defconfig; make)

-- 
Bye, Peter Korsgaard
