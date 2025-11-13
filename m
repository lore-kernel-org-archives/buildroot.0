Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE42CD98E2
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 20:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D143781EFD;
	Thu, 13 Nov 2025 20:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jmkkCe8jtpZ; Thu, 13 Nov 2025 20:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE0680C9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE0680C9C;
	Thu, 13 Nov 2025 20:55:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E3ED5
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 20:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A89480C9C
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 20:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8coCe_FsTznx for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 20:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6CE380C6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6CE380C6D
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 20:55:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA3A88448F; Thu, 13 Nov 2025 20:55:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Nov 2025 21:54:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47a7376514fd5b70950a047a73aa792fdb04efcd
X-Git-Newrev: 4f3d0e8e2ad10c4e167897b559a04e19e0d09446
X-Patchwork-Hint: ignore
Message-Id: <20251113205547.DA3A88448F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: fix typo in merged-bin details
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4f3d0e8e2ad10c4e167897b559a04e19e0d09446
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6b53649bfa ("docs/manual: add merged-bin details to customize
rootfs") added a small typo, fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-rootfs.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
index 5d8bcba778..4d03d04617 100644
--- a/docs/manual/customize-rootfs.adoc
+++ b/docs/manual/customize-rootfs.adoc
@@ -31,7 +31,7 @@ When +BR2_ROOTFS_MERGED_USR+ is enabled, then the overlay must not
 Additionally, when +BR2_ROOTFS_MERGED_BIN+ is enabled, then the overlay
   must not contain the '/usr/sbin' directory, as Buildroot will create
   it as a symbolic link to '/usr/bin'. In such a situation, should the
-  overlay have any program, they should be placed in '/usr/bin'.
+  overlay have any programs, they should be placed in '/usr/bin'.
 +
 As shown in xref:customize-dir-structure[], the recommended path for
   this overlay is +board/<company>/<boardname>/rootfs-overlay+.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
