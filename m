Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B14CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D6CC61398;
	Fri, 29 May 2026 08:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLiE4RDai00b; Fri, 29 May 2026 08:26:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 832F8613CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043164;
	bh=TslYy+nQrgYiJPM+CV2WYO/XKT7rlVUhKOwYxWLG2/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KhNq3eWM7eRvAbKqWbfUPj6KBzYPdhSoSMIlMwsnZV3FSp3vHM0luRkJqXjCqnFsn
	 uPuVzsA7ZNMa4V5LTEIEcWfgu6rH/dbjaPDq/9NmYo5AfPeee39YKScaBwvodTHO4O
	 0qJLE7YP4BoxD2C/MXB60YXVuUq0hos/uvAdNmkTAfHuXMOrc//eeTKEn1SG7f1zOM
	 395HPhPJhbR1Qt+rpota1D7BBun4s95gUtA1aDcp1BCqBqmisoGGghif8x8BxAznyi
	 wyXr/mgs4zjqEszqermzsvuksjn67fdGULY/uApGU7efzUyYAjncYiLVCyDb1Wdu9g
	 A39cjUf3fm7uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 832F8613CC;
	Fri, 29 May 2026 08:26:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06D00288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F234D41F81
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgEJpGYUQ5wd for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD1BB41F84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD1BB41F84
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CC8387334; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:48:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ff85f9f4607022860ae0be8fcf3e1b4b5363bbad
X-Git-Newrev: b262cd01bb72a6a289dbedb0ff518cbcd58ab41b
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.4CC8387334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/haveged: security
 bump version to 1.9.21
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b262cd01bb72a6a289dbedb0ff518cbcd58ab41b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/jirka-h/haveged/blob/v1.9.21/ChangeLog

Fixes CVE-2026-41054: https://seclists.org/oss-sec/2026/q2/575
"The bug was added in 1.9.3."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c9e36ce80593e3d7e0bd46ffcfcd1b95499e05a8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 066e21c132..0aee4d5e0c 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acbb05776668657012273be9bb3310e3140b79959aa4538e4cca8d30d40c0b8f  haveged-1.9.19.tar.gz
+sha256  14e711975401ad03fdb29d2dcc20a501596ee752d92affdf43dcb3ad61cf20ff  haveged-1.9.21.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 0e377d36ce..e22712f016 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.19
+HAVEGED_VERSION = 1.9.21
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
