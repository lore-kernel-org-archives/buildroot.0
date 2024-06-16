Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18932C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 10:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D299240682;
	Sun, 16 Jun 2024 10:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSLz0XLEkqRd; Sun, 16 Jun 2024 10:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36515406A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36515406A7;
	Sun, 16 Jun 2024 10:25:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2588D1BF31B
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04F9A6075A
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4N76iqoxOmK for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AE0D60720
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AE0D60720
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23CF587FAF; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 12:24:58 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 49032338441afddea853d35727914018860b7599
X-Git-Newrev: 73c3457dcaca11225594e0d88f98a339cd819de1
X-Patchwork-Hint: ignore
Message-Id: <20240616102528.23CF587FAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] editorconfig: leave patch
 files alone wrt trainling spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=73c3457dcaca11225594e0d88f98a339cd819de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 85736a27c8cdddcc65ff769852fde60834f302c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
