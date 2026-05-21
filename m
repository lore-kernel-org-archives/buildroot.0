Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E11CD5BAC
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B0761599;
	Thu, 21 May 2026 20:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqTUerrFJQ7o; Thu, 21 May 2026 20:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C17CC61C5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779393813;
	bh=2/zZsx91ClIQT4QkdDXwGRmo1tyXwPfbQWvRzTOVaq0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CP0i8ELpxB63wCEUr1cnKwj83Z9ccQRM3UedZA5j8sp7aaUOutVZgGpX7+uvWvbW2
	 3UFhd+zNJePFqbmDS5OM50NFJflyY1ENn8aGvmSaP1Ubkvzb6/Io8UMjta6YmxHsbe
	 3F1Gzx4RhcjpEGbPottRvd1ScD0oM4DAK8dVAzmclE9nBc47FKIDP/1Xj0XOjAt+3a
	 +NUkqq0sTnrKFwohY5O2DRusxbsSm80JyWGEFBMnEoFvbMvNub5QuYLYzw9kdJtMCA
	 WoxeRdDJi6tMhH/0pks0z3D+BIhyXazA53eO6yfwGzsFBL7ivGb7Ox6liki+cATcVh
	 PIfAFonVI8g/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C17CC61C5A;
	Thu, 21 May 2026 20:03:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 340783B9
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2479A41881
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3HoEWY_JQnh for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76E6E40042
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76E6E40042
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:03:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6E6B86A80; Thu, 21 May 2026 20:03:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 May 2026 22:00:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4b761f39541dcb210b356583a767f67095253a3
X-Git-Newrev: c9e36ce80593e3d7e0bd46ffcfcd1b95499e05a8
X-Patchwork-Hint: ignore
Message-Id: <20260521200322.A6E6B86A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haveged: security bump version to
 1.9.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c9e36ce80593e3d7e0bd46ffcfcd1b95499e05a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jirka-h/haveged/blob/v1.9.21/ChangeLog

Fixes CVE-2026-41054: https://seclists.org/oss-sec/2026/q2/575
"The bug was added in 1.9.3."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
