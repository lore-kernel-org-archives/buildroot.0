Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162ACEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 09:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE27981BB2;
	Sun, 16 Jul 2023 09:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE27981BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpNH5uU89mn0; Sun, 16 Jul 2023 09:10:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6641981865;
	Sun, 16 Jul 2023 09:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6641981865
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6B501BF33E
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90BD381882
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90BD381882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGfeymvEURfA for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 09:09:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C544081865
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C544081865
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5869837E5; Sun, 16 Jul 2023 09:09:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 10:06:11 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 8375841e0b30a7ce8a22f656867f5d37c2fe2420
X-Git-Newrev: 5f07925767271269dcba95da5c14db25b2aa62d4
X-Patchwork-Hint: ignore
Message-Id: <20230716090944.B5869837E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] configs/hifive_unleashed:
 Update to use OpenSBI 1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f07925767271269dcba95da5c14db25b2aa62d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Since the rest of RISC-V boards have been switched to use OpenSBI
1.2, let's update hifive_unleashed to use OpenSBI 1.2 too.

Resolves: https://bugs.busybox.net/show_bug.cgi?id=15658
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 02f6d77fbda975d01e16da0b4a031776bc1a94d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/hifive_unleashed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 2b6ee6c08e..0440b14ba5 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -38,7 +38,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # Bootloader
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="0.9"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
