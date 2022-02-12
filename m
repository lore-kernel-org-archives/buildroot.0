Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68445C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B3D061B84;
	Sat, 12 Feb 2022 13:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qK3UImzqhnQ; Sat, 12 Feb 2022 13:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6234660D91;
	Sat, 12 Feb 2022 13:42:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B97381BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B577C41517
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qm7QdAHMWGsT for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:42:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BE5741514
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:42:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70CE720004;
 Sat, 12 Feb 2022 13:42:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIsfY-0005Zf-I8; Sat, 12 Feb 2022 14:42:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@xilinx.com>
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
Date: Sat, 12 Feb 2022 14:42:32 +0100
In-Reply-To: <20220211144402.1626443-1-neal.frager@xilinx.com> (Neal Frager's
 message of "Fri, 11 Feb 2022 07:44:01 -0700")
Message-ID: <87pmnsnquv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
 michal.simek@xilinx.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@xilinx.com> writes:

 > This patch:
 > - bumps ATF to Xilinx v2.6: mainline v2.6 requires patch to build
 > - bumps U-Boot to Xilinx 2022.01: important drivers not in mainline
 > - bumps Linux to Xilinx 5.15: important drivers not in mainline
 > - deletes board/zynqmp/patches directory: patches already in mainline
 > - modifies board/zynqmp/genimage.cfg: U-Boot 2022.01 uses u-boot.itb format
 > - adds extlinux.conf to vfat bootfs
 > - modifies U-Boot to unified xilinx_zynqmp_virt_defconfig (supports all boards)
 > - adds support for SPL pm_cfg_obj.c loading to PMU firmware
 > - enables support for host machines without OpenSSL required by U-Boot and Linux

 > Signed-off-by: Neal Frager <neal.frager@xilinx.com>
 > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > [Giulio: only build tested]

 > +++ b/configs/zynqmp_zcu106_defconfig
 > @@ -1,34 +1,39 @@
 >  BR2_aarch64=y
 > -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 >  BR2_LINUX_KERNEL=y
 >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
 > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="966124532656bc95d781abf57531e4cd4f962237"

The git hashes do not make it directly clear what version this is, so I
changed it to use the output of describe --abbrev=40 <commit> which adds
a prefix like v5.15-930-g in front, directly making it clear that this
is based on upstream 5.15 with 930 patches on top.

I've done it for ATF and U-Boot as well and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
