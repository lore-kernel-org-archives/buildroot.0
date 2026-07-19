Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18528C44520
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 19:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C727240560;
	Sun, 19 Jul 2026 19:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbpTyxgtR0A7; Sun, 19 Jul 2026 19:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2234056A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784489325;
	bh=kXMGVa0dC+sLbxe58tkFt2b+JcthWqFZCLGXPiAX6ek=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IBI+3aKxCvVH27TBvTwwUEx1beSkmLuehbBsR4rvYDkJknm5mdS4b6c4vrXTdX3js
	 OBxewWdWQMXFTqhQICzlzCJ4DXKRcDezdQRCltiRg3uOUPyfMx3zjxCFJXESq+8EHY
	 HI6sxdl+F+zHv/pYKfAOjbDqnk05GCSBU3NIE93v8/xaJkpNBJjJlUtc+mc2UhnGQ6
	 joS3IPhVLxzOFJGW2kDW7MDZ0BYk30bvPZkeA5HLH7NDZ68igKkpdapPuw2Ksf7q0x
	 VAlWYld3jbIV5mb0oNDX+Re26PBa1bR+wQzcZ+U++iOCjJ0ttpjr+bMPT2T1rJn296
	 geN519KnEAmSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC2234056A;
	Sun, 19 Jul 2026 19:28:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9191282
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA34C60699
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhCdBG-rRXjh for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 19:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE2D760671
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE2D760671
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 19:28:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B6FA88FB0; Sun, 19 Jul 2026 19:27:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 15:31:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a95039f8a3e2642277e76ab6e60b7e9cea03a27d
X-Git-Newrev: 078011efbb3b05cee9e30476bb84b82c8bbba428
X-Patchwork-Hint: ignore
Message-Id: <20260719192756.7B6FA88FB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmc: bump version to
 lf-6.18.20-2.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/078011efbb3b05cee9e30476bb84b82c8bbba428
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmc/fmc.hash | 2 +-
 package/fmc/fmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index aad3d1ab11..586304c37d 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3a9e2742bd68c5eb04f3d803b0b61926a163621058e3cc6a34f241683b5b153  fmc-lf-6.12.34-2.1.0.tar.gz
+sha256  07a8a4b9a847ebd10c288eb64ce270d76882a4e0188d525d933c968d854eb762  fmc-lf-6.18.20-2.0.0.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index d88fa9614d..c2c4ea4744 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = lf-6.12.34-2.1.0
+FMC_VERSION = lf-6.18.20-2.0.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
