Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E3AD0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB22540A5F;
	Wed,  7 Jan 2026 17:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OU_XpaUC5oqV; Wed,  7 Jan 2026 17:47:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFBF040A84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808052;
	bh=4HP09N8WJxEkGtWZSnCfo2MyXZIgMJwPbNBP+RJMLRU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j3fZPhqYx/jwx8CPWjDOi6N9B37byX7hA/HAhCI+O/oZ2FeDrDm4rGMczvJOXvarT
	 5N72ar5wLW+85fbNthbV8XIxaMuF1m36SwrgQ+2f+D//f9RtSqMUs2CpG5+gVSvXU8
	 iZStr+FpEnb7SUKJz/a5hxEnZERQOTLsKx6m9m26KI30I75a4tXzPIKk7GdzyqT+LZ
	 JIoLE8JxF/g1z5HQeetRNo4tpgOdksXl8v1uUL875SM/NxU8XLQSswchQeawm1+wtz
	 4WGJ7J753WUmbTbvPZBLNCtkR+/GdREfu8o4f2A2DGV1iysXSSHLfi6RR8mta3T3jT
	 xvNEIF1EtLWgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFBF040A84;
	Wed,  7 Jan 2026 17:47:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0472FA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18ADC80AD8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCKoM3SGmPdG for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5233880BAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5233880BAA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50E8B88367; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:05 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a9ae8f020d35c9eb6fe8cdd66fcb4381cde029db
X-Git-Newrev: e0a2bfea0a4de41f46f9df968bb805ebd893aca4
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.50E8B88367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt5/qt5enginio:
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0a2bfea0a4de41f46f9df968bb805ebd893aca4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
