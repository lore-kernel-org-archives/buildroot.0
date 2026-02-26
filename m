Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E67CEEF319
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C90C80ADE;
	Thu,  5 Mar 2026 08:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fqtp9xphZ-1G; Thu,  5 Mar 2026 08:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8659680BFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697737;
	bh=WJO38sjP/Dghgch23s/8LZ2fLEsjYcx/9bhzSGPQCyk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QgoZdTCu085scG4jiim2Ub3WxmZ2InGrJkjKF311QArFsENjvXBst/c5+TKYgMDME
	 OnOkoXREuxSrK75VDS0vAtZf3HSG9FpBq8vIMgdkawWJFUPp/mJRbFS1HhpoV6A8iG
	 SUdmYd9J8SjdKjLx86EmJoLa5ERqeptQC2lTYZR0G+sfzD3t4yCtlgd6to22o51jOp
	 1sG/zAk30hFELU78T+5zU95UWGYNRLrqC0uSB6BDum4kQjlP58UuJUxpfPuukOOKkB
	 EuNXSwjccB+64VVmFXc4R0DjbI9spGPJ0rgp2AZ+om6QdzobgVmIOa2fcqS61Y777d
	 gXoQvjZUbYhHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8659680BFB;
	Thu,  5 Mar 2026 08:02:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18E741EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF24F606DF
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZcCH7lwdiR4 for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E244D60611
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E244D60611
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8376863DE; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 22:05:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4980af0dfd82e98781752120f47d27c9ebf19dc
X-Git-Newrev: f721d9d935fb1c8c61b92efbd5a5fd82fb374cb1
X-Patchwork-Hint: ignore
Message-Id: <20260305080207.E8376863DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.4.1
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
Content-Type: multipart/mixed; boundary="===============0053594371495343708=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0053594371495343708==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f721d9d935fb1c8c61b92efbd5a5fd82fb374cb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.4.1

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 87f4e462f1..6e47f07ead 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.0/zfs-2.4.0.sha256.asc
-sha256  7bdf13de0a71d95554c0e3e47d5e8f50786c30d4f4b63b7c593b1d11af75c9ee  zfs-2.4.0.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.1/zfs-2.4.1.sha256.asc
+sha256  c17b69770f0023154f578eb8c7536a70f07d6a3bb0bd38f04fa0e8811c3c1390  zfs-2.4.1.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 30207f7cf7..0ecc9eee2d 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.4.0
+ZFS_VERSION = 2.4.1
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============0053594371495343708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0053594371495343708==--
