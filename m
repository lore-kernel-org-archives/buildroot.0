Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B07FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 06:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A821D83EE9;
	Wed,  4 May 2022 06:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZT1emfcatZC; Wed,  4 May 2022 06:49:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF81783EE3;
	Wed,  4 May 2022 06:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0389B1BF2C0
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 06:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5E8D417AB
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 06:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7zD55ZiemEf for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 06:49:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3268C4179A
 for <buildroot@buildroot.org>; Wed,  4 May 2022 06:49:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8C28520000A;
 Wed,  4 May 2022 06:49:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nm8ov-00DHTK-GE; Wed, 04 May 2022 08:49:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>, michal.simek@xilinx.com
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
Date: Wed, 04 May 2022 08:49:09 +0200
In-Reply-To: <20220503152425.1069617-2-neal.frager@amd.com> (Neal Frager's
 message of "Tue, 3 May 2022 09:24:25 -0600")
Message-ID: <87h7653i8q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch migrates configs/zynqmp_zcu106_defconfig to tarballs for TF-A, u-boot and Linux.
 > This patch has zero change in code running on the device.
 > The goal is to improve build speed and align with the zynq_xxx_defconfigs.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

Notice: I'm still seeing noisy warnings from the kernel during boot, did
you hear back from Michal abot that?

[    4.384715] zynqmp-display fd4a0000.display: vtc bridge property not present
[    4.393156] ------------[ cut here ]------------
[    4.397776] More than allowed devices are using the vpll_int, which is forbidden
[    4.405204] WARNING: CPU: 1 PID: 7 at drivers/clk/zynqmp/pll.c:200 zynqmp_pll_set_rate+0x198/0x200
[    4.414160] Modules linked in:
[    4.417208] CPU: 1 PID: 7 Comm: kworker/u8:0 Not tainted 5.15.19 #1
[    4.423465] Hardware name: ZynqMP ZCU106 RevA (DT)
[    4.428250] Workqueue: events_unbound deferred_probe_work_func
[    4.434081] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.441033] pc : zynqmp_pll_set_rate+0x198/0x200
[    4.445642] lr : zynqmp_pll_set_rate+0x198/0x200
[    4.450251] sp : ffffffc009523660
[    4.453558] x29: ffffffc009523660 x28: ffffff887f7f6458 x27: ffffff8801d8b810
[    4.460694] x26: 000000000000b61b x25: ffffff88014e7600 x24: 0000000000000060
[    4.467828] x23: 0000000001fca055 x22: ffffff88014e7600 x21: ffffff88014e7680
[    4.474963] x20: 000000000169cfa1 x19: 0000000059682ef1 x18: 0000000000000030
[    4.482098] x17: 6962726f66207369 x16: 206863696877202c x15: 746e695f6c6c7076
[    4.489233] x14: 2065687420676e69 x13: 6e6564646962726f x12: ffffffc00936b9b0
[    4.496368] x11: 0000000000000141 x10: 6c6c707620656874 x9 : 00000000fffff7ff
[    4.503503] x8 : ffffffc0093979b0 x7 : 000000000000bfe8 x6 : 80000000fffff800
[    4.510638] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[    4.517773] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff880009ad80
[    4.524909] Call trace:
[    4.527348]  zynqmp_pll_set_rate+0x198/0x200
[    4.531609]  clk_change_rate+0x148/0x2c0
[    4.535523]  clk_core_set_rate_nolock+0x154/0x240
[    4.540220]  clk_set_rate+0x38/0x150
[    4.543787]  xilinx_dp_codec_probe+0xd4/0x1f0
[    4.548136]  platform_probe+0x68/0xe0
[    4.551790]  really_probe.part.0+0x9c/0x310
[    4.555965]  __driver_probe_device+0x98/0x150
[    4.560314]  driver_probe_device+0x44/0x120

> ---
 >  configs/zynqmp_zcu106_defconfig | 15 ++++++---------
 >  1 file changed, 6 insertions(+), 9 deletions(-)

 > diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
 > index c8b507f0db..96b15eea81 100644
 > --- a/configs/zynqmp_zcu106_defconfig
 > +++ b/configs/zynqmp_zcu106_defconfig
 > @@ -3,9 +3,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 >  BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 >  BR2_LINUX_KERNEL=y
 > -BR2_LINUX_KERNEL_CUSTOM_GIT=y
 > -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
 > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15_LTS_2022.1"
 > +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
 >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
 >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
 > @@ -14,16 +13,14 @@ BR2_TARGET_ROOTFS_EXT2=y
 >  BR2_TARGET_ROOTFS_EXT2_4=y
 >  # BR2_TARGET_ROOTFS_TAR is not set
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
 > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6_2022.1"
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.1)/xlnx_rebase_v2.6_2022.1.tar.gz"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 >  BR2_TARGET_UBOOT=y
 >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > -BR2_TARGET_UBOOT_CUSTOM_GIT=y
 > -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
 > -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01_2022.1"
 > +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 > +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 >  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 >  BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu106/uboot.fragment"
 >  BR2_TARGET_UBOOT_NEEDS_DTC=y
 > -- 

 > 2.17.1


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
