Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB1BCF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F87541AFA;
	Sat, 12 Oct 2024 14:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kdamZDmfaHm; Sat, 12 Oct 2024 14:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A3FB41AFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A3FB41AFE;
	Sat, 12 Oct 2024 14:07:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82DFD1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75F1140871
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AAReOxIDF3w for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 460E940860
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 460E940860
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CC908452E; Sat, 12 Oct 2024 14:05:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:09 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 5c75ee937a1ad0d72e8d11b88301f79ac88859a1
X-Git-Newrev: 246c103203faa558164223188eb6d3decd28afd4
X-Patchwork-Hint: ignore
Message-Id: <20241012140530.3CC908452E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] utils/update-rust: fix
 'following' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=246c103203faa558164223188eb6d3decd28afd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f1ceb3687f16634ee0f41de278d875280f96bdc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/update-rust | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/update-rust b/utils/update-rust
index 3301434d70..0f40f2e2b6 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -27,7 +27,7 @@ RUST_HOSTS = [
 #       BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 # - package/rustc/rustc.mk:
 #       RUSTC_TARGET_NAME
-# and check whether one of the follwoing needs updating:
+# and check whether one of the following needs updating:
 # - package/rustc/Config.in.host:
 #       BR2_PACKAGE_HOST_RUSTC_ARCH
 #       BR2_PACKAGE_HOST_RUSTC_ABI
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
