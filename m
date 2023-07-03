Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B09EB64DC
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 16:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7058204D;
	Mon,  3 Jul 2023 16:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F7058204D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2T0Z9E32W8WD; Mon,  3 Jul 2023 16:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC6781FA0;
	Mon,  3 Jul 2023 16:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC6781FA0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1637A1BF4D8
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E454460B25
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E454460B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dm1tAT1n-oui for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 16:21:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD5860A9E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DD5860A9E
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 16:21:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C27FA4C01AB
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:21:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33324)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGMIj-0003r2-34
 for buildroot@buildroot.org; Mon, 03 Jul 2023 18:21:22 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 18:21:21 +0200
Message-Id: <20230703162121.43701-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688401282;
 bh=vC3y1zQsBlNZlOZTzW0LzhIO7tNTsGehnuMOZ0tL7cU=;
 h=From:To:Subject:Date:From;
 b=PukmFjBm8g0BpTrvxoK6y+eok5vVqj2S2INNBFkng7WFPSlDy3wGnzwfKjPWJDuIN
 O7YZC9RvcEtv7BK6uytAiS2WQ7MuqUCfLtAxl4AwMwXAixJ4nYgoAKTlr9QPiDHK1M
 zW9qJeRKTHhJ5ofzrBenm3+nLaFC38Bz8mMaaLYdJhz2OG/SiMz8CbhttRabZm49XR
 pNNQ3LMCg5MrvJyNVkTcAZ2PPXD/sgtqU5HahAnhj8vRaK2l9hd6OSy9oEQ51613yu
 HH6A6x3p48mfEQ/xrNY5/pujyZffk1553ZIjIqh+jN+/BIVT6y4teASKCA9C/pFSXl
 HyjYiQxKz0Utw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=PukmFjBm
Subject: [Buildroot] [PATCH 1/1] package/taglib: bump to version 1.13.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://mail.kde.org/pipermail/taglib-devel/2023-July/003066.html

Changelog:
https://taglib.org/#taglib-1131-release---jul-1-2023

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/taglib/taglib.hash | 2 +-
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 7d1b2e8422..e83aa451f3 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0  taglib-1.13.tar.gz
+sha256  c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b  taglib-1.13.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index c687891002..9bdf05b85d 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.13
+TAGLIB_VERSION = 1.13.1
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
