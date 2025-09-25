Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D118CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D3841505;
	Thu, 25 Sep 2025 20:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqmIgRxtn0Iq; Thu, 25 Sep 2025 20:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E4E4161B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E4E4161B;
	Thu, 25 Sep 2025 20:19:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F5AD1EB
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D7D9412AC
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMmjNfMJwBXb for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA8F40066
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAA8F40066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C62386443; Thu, 25 Sep 2025 20:19:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6bb2cf5f39094755c8c2c3eeeecdfeb56cbf1d02
X-Git-Newrev: eb0777987ac3d08953adcd4dbd04b5f20c3a3b84
X-Patchwork-Hint: ignore
Message-Id: <20250925201941.9C62386443@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 boot/boot-wrapper-aarch64/Config.in: switch homepage URL to https
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb0777987ac3d08953adcd4dbd04b5f20c3a3b84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Buildroot commit [1] ("package: replace git:// URLs with https://
URLs where possible") switched _SITE URL from git to https, but did
not updated the package homepage in Config.in.

This commit updates it to match the package _SITE URL.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/6626bf7c5fc1f5f47fcade03090de212a6121db3

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit afff65c340594e9cdf73774db8cfb5b4220c5ed2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/boot-wrapper-aarch64/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/boot-wrapper-aarch64/Config.in b/boot/boot-wrapper-aarch64/Config.in
index cf7389282f..d0350994a0 100644
--- a/boot/boot-wrapper-aarch64/Config.in
+++ b/boot/boot-wrapper-aarch64/Config.in
@@ -11,7 +11,7 @@ config BR2_TARGET_BOOT_WRAPPER_AARCH64
 	  possible to start an Aarch64 kernel inside the available
 	  software simulators for the Aarch64 architecture.
 
-	  git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
+	  https://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
 
 if BR2_TARGET_BOOT_WRAPPER_AARCH64
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
