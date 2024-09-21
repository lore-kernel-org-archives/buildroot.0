Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1803CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D1E40791;
	Sat, 21 Sep 2024 18:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnKdV5qB8qAS; Sat, 21 Sep 2024 18:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 232964099B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 232964099B;
	Sat, 21 Sep 2024 18:48:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 125D11BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ECCE60720
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9yXTizpPNAy for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23D6F6065A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23D6F6065A
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12A6F83D95; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:39:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa79ae24a8c3422cfe293ab1b3e315fad049bd6c
X-Git-Newrev: f1ceb3687f16634ee0f41de278d875280f96bdc0
X-Patchwork-Hint: ignore
Message-Id: <20240921184812.12A6F83D95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/update-rust: fix 'following' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1ceb3687f16634ee0f41de278d875280f96bdc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
