Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B34C78821
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C539042C32;
	Fri, 20 Sep 2024 10:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VehzCMY5jpnn; Fri, 20 Sep 2024 10:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F13942C36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F13942C36;
	Fri, 20 Sep 2024 10:35:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45B961BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C2B4028E
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnH9PGsl3-ox for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5601A40450
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5601A40450
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F2FD803B6; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:34:05 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 849af6337f6a0a1ea1ebd508625c9e6e6d7d18ac
X-Git-Newrev: c62ae9151ada7b235ce6e3e987e3af677916ba84
X-Patchwork-Hint: ignore
Message-Id: <20240920103452.4F2FD803B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/musepack: fix
 occurring typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=c62ae9151ada7b235ce6e3e987e3af677916ba84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 66dbf094d3a8613fc594c9d6ae1be7c0d19757ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musepack/0004-missing-sys-select.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/musepack/0004-missing-sys-select.patch b/package/musepack/0004-missing-sys-select.patch
index 1e3a4b1140..64efbc4733 100644
--- a/package/musepack/0004-missing-sys-select.patch
+++ b/package/musepack/0004-missing-sys-select.patch
@@ -1,7 +1,7 @@
 Add missing <sys/select.h> include
 
 This header is needed when types like fd_set are used. This fixes a
-build issue occuring on the musl C library.
+build issue occurring on the musl C library.
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Thomas: better commit log.]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
