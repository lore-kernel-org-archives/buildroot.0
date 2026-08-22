Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00805C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 10:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D656062A;
	Sat, 22 Aug 2026 10:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiffddCgt0Vi; Sat, 22 Aug 2026 10:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787395369;
	bh=RG1LD/cWhmi3EfV4CVbBk0koj6PinNIG/tWw5hTetzY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NYvIHNOhRlU7LQP+rdFrufMTy7iqYCyd1allLP7W8k18iUpTYv0wsDwBYaaaxvpae
	 vMrgw8FZ6Lo3YWzIl+axaKgBq1PA5yc4z1+tF2CQZwKvhfaebYYg8uegpVqHTnxia4
	 5xlfYzVI/WrCkvunFJ7ygT672eucW89FCV5HpNX8A6fJWheUXzsPqP2OkAlR0b4rwV
	 rBZ3FEM5NkZ0qUGTY3RuMtIT5QpUstN12H+qHNf5X8/E3lK880Ej2CjyiakF7bA1ab
	 M48eCb1IoXQtuGpENljaF8bGBa6Ui5HOgW094MQQU60/CswWmSEuGCsOWWJ1zS0Z62
	 0AL143OF8PZ5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0BC8606AA;
	Sat, 22 Aug 2026 10:42:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E7F476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E29A9606AA
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsqWbTmhXPnv for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 10:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45A836062A
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:42:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DC0288E5B; Sat, 22 Aug 2026 10:41:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 12:35:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50f635f8dfc67a2a14e580d250d592ea40df39bc
X-Git-Newrev: 883fc1b41d4a48fd58985d51c816b3663e8f6342
X-Patchwork-Hint: ignore
Message-Id: <20260822104154.2DC0288E5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtools: bump version to 4.0.49
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/883fc1b41d4a48fd58985d51c816b3663e8f6342
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release note:
https://lists.gnu.org/archive/html/info-mtools/2025-06/msg00005.html

Signed-off-by: Philippe MONTCHO <philippemontcho@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 44f0803b0f..13f34ce044 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7d57f14a2482dc4658e4b386180793ef50f0de89ee3a9a28f0a371630baac7c4  mtools-4.0.48.tar.lz
+sha256  76dfea98d923dfc9806ce34bd1786aa9b5a39d70f56f26c0670a348c664f1d2a  mtools-4.0.49.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 8c7a348fea..d4923a46e5 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.48
+MTOOLS_VERSION = 4.0.49
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
