Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89230C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5285882907;
	Sun,  5 Dec 2021 15:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUoLFgEppj-E; Sun,  5 Dec 2021 15:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DDF82553;
	Sun,  5 Dec 2021 15:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82CF31BF96B
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7219660612
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAv5iiMyQU3i for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:54:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0B7D60593
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:54:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D5D4F801E3; Sun,  5 Dec 2021 15:49:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 16:52:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49b1aace9b5b1b2624385b0def0e413b1f2f0810
X-Git-Newrev: d35a0936ee2b2cf3a800180bd9676907e1609146
X-Patchwork-Hint: ignore
Message-Id: <20211205154931.D5D4F801E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/grinn_chiliboard_defconfig: bump
 to u-boot 2020.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=d35a0936ee2b2cf3a800180bd9676907e1609146
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc';
	scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/grinn_chiliboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index e72a82cee8..80f3077b76 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="chiliboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
