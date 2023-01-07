Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DEDC54EBC
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 19:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E87D8410DE;
	Sat,  7 Jan 2023 19:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87D8410DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_hKzCFlsuyE; Sat,  7 Jan 2023 19:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C25410C9;
	Sat,  7 Jan 2023 19:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C25410C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C61C21BF421
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AED1760BBF
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED1760BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJpjGFSzSXpL for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CC2F60ACE
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC2F60ACE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EED8387625; Sat,  7 Jan 2023 19:29:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Jan 2023 20:23:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b39bd50e0a4cfb9cd5bba02c6ae913be72f3771a
X-Git-Newrev: 7f9a31bb8ce5567c8b3a59e50c44302f69788e02
X-Patchwork-Hint: ignore
Message-Id: <20230107192931.EED8387625@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sipeed_lichee_rv_defconfig: use
 OpenSBI 1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f9a31bb8ce5567c8b3a59e50c44302f69788e02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sipeed_lichee_rv_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index f03a6b4f69..750d2d6e3b 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
