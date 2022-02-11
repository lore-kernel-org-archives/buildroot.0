Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176DBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 10:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2D4E60757;
	Fri, 11 Feb 2022 10:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqBqDTQri2jj; Fri, 11 Feb 2022 10:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF5B760BC5;
	Fri, 11 Feb 2022 10:08:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D95E21BF336
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 10:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7E1560BC5
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 10:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRkZa0oadDL0 for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 10:08:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAAFD60757
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 10:08:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9221D40004;
 Fri, 11 Feb 2022 10:08:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nISqe-0001Qx-NP; Fri, 11 Feb 2022 11:08:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <nealf@xilinx.com>
References: <20220210081932.3114763-1-neal.frager@xilinx.com>
 <874k56wgqs.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758DF865E3C2C65C58AC2C0D7309@SJ0PR02MB7758.namprd02.prod.outlook.com>
Date: Fri, 11 Feb 2022 11:08:16 +0100
In-Reply-To: <SJ0PR02MB7758DF865E3C2C65C58AC2C0D7309@SJ0PR02MB7758.namprd02.prod.outlook.com>
 (Neal Frager's message of "Fri, 11 Feb 2022 09:36:47 +0000")
Message-ID: <87y22hra0f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_zcu106: bump
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <nealf@xilinx.com> writes:

 > Hi Peter,
 >> +++ b/configs/zynqmp_zcu106_defconfig > @@ -1,34 +1,39 @@ >
 >> BR2_aarch64=y > -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
 >> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 >> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 >> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 >> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 >> BR2_LINUX_KERNEL=y
 >> BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
 >> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
 >> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15"

 >> xlnx_rebase_v5.15 is a branch. A git version should point to a tag og a
 >> sha1 so the build is reproducible.

 > Ok.  I will correct this for ATF, U-Boot and Linux.

Good!

 >> I think I earlier asked you not to change the URL when it is not needed, please leave the existing /xilinx/ URL.

 > Yes, we did discuss this earlier.  But after thinking about it, don't
 > you think the defconfigs will look cleaner if the URL is the same
 > format for ATF, U-Boot and the Linux kernel?
 > It is strictly a cosmetic thing.  My preference would be for all 3 to
 > be either "Xilinx" or "xilinx".  Do you prefer uppercase or lowercase?

Ahh yes, agreed. The "official" URLs on Github seems to use Xilinx, so
perhaps that is the best approach.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
