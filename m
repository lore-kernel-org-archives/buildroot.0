Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C725DF8D77A
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F001440ADC;
	Thu, 16 Apr 2026 21:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrxHs5pI02Ka; Thu, 16 Apr 2026 21:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE9340AC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776373257;
	bh=crZvdjyCyhr+2y/5KLrJyy9LAZA5ap0MpfqvapGe4Iw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kVndmoGJ8Ej65H4/wMWVSh7IBmUc9HBWOQieMRTPFwvSqwBTZUVGM6U0hpaXFEWrx
	 LQyPAzVSS+L8FXQ/BoARQWns7SgcCuoOQZaN7g1ZQsnXy67tpschYUv9vxwsQ2M35g
	 cBeQU9EBwogAlvkhBG1tCOtNqd81vGTNQHDX/SQc6DFAehTa9/bBFb4dFebrEt7Of8
	 sGYzPI+PXgiaUEy4dtCo/hvcZajSfRlD/hgXWXRv0WKJlDI6GiQAJb3QJ3C8/u1l1c
	 zBOEDHKegYgkGV5/q8aLmkySrgsbobwafHCe14OkM68RIyc7r1v+y+nIk/ch9qVXtN
	 cIW0GhHnAuxPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE9340AC5;
	Thu, 16 Apr 2026 21:00:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3227270
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A441060AB9
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mPWzXzIGFkB for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 21:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2FF60AB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE2FF60AB8
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 21:00:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ADE781810; Thu, 16 Apr 2026 21:00:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Apr 2026 22:37:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e00cf503494d42d02260fbbaa6f174e8deb3a6f
X-Git-Newrev: a818f62fa05c734599b5aca53b6d8d4626ce6f88
X-Patchwork-Hint: ignore
Message-Id: <20260416210054.7ADE781810@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zellij: bump to version 0.44.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a818f62fa05c734599b5aca53b6d8d4626ce6f88
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/zellij-org/zellij/blob/v0.44.1/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index e0aaceeee2..03b647f7bf 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ee8fb9d36f07f00a3f21e65aadcb85911132a1de1666c18c0c5afe23f63c49d7  zellij-0.43.1-cargo5.tar.gz
+sha256  7c17759e1be5ce0b73cd2a33c7c111c9b7ce08d4c7f2efce12a0d7a7815b8b6b  zellij-0.44.1-cargo5.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 2ddefc6049..2d76b89891 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.43.1
+ZELLIJ_VERSION = 0.44.1
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
