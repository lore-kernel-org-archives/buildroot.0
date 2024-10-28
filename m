Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C49BD5B159
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 580278113F;
	Mon, 28 Oct 2024 21:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atKon0EYMsE6; Mon, 28 Oct 2024 21:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57DC381140
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57DC381140;
	Mon, 28 Oct 2024 21:38:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A91F54EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79E64607FD
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sk4TPw7udy_K for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B166A607F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B166A607F7
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FFDD84553; Mon, 28 Oct 2024 21:38:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:37:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dba41736daeaf8065b44427316759e07c35545db
X-Git-Newrev: e4005d99711cb04718ed3fdca21c1fc83e53e6fd
X-Patchwork-Hint: ignore
Message-Id: <20241028213823.9FFDD84553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62ax_sk_defconfig: add
 linux-headers version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e4005d99711cb04718ed3fdca21c1fc83e53e6fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When bumping the Linux kernel version I inadvertently removed the pinned
linux-headers version from the defconfig which can break the build if
the default kernel version is not v6.10. Pin linux-headers to the
current am62ax-sk kernel version.

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/ti_am62ax_sk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index 77aa4a88e8..1144577942 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -1,4 +1,5 @@
 BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62ax-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
