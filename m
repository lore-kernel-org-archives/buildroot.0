Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7C6C5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC7A40D57;
	Fri, 14 Aug 2026 13:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zD9NwdQ55ii0; Fri, 14 Aug 2026 13:20:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C51CC40D11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713620;
	bh=JLDeyIEi2L5m6jev4svAIfivyGvtL/utIiT4K8owvf8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OZuAhkhPs3qW5GgdX2PWhhZIw5oLiHczcmiXyTfkqIf46TakgHIriA79+tNLn70Qn
	 r9Du4+2ggwa3QyKRzXFq11WCevcBA3TGL1OKW6nZyjMubVY9OOHfg8vkJyu+nyoDJs
	 Gs+Wh4pWG1LFi5WZLT8j4ElhrGgSbVNpAVqF99xdU1JIoXSRRKiuygm8XR6Cc7xWXK
	 djFpjZMrHfECuZb+GX9cZmn49LAkQdl6ueR/4EfvkOicuH6kDGZOp+X2Sd/fS2CHng
	 Of9z2mvLoKl/0FLcJ2wVuilm8FgvuzGXpo+NQGLsT/aE8wDac+ErRQint5Drs5Z/fD
	 1RzVGhu2hz4mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C51CC40D11;
	Fri, 14 Aug 2026 13:20:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3168733B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2197080E20
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHLFewxB8Rds for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ECC680E4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ECC680E4E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 137208D667; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:42:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3a1681c01edb26dc563b8453dfba5cb12698342d
X-Git-Newrev: b8230dfa8a20482fc7014359036d7c591dfc48fe
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.137208D667@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 docs/manual/contribute.adoc: mention license file changes in commit message
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8230dfa8a20482fc7014359036d7c591dfc48fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

It has been good practice for a while to describe the kind of change
in the commit message of any patch that changes license file
hashes. This is important so any substantial changes don't go
unnoticed. However it wasn't explicitly stated in the manual, fix
that.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ef655b53dd5c3fa52b133e09b7d5b7ec1aea12e6)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/manual/contribute.adoc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index f22164991f..310fe80585 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -283,16 +283,18 @@ the commit message body.
 When you bump a package to a new version, you should also submit a
 separate patch for each package. Don't forget to update the +.hash+
 file, or add it if it doesn't exist yet. Also don't forget to check if
-the +_LICENSE+ and +_LICENSE_FILES+ are still valid. The summary line
-should be something like +<packagename>: bump to version <new
-version>+. If the new version only contains security updates compared
-to the existing one, the summary should be +<packagename>: security
-bump to version <new version>+ and the commit message body should show
-the CVE numbers that are fixed. If some package patches can be removed
-in the new version, it should be explained explicitly why they can be
-removed, preferably with the upstream commit ID. Also any other
-required changes should be explained explicitly, like configure
-options that no longer exist or are no longer needed.
+the +_LICENSE+ and +_LICENSE_FILES+ are still valid. If the hash of a
+license file changed, please include a note in the commit message
+about what changed, ideally with a link to the upstream commit. The
+summary line should be something like +<packagename>: bump to version
+<new version>+. If the new version only contains security updates
+compared to the existing one, the summary should be +<packagename>:
+security bump to version <new version>+ and the commit message body
+should show the CVE numbers that are fixed. If some package patches
+can be removed in the new version, it should be explained explicitly
+why they can be removed, preferably with the upstream commit ID. Also
+any other required changes should be explained explicitly, like
+configure options that no longer exist or are no longer needed.
 
 If you are interested in getting notified of build failures and of
 further changes in the packages you added or modified, please add
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
