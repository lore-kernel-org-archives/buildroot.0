Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01411D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF0B883409;
	Wed,  7 Jan 2026 18:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cp1wmQfnUDzT; Wed,  7 Jan 2026 18:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF2A8833C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808976;
	bh=X8lcJGMmi7oCUz9dogSaDGIOF6uJ00iaQCmyR8YtMGM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nHzhXf2kn9MlSQh3j3cuoXnyu/Je7hNV7NXpMfdR1w/zNqZNx2IpWsoOnfy7iOw38
	 mTH7/TBXWiduSZjnyOz/bG9sImzFFd08jB+9e3N8BAfwFCfPi1mywyV7rzUmhhfULr
	 NaYWsdh8Cpt+Uu9+Hh4jGmzVMgUEF6ft0vfOv01+OcSZyOQjhrcXptYEW2D5ORSz3g
	 iq+Wtrrod1+LDxtzlCfQqpf2sRSzgGBiJ6icQmnHyJozpTXtiJxmHkjF9DSxsRMONy
	 eQP7YOKCmbrUG+nmRQy8DlK7kcBbUB1j12hcKL5QLSUDluDNMwk4HV1lvUBXdefXex
	 xPraZjGv+kKvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF2A8833C9;
	Wed,  7 Jan 2026 18:02:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC829ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56D1D40DDA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIwjM1zWQraQ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ECBD408AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ECBD408AA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E0C98268F; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:56:10 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 0584d66576fd5a62db90b25a10bf502ce2867a9f
X-Git-Newrev: cb492295c02e9889a017f31d31a2103da515c2bc
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.5E0C98268F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/qt5/qt5enginio:
 update SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb492295c02e9889a017f31d31a2103da515c2bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Old URL returns 404.

Fixes:
https://autobuild.buildroot.net/results/064/0647daa54deb9df953d43b438ac05ebefb81b6ce/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 814eef2adf1ddb0507b053645918f2f7b92a083e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt5/qt5enginio/qt5enginio.hash | 2 +-
 package/qt5/qt5enginio/qt5enginio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index f1ad364ca3..f268458e52 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,4 +1,4 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtenginio-opensource-src-1.6.3.tar.xz.mirrorlist
+# Hash from: https://download.qt.io/new_archive/qt/5.6/5.6.3/submodules/qtenginio-opensource-src-1.6.3.zip.sha256
 sha256  d907060b355512ceb7a8c3f6980e3979c20d54320b6804303b6c5e8ed42d3912  qtenginio-opensource-src-1.6.3.tar.xz
 
 # Hashes for license files:
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index b74775f298..dd3f3a5d6f 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -7,7 +7,7 @@
 # Qt5Enginio does not follow Qt versioning
 # see https://bugreports.qt.io/browse/QTBUG-50111
 QT5ENGINIO_VERSION = 1.6.3
-QT5ENGINIO_SITE = https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules
+QT5ENGINIO_SITE = https://download.qt.io/new_archive/qt/5.6/5.6.3/submodules
 QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
 QT5ENGINIO_DEPENDENCIES = openssl
 QT5ENGINIO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
