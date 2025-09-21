Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1110CCAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 09:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C0A60A50;
	Sun, 21 Sep 2025 09:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8b51xHZIDK5v; Sun, 21 Sep 2025 09:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5B8608BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5B8608BD;
	Sun, 21 Sep 2025 09:38:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1DBCD3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 09:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80FBE84056
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 09:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6BpVKMZxqkt for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 09:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A06B84079
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A06B84079
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 09:38:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 682CC86034; Sun, 21 Sep 2025 09:38:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Sep 2025 11:15:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5250bba8e5b1aaeb58977baf1d91e2be66656476
X-Git-Newrev: 3f57a001dece4e61ff1c9c195223e1df73d5ddaa
X-Patchwork-Hint: ignore
Message-Id: <20250921093820.682CC86034@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imxrt1050-evk: fix build failure
 due to wrong toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f57a001dece4e61ff1c9c195223e1df73d5ddaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

i.MXRT1050 is based on a ARMv7M core and we can't build using ARMV7
toolchain, so let's switch toolchain to
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506762
https://gitlab.com/buildroot.org/buildroot/-/commit/fdc002ee38e58ef4abfbd1615217a5977f9a0077

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add link to commit id introducing the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/imxrt1050-evk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 0574eae981..7a70c42afa 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_m7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imxrt1050evk/patches"
 BR2_ROOTFS_OVERLAY="board/freescale/imxrt1050evk/rootfs_overlay"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
