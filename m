Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4857ED3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 14:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E73E940557;
	Sun, 28 Dec 2025 14:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSlTJpNFQ09b; Sun, 28 Dec 2025 14:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29098405D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766931183;
	bh=KBJoQrL/yd2W4GQoKNBdJ/JLGMTmWV/snLPWg9b7DXA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k9w3s3kXGF2smR5HXJPvwkI7+Y61o+S605aNH+Sn5HC05bBivoiN7N3djsi1R064O
	 M6ICjOFbMvobgcX4kaNAhbgkc+yTmoDVEIvJ0NPG1HMRmCPHLW0TOvVTenRuMhJE/H
	 HY/86ng2p+ZFA+is3dcR9pry2HNUqZdEK7eVQw1AJeKx4HSvtFt4zXKiCiCneKlkUG
	 FxRLInaiKZSWM8G86LVj2As3Mh660ZkAc24RaG84G4dMnLwkjOzaBP4KlkiZ6WNYek
	 FWVNX6l2WWyeigI2orVKJjBrc8lQ8ZgxBtyttPVbKvh3Ds1rkEA4mv/Vh6ZHBV/VYq
	 1MdnLU9Zrk21g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29098405D9;
	Sun, 28 Dec 2025 14:13:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A68AC1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F19B401FD
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43qWzX0Zcs3R for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 14:13:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C45BD40186
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C45BD40186
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:13:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF4D187949; Sun, 28 Dec 2025 14:13:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 15:12:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62db5ae5675a512812f8b183cb9a0216e688a621
X-Git-Newrev: 814eef2adf1ddb0507b053645918f2f7b92a083e
X-Patchwork-Hint: ignore
Message-Id: <20251228141300.BF4D187949@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5enginio: update SITE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=814eef2adf1ddb0507b053645918f2f7b92a083e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old URL returns 404.

Fixes:
https://autobuild.buildroot.net/results/064/0647daa54deb9df953d43b438ac05ebefb81b6ce/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
