Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF00AC71133
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80506149E;
	Fri, 25 Aug 2023 13:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80506149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8X6acpClOnRq; Fri, 25 Aug 2023 13:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E129F61486;
	Fri, 25 Aug 2023 13:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E129F61486
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74A991BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 699F541571
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 699F541571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zty_Ndf5E2lZ for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6C494049F
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6C494049F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 969F58630E; Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:08:54 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 12c76f9be582264aa60172a4c45ea32cce006492
X-Git-Newrev: 63bea3d49f521cbbbd31b1a76853aae4f1d1dcdb
X-Patchwork-Hint: ignore
Message-Id: <20230825131356.969F58630E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 configs/beaglebone_qt5_defconfig: build am335x-bonegreen-wireless
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=63bea3d49f521cbbbd31b1a76853aae4f1d1dcdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Build the am335x-bonegreen-wireless.dtb device tree.
  The genimage script which is shared between beaglebone and
  beaglebone_qt5 was updated to support the bonegreen-wireless.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit adc566856e95990ede1174faa0a2ff031b15d356)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beaglebone_qt5_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index ff03a05a8e..0038acfcfd 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.7
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
