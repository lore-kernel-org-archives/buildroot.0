Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545BBCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CAD7419DB;
	Fri,  5 Jun 2026 12:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fp2zT1Oqrgep; Fri,  5 Jun 2026 12:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61684419E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663245;
	bh=Gb1KTnCSxvVKTtD1C34S1RHvifNQDLVrK2pSanHOhI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NUhcgHcc7yTWOoS+LAR7YCsuxbHkLWSCb/0e0FUVETB1DTIjjpcte7sn9BtpZcKBR
	 497wMFSozLOJs1PinXfbE0Mvk/2pQVcA6lKwW3D7w4Tspz110CLN9pC9Z7UaHSbwqQ
	 +ZIhIrhb691r6yoHmWM2CD7nMrBg5r557o8Kev24NKcPvZfqg/MKaaBiMCXnVdF83c
	 VlJnXaLJsxl132ogkdGZw9iyU/UgDVLFNeaXdUsihgcqqLYVyeRMUCAUQa8DytN0+2
	 JS0fChRvKejotH8w8eHA9eV24WO0AXJP2BIKw5qSUHoioGi9MNuClRKNaTdhDIcTLS
	 jM+kFxZul2YaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61684419E9;
	Fri,  5 Jun 2026 12:40:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DCE53B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1540B81FCD
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U13vOqu50p-p for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E047182031
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E047182031
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 164C887B3C; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:13:48 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4781035ebd1cc5f4fb2800affb1a07a3fb2f1fcb
X-Git-Newrev: 14772e02f99912a667124473c3d1743c4394cd0e
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.164C887B3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/qt5/qt53d: always
 disable assimp support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/14772e02f99912a667124473c3d1743c4394cd0e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Neither Buildroot's nor the module from qt53d sources compile, so always
disable assimp support.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 11e380fb0300265b5e896a153e2dff2f0762fa1c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt5/qt53d/qt53d.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index ae15b58df3..33e93ec5db 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -14,14 +14,10 @@ QT53D_SYNC_QT_HEADERS = YES
 # command line argument separator
 QT53D_CONF_OPTS = --
 
-ifeq ($(BR2_PACKAGE_ASSIMP),y)
-QT53D_DEPENDENCIES += assimp
-QT53D_CONF_OPTS += \
-	-feature-system-assimp
-else
+# Assimp support is broken with both Buildroot assimp and the assimp module in
+# the qt53d sources, therefore disable it for now.
 QT53D_CONF_OPTS += \
 	-no-feature-assimp
-endif
 
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
