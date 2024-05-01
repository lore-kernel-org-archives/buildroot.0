Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79045C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D64F80BC4;
	Wed,  1 May 2024 19:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1W_EnJwAzyM; Wed,  1 May 2024 19:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C430981397
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C430981397;
	Wed,  1 May 2024 19:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 367311BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2325580F04
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id althCTtypHZi for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA5480B38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EA5480B38
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50C8E86485; Wed,  1 May 2024 19:58:24 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:57:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e983a6404814292092ab797d3983fa97aea76741
X-Git-Newrev: f9e4c41c19707d0cdb30c5607350ad80cd53e8e8
X-Patchwork-Hint: ignore
Message-Id: <20240501195824.50C8E86485@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kf5/kf5-kcoreaddons: drop nios2
 binutils bug 27597 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9e4c41c19707d0cdb30c5607350ad80cd53e8e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/kf5/kf5-kcoreaddons/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kf5/kf5-kcoreaddons/Config.in b/package/kf5/kf5-kcoreaddons/Config.in
index 02bd38e395..88fda03ee0 100644
--- a/package/kf5/kf5-kcoreaddons/Config.in
+++ b/package/kf5/kf5-kcoreaddons/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KF5_KCOREADDONS
 	bool "kf5-kcoreaddons"
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
 	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
