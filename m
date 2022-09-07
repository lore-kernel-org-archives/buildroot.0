Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D59DC38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 07:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EAD960A6F;
	Wed,  7 Sep 2022 07:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EAD960A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p53A8IiCEPwJ; Wed,  7 Sep 2022 07:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998A7605B7;
	Wed,  7 Sep 2022 07:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998A7605B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F13E1BF365
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 768E540354
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 768E540354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gqa4dINfGQXx for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 07:57:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7631A401CE
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 07:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7631A401CE
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 63BCE826C6; Wed,  7 Sep 2022 07:57:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Sep 2022 09:57:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3461465ac0eca058b616199692abafc64aad2e7f
X-Git-Newrev: b30ee98da976210c9ceb971fb944434944031642
X-Patchwork-Hint: ignore
Message-Id: <20220907075729.63BCE826C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] nezha_defconfig: configure
 eth0 using DHCP
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

commit: https://git.buildroot.net/buildroot/commit/?id=b30ee98da976210c9ceb971fb944434944031642
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With the move to 5.19-rc1, the ethernet interface is now supported.
Configure it using DHCP at startup.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/nezha_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index 7a7e86ceab..2e2df3c09d 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -1,6 +1,7 @@
 BR2_riscv=y
 BR2_GLOBAL_PATCH_DIR="board/nezha/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/nezha/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/nezha/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
