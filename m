Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AEEFD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 21:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6AB7407A4;
	Thu, 26 Feb 2026 21:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJ3zNEyDAiz8; Thu, 26 Feb 2026 21:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EA724073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772142375;
	bh=U3cfRhcCfF9UOY8dsIcgVdgaakcWZ15OeMFGrGmh5wU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q679oMJ9OU5oQlxeMkgE0+Lrg3prbUCmtgLYjAmn23EIg0kKOspV72o87k2c6Q1/T
	 cA0LGhXMyd6uhEOZ9DBRU1H7tdD2bTtpIRRiMkduSfFV2mdKTgmlRFobv0llhUvrZ4
	 Bb5jwMM8DoGXsOcxFSGk/p5cQc0lu0VzxO18XwRi/PnIX31NoCBiJN0GdsTj8mv2ky
	 Ejk3oCgyvlP479DNzV9I9jqmLIHgTZ00PWf3LBqG+nC1AfVOeo7zzcyLt/ELB9sAo+
	 njIgvozT0KBH4CPgAITb5W36FzcR8FjF+JsdU78dyXmFkVLbm6AqFf6v4V5Vlz/pRc
	 dmRfYIh8gOKNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EA724073A;
	Thu, 26 Feb 2026 21:46:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ED6823D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E6181210
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_genioo0niw for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 21:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78B53811FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78B53811FD
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:46:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 656AB8759A; Thu, 26 Feb 2026 21:46:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 22:05:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a4980af0dfd82e98781752120f47d27c9ebf19dc
X-Git-Newrev: f721d9d935fb1c8c61b92efbd5a5fd82fb374cb1
X-Patchwork-Hint: ignore
Message-Id: <20260226214613.656AB8759A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zfs: bump version to
 2.4.1
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
Content-Type: multipart/mixed; boundary="===============6426211815960010446=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6426211815960010446==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f721d9d935fb1c8c61b92efbd5a5fd82fb374cb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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

--===============6426211815960010446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6426211815960010446==--
