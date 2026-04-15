Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B218AF428EC
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 20:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E0EF42A49;
	Wed, 15 Apr 2026 20:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8z_zVEotaYKi; Wed, 15 Apr 2026 20:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4102242A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776285768;
	bh=21tnTS1ShZBaF1L+vJQFAv9r0obUsTxDfcGi/W+1Lwo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bz7QCOg4ArrXH+hGc/XKduMSgT3aDwzP9y71b+h5/BDt2KXuSrJE9mfwpf3r+jROd
	 Ywu3YPhK9Y8amFINBZ5k8iLxC4W9DWeISjz+Osj9MKZN+376qmvmyihv2E5VsEw91f
	 hh4hMb0aTcWpitCWhfj3v+R9UT9uormZC8dwYbVLCZdc0fn+y8l6q8dd7548Hgod+Z
	 1kC3rdcba2sVtTTqV7/XeRBGSr5pjbo2xdbtOiN7zqx9734OoYXR9F2OHzRiIG99Rf
	 FwuokyAw5NcVGGR7p7RkS8kwAw9PnJuS+bH0uu+rPNTkGQccwZxdfWtLkRWKOvXuBG
	 9Y48fwVG8rCtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4102242A5A;
	Wed, 15 Apr 2026 20:42:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 730802E6
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 649FC60E22
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x--Qwkp83VMm for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 20:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86F3660B55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86F3660B55
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 283CB816A6; Wed, 15 Apr 2026 20:42:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Apr 2026 21:59:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e2b7e2bee7ea2b40b82a43beaf161cb7fbf3d23
X-Git-Newrev: 07ab2a508e3073c01b3b18c7b2cb31169f266c6c
X-Patchwork-Hint: ignore
Message-Id: <20260415204242.283CB816A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bat: bump to 0.26.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07ab2a508e3073c01b3b18c7b2cb31169f266c6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes: https://github.com/sharkdp/bat/releases/tag/v0.26.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bat/bat.hash | 2 +-
 package/bat/bat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index 78bd1de394..16dfd2c5ab 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  e23db7a34f860d425cf0bb6f13505606024ab81035327262963d8395b4a6f3b5  bat-0.26.0-cargo5.tar.gz
+sha256  688fe9a308dc6024f8d9516b33f6f8e293087023c0a75628ad36c8e04e36a824  bat-0.26.1-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index 8084e6c2c3..d72c9395d7 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.26.0
+BAT_VERSION = 0.26.1
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
