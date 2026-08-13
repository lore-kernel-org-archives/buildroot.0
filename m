Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1707C5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B87840CFD;
	Fri, 14 Aug 2026 13:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJLxfqkbKDTM; Fri, 14 Aug 2026 13:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B0F040D85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713707;
	bh=EdxrMjnxjBwkEkxeD2vs3XC0vgymLLqXspuXz/ddWww=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZmYhIMki5ZQrGewh2ijcOOTvFj09GMd6Shas6cdFb2lkFcBqz0w/U6DXd3uuHDoga
	 JECMHKHIBZH9JXNXUxMGcQxPnC/bGXDxrTYIlHbl78SJC8U5FazB1WQSJUXrmiEFgm
	 4Yst1LyP/oGGH89pAluFuPb0ephdcGUlOHsCImZboIJYuITtnvXjHulbgh/N+6Q8bn
	 MbMrtLjo/woEGQGQzgymrFnjushhm/s8bJH299vSh55I4frBVLhsuCsqHY7s/2N7fn
	 p+6Lbkt1FcuakvVrOkrJN7lYcy97iDgptRJwk+ta7x/MlCOzjyt9A1UN7BM1DKTNJE
	 /nF8NGL0ZoWMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B0F040D85;
	Fri, 14 Aug 2026 13:21:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3FF733B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E26C860803
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYBvrg0xeE8G for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 598A0608B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 598A0608B0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59E078D665; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 924b69122d3a14304c1fdf45109d9df0778fb718
X-Git-Newrev: 2f7d1fa84226d798883954950a3390e3a4171bbc
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.59E078D665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f7d1fa84226d798883954950a3390e3a4171bbc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
