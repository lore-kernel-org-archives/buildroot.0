Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B94EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 391CB40977;
	Thu, 30 Dec 2021 17:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yK16046-wDEL; Thu, 30 Dec 2021 17:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9450D4089F;
	Thu, 30 Dec 2021 17:53:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3943C1BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35AE781366
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOx6pvSWKY9A for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:53:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59B9281339
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:53:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (27)
Received: from bartekk-pc.lan (77-255-27-94.adsl.inetia.pl [77.255.27.94])
 by server220076.nazwa.pl (Postfix) with ESMTP id B20AF1C57E6;
 Thu, 30 Dec 2021 18:53:03 +0100 (CET)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 18:53:02 +0100
Message-Id: <20211230175302.441388-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/barebox: bump version to 2021.12.0
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 01d66dce70..23f8a5ac8a 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2021.11.0"
+	bool "2021.12.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2021.11.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2021.12.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 371bf15029..0a853866b5 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,8 +1,8 @@
-# From https://www.barebox.org/download/barebox-2021.11.0.tar.bz2.md5
-md5  e7f7629701e9e8b9566b6799b422de5e  barebox-2021.11.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2021.12.0.tar.bz2.md5
+md5  199b6d7ff3441cec2062ab18a52454dc  barebox-2021.12.0.tar.bz2
 
 # Locally calculated
-sha256  34fbd33e17d052a7d8d64918183170675008768fe7618c31c16b9f5c92803c6a  barebox-2021.11.0.tar.bz2
+sha256  555569fe9e71524e0bf927eaa2c1aa2e81ee2c34dd71e39fe21620db6ccc8aa6  barebox-2021.12.0.tar.bz2
 
 # License files, locally computed
 sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
