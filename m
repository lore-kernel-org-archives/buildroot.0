Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C55DC27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 20:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C819A400D1;
	Tue, 11 Jun 2024 20:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0sTu0p9ifZL; Tue, 11 Jun 2024 20:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B660404C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B660404C1;
	Tue, 11 Jun 2024 20:52:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CCB21BF387
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 20:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36544404EB
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 20:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZABH52maQQ_K for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 20:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 283964033C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 283964033C
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 20:52:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C12587EEE; Tue, 11 Jun 2024 20:52:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 21:55:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b8f5e336609e3b8f24786f8029d02bcae593a84
X-Git-Newrev: 85736a27c8cdddcc65ff769852fde60834f302c7
X-Patchwork-Hint: ignore
Message-Id: <20240611205205.1C12587EEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] editorconfig: leave patch files alone wrt
 trainling spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=85736a27c8cdddcc65ff769852fde60834f302c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is perfectly valid for a patch file to have trailing spaces, when for
example an empty or space-only line is appears in a hunk: if the line if
part of the context, whether it be empty or with only spaces, there will
aways be the leading space introduced by the patch itsef, making for a
sapce-only line; if the line is space-only and removed (or added) that
will also appear as a space-only line.

Currently, our editorconfig wants to unconditionally drop trailing
spaces, so when one edits a patch file to add their SoB and Upstream
tags, such a patch would get badly mangled and would not apply, causing
quite some grief and questioning (sad experience looming in the recent
past here)...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .editorconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.editorconfig b/.editorconfig
index af6cf4b449..f7c3c7ddc3 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -29,6 +29,9 @@ indent_size = tab
 indent_style = tab
 indent_size = tab
 
+[*.patch]
+trim_trailing_whitespace = false
+
 [S{0..9}{0..9}*]
 indent_style = tab
 indent_size = tab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
