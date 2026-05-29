Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A3ECD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDFBA859EC;
	Tue,  9 Jun 2026 13:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvlpcqQv6NhA; Tue,  9 Jun 2026 13:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E57485985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010195;
	bh=/2Y5dqlRnaEXho1U7qKpqf3ba+oEcwj1+wtKFsBJCJI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SZ24bupSDXioKXup/Kn+RipMSlDfqnoF96mo3x2px/68tlYSgE14C5LPAbG8AWKjz
	 SgQNItH0cM0yB7bw8Vua4GshlOcVmScyKSjL4RASpRw40aRweJzfc+rNTA3HPb0TGA
	 ZqzlYS1+Hysv/frxx0IKf29WItnZXFiiuMCEKjxGbUjZFn2MExE969nK3B1YxlJBxg
	 0io5OasdwwYyY+dJOPESUU0TL+L74asxDQW+RreOwgkeBZQQpFJXo+VHsrk9ybRakx
	 DoFHNDgzWeeWc3/iEH3Qn92ONnY90SeyDk6dN4IPXVyou0310aMYvUlf65wIQaFYy8
	 JuxGa5FwSTItw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E57485985;
	Tue,  9 Jun 2026 13:03:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D73B2190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2DF1426DA
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVbSY8jjezbl for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E481D426EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E481D426EC
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C2F587E68; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:43:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d80e85d6c4b4dd03646a41f44500640cb1ab18c
X-Git-Newrev: c154dcd6c35864c23365f236851e57c92d0da7bc
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.2C2F587E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: remove lvm2
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
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
