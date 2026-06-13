Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E35CD98C5
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 10:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38D8A83EB1;
	Sat, 13 Jun 2026 10:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TKSBlbdMzYw; Sat, 13 Jun 2026 10:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA1D83E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781346424;
	bh=ZYVzsv+2FI2GsRwRV8tgDRuViTa2o7r42bQ4ufgqyzk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ej84pyEDW3Ux2z7g+W4Rp+1osb+9Kf/GlUcOJYl9e1FnHo8grhsoZatdlceN3aqrR
	 q0d0SfLN/ZKu95kmCuDK/a2YBxlJtO08BOSDjT0ueVA5mNUW85YpFBxw9NSjWABtXE
	 AYxfbtTClVyGuV/WSCeI/aSejSA1kmQmukVvhmwWLUu8VKDE3J7Y1KMtLZzlmv7mi4
	 3ZQMq8RDfaxDinuQCtdVFt/UBP4uWNoZKj/dVdypSvCByhiYeSaS7rW3XjRwA54sgH
	 SzKcHqHM5fJgrACwVOP7Wl/IdXlwafxb2ZVCMRSPZFIQe4ODwpdBdOT6FD7DcE6vqZ
	 zqGq/0T6hBepg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA1D83E7B;
	Sat, 13 Jun 2026 10:27:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E94C147
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 10:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10B8660F36
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 10:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6sA084DapB6 for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 10:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 200C060F2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 200C060F2D
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 10:27:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DD5B87DD8; Sat, 13 Jun 2026 10:26:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jun 2026 10:59:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb81861aff4b8407f32cb22e17f02e07a5439780
X-Git-Newrev: 07f38c38627270f64c6ca1e8c2011e8bf57ed516
X-Patchwork-Hint: ignore
Message-Id: <20260613102642.5DD5B87DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.4.3
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
Content-Type: multipart/mixed; boundary="===============8479125471810426395=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8479125471810426395==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07f38c38627270f64c6ca1e8c2011e8bf57ed516
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.4.3

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 507de484c1..aa8af8b8c3 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.2/zfs-2.4.2.sha256.asc
-sha256  7e260d0e6af295bea4c5e241cac0a1aef07b58d8dd8035f7898ade3b1bbec78f  zfs-2.4.2.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.3/zfs-2.4.3.sha256.asc
+sha256  1f08f2d154f5189b5f1382848a32667b3d34066145b474c49cd3d41a5fba59a7  zfs-2.4.3.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 040a6869d8..2cde68307d 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.4.2
+ZFS_VERSION = 2.4.3
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============8479125471810426395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8479125471810426395==--
