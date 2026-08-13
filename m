Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69E1C5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 19:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9633840C76;
	Thu, 13 Aug 2026 19:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jN4gYviya0qB; Thu, 13 Aug 2026 19:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E0640C8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786649295;
	bh=EkTerXnI2G/6wXD5D6akNXvZ1n2KYCmSys9DNYwasAY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H6qyD4L8qNMInsWsj5SdX07EC1BHtZgRg43GMA+lS28qSrHu52L6g0TWkVccYfwmB
	 HloX30HLMzhLwkE/fl1Gs+SjBGZn/1Uw8kuRQpZ26caK9R47+zuiAI7i+8l8MPasjQ
	 Zv0FxtqaC0QhqunF/M9rpfjVrnToRn0qc5gaf/dcQtvnG1xfWuHhGDxA1uU9e87Yfs
	 Ts8O6CvpNMIoq06aGzUUSy2vuChe//T19N97DPBUD+LN+4INHSK0u0vZye5jmLYLxd
	 Z2d2R1cxIdyg5q9nj44dqF66dc1rLLVTxtS3EROa8UZE8ioqcFo3DDGEUK6KkIfQM6
	 rCLyCZAO7i9RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E0640C8F;
	Thu, 13 Aug 2026 19:28:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BDC52B2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7556A40C8F
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJ2r1YnxVBwB for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 19:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 628BD40C76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 628BD40C76
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:28:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B242D8D562; Thu, 13 Aug 2026 19:27:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 21:15:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e94f8d4de7b5421d5c0d21e22122a444c632770
X-Git-Newrev: 6ccc514cdc9c5e698be2493d6583226a5e19a819
X-Patchwork-Hint: ignore
Message-Id: <20260813192722.B242D8D562@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: security bump version
 to 3.8.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ccc514cdc9c5e698be2493d6583226a5e19a819
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libarchive/libarchive/releases/tag/v3.8.9
"Libarchive 3.8.9 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index dccb2cc4a7..acd4b9ef22 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.8
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.9
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.8.tar.xz.asc
-sha256  3873a88801da067d0528a989af06877710529d50ee8fe6f3970cbb4302efb918  libarchive-3.8.8.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.9.tar.xz.asc
+sha256  888c934f9d95648ecb9163dc8e23ab80a476ecb81a8f1154704a227b5b676dde  libarchive-3.8.9.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 23cb82f7b5..5b6aea3407 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.8
+LIBARCHIVE_VERSION = 3.8.9
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
