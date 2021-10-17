Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A1EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 08:10:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB0B160F59
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 08:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB0B160F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7778160843;
	Sun, 17 Oct 2021 08:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifycZTdcgOvY; Sun, 17 Oct 2021 08:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E82607FE;
	Sun, 17 Oct 2021 08:10:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E79491BF5B5
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 08:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2C6E40274
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 08:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OlVPuzBDXI8 for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 08:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6E0940172
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 08:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 04A4B95C9C; Sun, 17 Oct 2021 08:07:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 10:01:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5a48f3584e39e05041666009b43075607daea24
X-Git-Newrev: 5e44b5fe79fbfe8bce995b6d4694060b721ea490
X-Patchwork-Hint: ignore
Message-Id: <20211017080706.04A4B95C9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/lego_ev3: update to U-Boot 2021.07
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e44b5fe79fbfe8bce995b6d4694060b721ea490
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot CI has been failing due to 404 error on older U-Boot. Updating
the U-Boot version should fix it and it doesn't hurt to use the latest
U-Boot anyway.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/lego_ev3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index b4a1000036..555a63e36c 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -43,7 +43,7 @@ BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
 
 # host
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
