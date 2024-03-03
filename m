Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FE3C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4997081F21;
	Sun,  3 Mar 2024 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J23iQjBnp2Xx; Sun,  3 Mar 2024 16:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E11B81F25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E11B81F25;
	Sun,  3 Mar 2024 16:08:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1F9D1BF37A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE7BA81F25
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAwthca-tYDh for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B6E981F21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B6E981F21
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:08:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F81487F91; Sun,  3 Mar 2024 16:08:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 16:54:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8077efb83769d43f976f7159f2c861e20163c96e
X-Git-Newrev: 5dd267200925fbce0de9da026aa5d4c001972855
X-Patchwork-Hint: ignore
Message-Id: <20240303160814.2F81487F91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: fix BR2_GCC_VERSION_ARC
 definition for gcc 13.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dd267200925fbce0de9da026aa5d4c001972855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the ARC-special GCC version was bumped from gcc 10.x to gcc 13.x
in commit 045ab73702b8bc09f94ca1f3b8e5bf3acb0b0843 ("toolchain: bump
ARC toolchain components to arc-2023.09-release"), the
BR2_GCC_VERSION_ARC option definition is not entirely correct: it
selects BR2_TOOLCHAIN_GCC_AT_LEAST_10, while it should select
BR2_TOOLCHAIN_GCC_AT_LEAST_13. This commit fixes this.

Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fabc6173f5..d294e8da30 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -13,7 +13,7 @@ config BR2_GCC_VERSION_ARC
 	bool "gcc arc (13.1)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
