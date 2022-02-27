Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1FBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8A3607FF;
	Sun, 27 Feb 2022 20:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJIH-lR_ff2W; Sun, 27 Feb 2022 20:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB93606CB;
	Sun, 27 Feb 2022 20:47:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D30FE1BF2AA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEA2340535
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNM1gvD1FGW3 for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:47:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D2684052B
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:47:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 82E53822E8; Sun, 27 Feb 2022 20:39:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 21:38:50 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 73c19ff97adcd7166bf8658928608104503dff5c
X-Git-Newrev: 48cea1d9be4d9193eb4571aa2143c68a7012bb29
X-Patchwork-Hint: ignore
Message-Id: <20220227203951.82E53822E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 configs/roc_pc_rk3399_defconfig: expand rootfs size to 120M
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

commit: https://git.buildroot.net/buildroot/commit/?id=48cea1d9be4d9193eb4571aa2143c68a7012bb29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Default 60M for rootfs are not enough and generate a build failure, so
let's expand rootfs size to 120M.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5194113331b04c5fee1a773e1751b40bff6fdd18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/roc_pc_rk3399_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index dfbc5e4f47..ae7cf19a80 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -45,7 +45,7 @@ BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
