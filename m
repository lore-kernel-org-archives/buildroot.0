Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF01CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73765615B9;
	Fri, 29 May 2026 08:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdYwZILHO13P; Fri, 29 May 2026 08:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F34CD61517
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044474;
	bh=VJu3T1LG+b6XPd4K7I5g9brw1PqMcanZIU5xCHZP34c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TzLjfTdIj5gYYla4Ra0hDaWl+CS5TU1ApkdTUaXXXMFd2iux1VvkNVejXs6JtIOFp
	 5WdXXjfg6UWnTqCgZaEsBjs3H3PqMq87QspX/v9rHrnNRkBUx/7DqBcYASxmrrhxz+
	 q95QTRwQL3cCdF0JgqRToWikQyk0vwdsCIJuvGHuN+61ZNKqcD/Sp+NF1djVltXztr
	 qj8klYeATJ9uXQ/XWKxOaWYYEf6caW39KocypiOx0tsw5jvRvR511Lllk/dhe3+WbP
	 xMO+CTf28DAYxgmBd3K8kELsUGYLR6HV2NH39x3gydIhWDyyPOmumUt/Yv1nXOZ45B
	 rbeGIoPC8qTAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F34CD61517;
	Fri, 29 May 2026 08:47:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48C8228E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45C5361488
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uErxZabxPHgT for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1643561495
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1643561495
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A41C2873AC; Fri, 29 May 2026 08:47:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:43:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4d80e85d6c4b4dd03646a41f44500640cb1ab18c
X-Git-Newrev: c154dcd6c35864c23365f236851e57c92d0da7bc
X-Patchwork-Hint: ignore
Message-Id: <20260529084734.A41C2873AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nfs-utils: remove lvm2
 !BR2_STATIC_LIBS reason
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c154dcd6c35864c23365f236851e57c92d0da7bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/nfs-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 295ce28edb..0f836bd5a9 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -27,7 +27,7 @@ if BR2_PACKAGE_NFS_UTILS
 
 config BR2_PACKAGE_NFS_UTILS_NFSV4
 	bool "NFSv4/NFSv4.1"
-	depends on !BR2_STATIC_LIBS # keyutils, lvm2
+	depends on !BR2_STATIC_LIBS # keyutils
 	select BR2_PACKAGE_KEYUTILS
 	select BR2_PACKAGE_LVM2
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
