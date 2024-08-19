Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07097C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 12:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBD040123;
	Mon, 19 Aug 2024 12:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmhP1CauCJLg; Mon, 19 Aug 2024 12:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BFA940143
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BFA940143;
	Mon, 19 Aug 2024 12:26:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A6261BF3E9;
 Mon, 19 Aug 2024 12:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95C5F606E0;
 Mon, 19 Aug 2024 12:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xELK875GO2V; Mon, 19 Aug 2024 12:26:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=git@douglass.dev;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93291606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93291606A5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93291606A5
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 12:26:48 +0000 (UTC)
Feedback-ID: 3578:1022:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1546788841; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 19 Aug 2024 12:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 08:26:31 -0400
Message-Id: <20240819122631.1684155-1-wdouglass@carnegierobotics.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=carnegierobotics.com
Subject: [Buildroot] [PATCH 1/1] package/chicken: Update to 5.4.0
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
From: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woodrow Douglass <wdouglass@carnegierobotics.com>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release includes a fix for CVE-2022-45145

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 package/chicken/chicken.hash | 2 +-
 package/chicken/chicken.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/chicken/chicken.hash b/package/chicken/chicken.hash
index 5a553da792..b5df49814b 100644
--- a/package/chicken/chicken.hash
+++ b/package/chicken/chicken.hash
@@ -1,4 +1,4 @@
 # From https://code.call-cc.org/releases/5.3.0/chicken-5.3.0.tar.gz.sha256
-sha256  c3ad99d8f9e17ed810912ef981ac3b0c2e2f46fb0ecc033b5c3b6dca1bdb0d76  chicken-5.3.0.tar.gz
+sha256  3c5d4aa61c1167bf6d9bf9eaf891da7630ba9f5f3c15bf09515a7039bfcdec5f  chicken-5.3.0.tar.gz
 # Locally computed
 sha256  b434ac92e094214136a6b5032f0dc9da97f22cef084ac1d0131b02a09e2caa37  LICENSE
diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 0000fc635e..ca5f756995 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHICKEN_VERSION = 5.3.0
+CHICKEN_VERSION = 5.4.0
 CHICKEN_SITE = https://code.call-cc.org/releases/$(CHICKEN_VERSION)
 CHICKEN_LICENSE = BSD-3-Clause
 CHICKEN_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
