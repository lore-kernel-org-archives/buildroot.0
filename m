Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2ACC44501
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 12:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C17B36065F;
	Tue, 14 Jul 2026 12:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qV2RMm6VFch0; Tue, 14 Jul 2026 12:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1050608FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784033926;
	bh=aDSqvbw4qybtDJd8exCQ0AP0VBLavOl6pM3cx94iEN4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MBktZjRHOnuSFVR32A71pedho8GQeqcyaCyM3hQE632Ms28SB6ac7HKdrJd+TFiNm
	 l2EC90LLK0oC9y2u000FK4nTNGAwPFpdZfozz819pBT9Y8ZzSBKuEC4BU4kBXp1Qpb
	 LGjxHsyQT4BzdgNOgbMbqzrd6wAX7kLhqwUTRbC/EiwKCs9yl/TODXfBRMwKldHd9g
	 coWbxge13zy+Xw7L3bySIrV0oXJS26UjRVvblf0g1U0eJa8MeCTmDbr8ydF5+R+Uwv
	 2C0AfkTr6zb1odNQljT7zrtgesGXSEyHgJh7ONkskuU2rtmfvfZT1d//8Sx1Wnd57c
	 2bh6QpxeQ6+Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1050608FD;
	Tue, 14 Jul 2026 12:58:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84C36B88
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79EFE40726
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fg1s4DQPbgQf for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 12:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7780402B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7780402B1
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:58:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07CA08888F; Tue, 14 Jul 2026 12:58:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 14:52:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfd1d7367801e3ff1ca300671601391bb9bf17d4
X-Git-Newrev: 9bfb781317fe4995b22815ceb83e49c77ed0c932
X-Patchwork-Hint: ignore
Message-Id: <20260714125809.07CA08888F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: bump to version 1.58.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9bfb781317fe4995b22815ceb83e49c77ed0c932
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/Canop/broot/blob/v1.58.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index d1f3dbbe6a..176c663d62 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  26afe075d62fd64f608f07b867c568fa9ac9b9bce44b02ad573dfebd13d4cd1e  broot-1.57.0-cargo6.tar.gz
+sha256  cad8fb5e23b422aef80ea14797de7c709c97a5d2bb8019cddaea87811b17a652  broot-1.58.0-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 50ab686e82..91b35abd6b 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.57.0
+BROOT_VERSION = 1.58.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
