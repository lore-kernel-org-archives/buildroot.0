Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B127C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 21:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D212405C8;
	Tue, 16 Jul 2024 21:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id regzeVvNZ3q5; Tue, 16 Jul 2024 21:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6D1409FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB6D1409FA;
	Tue, 16 Jul 2024 21:25:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B87091BF37B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A52FA405C8
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwK-qRYSP-Fg for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 21:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF32640BF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF32640BF4
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 21:25:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98C3C8695A; Tue, 16 Jul 2024 21:25:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 23:25:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d85e9df431af790930e03d860bfa098108888a0
X-Git-Newrev: 3d7e6cdf54683c6e84fc7f93b5fad886526223e1
X-Patchwork-Hint: ignore
Message-Id: <20240716212522.98C3C8695A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjcat: fix package name in
 comment
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3d7e6cdf54683c6e84fc7f93b5fad886526223e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libjcat/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libjcat/Config.in b/package/libjcat/Config.in
index cf7bc334f5..3e3718de3a 100644
--- a/package/libjcat/Config.in
+++ b/package/libjcat/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_LIBJCAT
 
 	  https://github.com/hughsie/libjcat
 
-comment "fwupd needs a toolchain w/ wchar, threads"
+comment "libjcat needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
