Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097B6F30946
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A535A40B29;
	Thu,  5 Mar 2026 11:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pJ9V9vCzgul; Thu,  5 Mar 2026 11:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B497640B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772709810;
	bh=8yI1m91lFxE1a1YesUSNvN85jzigDsgi6yO8wSWcLsw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bXsxr10E5FxvaKeRrChKEG/FRFJQtVBYaGgQONtX2CcEFQCgrBL77VQGfFIc6ov1s
	 dY8b/nNMhSUtmYPDYrUZ2z8zQojj38GmwivNZww+CI/N4w3miceFZpA3rCn7XEtlWQ
	 7HKCW9fS5KkKWRA4C+tAk4C/p43pyBjHS9ypph5fE0t4BVs5tt9cmkfcIwabCSeDrS
	 LVHkJDVK0Qgm/IQzGQMz8/Z+E+nGQdTON+e8sjeWrdgys3vyxrQMqYiyDiB0bozvbI
	 ZGb88FThP4CfVmeIcM92Pp3/rWpadl2k5xIQTFayOz2g8/guo53EtFoIqF1sZtrk4C
	 iOIEsIcbQogjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B497640B7B;
	Thu,  5 Mar 2026 11:23:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B392C1EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4C8140BD9
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98hRgG076Etl for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE65540B7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE65540B7C
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:23:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECACA863E3; Thu,  5 Mar 2026 11:23:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Mar 2026 12:20:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee671bdd18792f0bace0b2de084d4fda6982ddad
X-Git-Newrev: ea5d82f1f69dd856afc08cdc940249019cc6447a
X-Patchwork-Hint: ignore
Message-Id: <20260305112327.ECACA863E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squashfs: bump to version 4.7.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea5d82f1f69dd856afc08cdc940249019cc6447a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream changelog:
https://github.com/plougher/squashfs-tools/blob/4.7.5/CHANGES.md

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squashfs/squashfs.hash | 4 ++--
 package/squashfs/squashfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index c921d638bb..e24a4805a1 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-tools-4.6.1.tar.gz
+# From https://github.com/plougher/squashfs-tools/releases/tag/4.7.5
+sha256  547b7b7f4d2e44bf91b6fc554664850c69563701deab9fd9cd7e21f694c88ea6  squashfs-tools-4.7.5.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index f2cb0ab25e..da22fad155 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.6.1
+SQUASHFS_VERSION = 4.7.5
 SQUASHFS_SOURCE = squashfs-tools-$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE = https://github.com/plougher/squashfs-tools/releases/download/$(SQUASHFS_VERSION)
 SQUASHFS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
