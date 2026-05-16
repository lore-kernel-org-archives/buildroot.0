Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B21CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78DBD85736;
	Tue,  9 Jun 2026 13:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NVJ-SdgDfVt; Tue,  9 Jun 2026 13:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C4785733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010139;
	bh=yylxMyQvspPR2jGsnbRPN1HAXkwVUuV+NPgeqilkMYI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AJRUqqd5xfHerHuOh1JosKa7qVnZ8vm/vqRvzB716bRMGAK7shkk5gfqJmlkf8bPK
	 lnid6acUf0eYtyJbwzN3Z3pb2h8qpCzPTO+V4YfCli2K3bG7Yre4lrL+bbq5MYo8uW
	 M1j+Z7IEJSuXXdCH9XuO8l9ImLtYNoWuiXkpv6rBYNvYs5XbDS09pCb0JnIl7dVOmR
	 jGyLFrNBgTtKyTbOMKunoxkDCXogWa2cSrSl/1f8AneHXxcXudZPA56q9SCMvXSBb2
	 WU0lwB1LOBcl+ITRZjog0nvGfGcM0ZNf7u7YYlqeT0lCMhjsvTzRFFZ64+X7PSlbZz
	 on9hkoBdNqHKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C4785733;
	Tue,  9 Jun 2026 13:02:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FCDA2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B0C1426F2
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uon3IxUwo5Hj for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5941442561
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5941442561
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9319087E8E; Tue,  9 Jun 2026 13:01:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 May 2026 17:40:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ed01e7ed30379b0c1167a2173361269184a3c5d
X-Git-Newrev: b5124a6ab3c34e8fafe858239ca4f54fa4a457ff
X-Patchwork-Hint: ignore
Message-Id: <20260609130116.9319087E8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: fix release where
 BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL was removed
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5124a6ab3c34e8fafe858239ca4f54fa4a457ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 9a5369effd22011b52b82c91f702bacde690c41a which removed the
BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL symbol but forgot to introduce the
new "Legacy options removed in 2026.08" comment.

So the legacy symbol was incorrectly placed under
"Legacy options removed in 2026.05" comment.

Fix that.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 90606ebd4b..8095991b25 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,7 +144,7 @@ endif
 
 ###############################################################################
 
-comment "Legacy options removed in 2026.05"
+comment "Legacy options removed in 2026.08"
 
 config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
 	bool "qemu target microblazeel removed"
@@ -154,6 +154,8 @@ config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
 	  Version 11.0.0 of qemu folded microblazeel support into
 	  the microblaze target.
 
+comment "Legacy options removed in 2026.05"
+
 config BR2_KERNEL_HEADERS_6_19
 	bool "kernel headers version 6.19.x are no longer supported"
 	select BR2_LEGACY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
