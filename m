Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979F6C79FBD
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A87B160B6A;
	Mon,  5 Jan 2026 19:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJFO507l9jaF; Mon,  5 Jan 2026 19:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A4CD60AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642764;
	bh=RspJyeW4c5p97Vs/NJ515w5nC957C/63Adgk0caBfXw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j+IRrZ7jCwg/i58Uhp5cCbVNtR9UWwXmwHltmURIQd5/U6nfHBsE/ZU00cYVs11ut
	 FrXSqpEYVvbLPg9bwbXvk7N0mCXZmYH2+uGj3x54xgnUYLkYTDWUpxJT2WvJM8sDOx
	 Ygf3xr+yjuRgYSQytRaNzwU8hXO9WH9S/kTtYarGEpZf0e1oxQIrN8o8kHELVa/l16
	 edk7kWD/HMLmTC8M2+3Wv2NTpyyJytZZUbtrgM8MSGC29awZWpDB05nc9v0VrsnaLi
	 S25Ui14AopZH0qff6vK1CeIdBTEKefeqT8C6Bp0dLSgvXFpic2zicari1a6pMQSpEi
	 WXCPdJ5/QiUEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A4CD60AD5;
	Mon,  5 Jan 2026 19:52:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74F78E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA195813F4
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXsF5DezDhDT for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E719813ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E719813ED
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08FCA8827D; Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 18:47:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8a53ce52ac7b0dc5c2281f80608d6c91e1050d6
X-Git-Newrev: 3bec3d67d83f6505b864b19ac096c7f0a03498e1
X-Patchwork-Hint: ignore
Message-Id: <20260105195237.08FCA8827D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/beaglebone: Add BeagleBone Green Eco
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3bec3d67d83f6505b864b19ac096c7f0a03498e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the am335x-bonegreen-eco device tree to enable support for the
BeagleBone Green Eco variant. This ensures the device tree is built
from the Linux kernel sources and included in the boot partition.

Tested-by: Mohammed Sadik Shaik <s-sadik@ti.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/beagleboard/beaglebone/genimage.cfg | 1 +
 board/beagleboard/beaglebone/readme.txt   | 1 +
 configs/beaglebone_defconfig              | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/beagleboard/beaglebone/genimage.cfg b/board/beagleboard/beaglebone/genimage.cfg
index 4b026fda84..095e6e200b 100644
--- a/board/beagleboard/beaglebone/genimage.cfg
+++ b/board/beagleboard/beaglebone/genimage.cfg
@@ -12,6 +12,7 @@ image boot.vfat {
 			"am335x-bonegreen.dtb",
 			"am335x-boneblack-wireless.dtb",
 			"am335x-bonegreen-wireless.dtb",
+			"am335x-bonegreen-eco.dtb",
 			"extlinux"
 		}
 	}
diff --git a/board/beagleboard/beaglebone/readme.txt b/board/beagleboard/beaglebone/readme.txt
index a11377eaee..f896e1285a 100644
--- a/board/beagleboard/beaglebone/readme.txt
+++ b/board/beagleboard/beaglebone/readme.txt
@@ -31,6 +31,7 @@ output/images/
 +-- am335x-boneblack-wireless.dtb
 +-- am335x-boneblue.dtb
 +-- am335x-bonegreen.dtb
++-- am335x-bonegreen-eco.dtb
 +-- am335x-bonegreen-wireless.dtb
 +-- am335x-bone.dtb
 +-- am335x-evm.dtb
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 38d5d3b52f..11859a6c02 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless ti/omap/am335x-bonegreen-eco"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_XZ=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
