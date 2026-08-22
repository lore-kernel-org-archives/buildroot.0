Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C487C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4645D40737;
	Sat, 22 Aug 2026 12:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HeHJ4gc45cE; Sat, 22 Aug 2026 12:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787400742;
	bh=UDY74TS622NrvRFnhjaxJJ0eJY2ZEnzCvlQOw6En1o0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=InP3yunPxDkRMEY7uEHPvOKmUG31AnisB6mreBqL0yEnHvHQnjdL33VWVtv/HgdiG
	 Ew3fNuz+o1lCY1D66wXMUBEO/tTuy/bB4qs7r5Mw36OkPyK78hVm1c4s2AL/VU8g8f
	 ZtXecUYEvS+6BvxtexQdkJj8avY3VIIcq/Xh5f7GsLFUbK/W5khKg0kJRuvL0JzgvN
	 LalYxvhxfXhljf7ABIV6u2pO54D9OseNpJmGonO39b5cO3VrNavrz7zNCXb5C4Mc+R
	 EgMWkNOFUQrKHVffJ8InECXN1YLz8jdrjJQZYLjq2MbJcspyf54THr8SkRUBQMMIaF
	 64xMQDAYE4qMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78D2440731;
	Sat, 22 Aug 2026 12:12:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44523476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 366BD40073
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpbUw4vvjSJr for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 825C34005F
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:12:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 658948DB44; Sat, 22 Aug 2026 12:11:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 13:14:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bdd74f011f88fd1a3d7dc4c2a93a54ed7ce7286b
X-Git-Newrev: 43cbd2b46ad88c6a88b732caaf621acd20344139
X-Patchwork-Hint: ignore
Message-Id: <20260822121126.658948DB44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zfs: bump version to
 2.4.4
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
Content-Type: multipart/mixed; boundary="===============6015234284674871840=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6015234284674871840==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43cbd2b46ad88c6a88b732caaf621acd20344139
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.4.4

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index aa8af8b8c3..e5c50ad141 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.3/zfs-2.4.3.sha256.asc
-sha256  1f08f2d154f5189b5f1382848a32667b3d34066145b474c49cd3d41a5fba59a7  zfs-2.4.3.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.4/zfs-2.4.4.sha256.asc
+sha256  2a3c70d55a37cc71618a95a60e81ad66530201eb118d37741dc92efcf848c8b1  zfs-2.4.4.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 2cde68307d..071557bf3e 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.4.3
+ZFS_VERSION = 2.4.4
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============6015234284674871840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6015234284674871840==--
