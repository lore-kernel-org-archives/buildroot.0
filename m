Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B1BC78822
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9318E42D6E;
	Fri, 20 Sep 2024 10:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLHICazheTbN; Fri, 20 Sep 2024 10:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3105642D5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3105642D5D;
	Fri, 20 Sep 2024 10:36:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C45CB1BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1695440450
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lA_VXDkXkXxa for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F74416AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07F74416AD
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 041D78411D; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:43 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: b6d097aaedaefe0cf95c19a9bbb1764bbfed1659
X-Git-Newrev: dcc8b10cc70957cfe2266c7cd2ee51dcdfeae13a
X-Patchwork-Hint: ignore
Message-Id: <20240920103607.041D78411D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/musepack: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcc8b10cc70957cfe2266c7cd2ee51dcdfeae13a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

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
