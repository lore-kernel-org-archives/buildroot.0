Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A72C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9493A60C1A;
	Tue, 13 Dec 2022 20:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9493A60C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLlQv6De-po0; Tue, 13 Dec 2022 20:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C757E60FE5;
	Tue, 13 Dec 2022 20:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C757E60FE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ED991BF301
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A2C441796
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A2C441796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZbzaXOt_W5a for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 20:22:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAB4C4179C
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB4C4179C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A985E8663F; Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 21:19:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adc8355150e876b3301b35405d411fd1ea98dff0
X-Git-Newrev: 300610e11e76bbd75469243f88ae243f03523ea3
X-Patchwork-Hint: ignore
Message-Id: <20221213202218.A985E8663F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] nezha_defconfig: use upstream OpenSBI 1.1
 release
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

commit: https://git.buildroot.net/buildroot/commit/?id=300610e11e76bbd75469243f88ae243f03523ea3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The D1 support is now upstream, so we can use the upstream 1.1 release
instead of a custom version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nezha_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index 02f351d483..f845d918d9 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -15,8 +15,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
