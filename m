Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4E3C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 13:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7685060766;
	Mon, 26 Aug 2024 13:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2S-0AknvV01I; Mon, 26 Aug 2024 13:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 870486076B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 870486076B;
	Mon, 26 Aug 2024 13:10:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0C11BF2F4;
 Mon, 26 Aug 2024 13:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9937440347;
 Mon, 26 Aug 2024 13:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfbRpZ8G8z9J; Mon, 26 Aug 2024 13:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=git@douglass.dev;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C2EA400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C2EA400F8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C2EA400F8
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 13:10:42 +0000 (UTC)
Feedback-ID: 3578:1022:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1185079747; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Aug 2024 13:10:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 09:10:25 -0400
Message-Id: <20240826131025.17969-1-wdouglass@carnegierobotics.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240824090753.551ad073@windsurf>
References: <20240824090753.551ad073@windsurf>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=carnegierobotics.com
Subject: [Buildroot] [PATCH v4] package/chicken: security bump to 5.4.0
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

This release includes a fix for CVE-2022-45145. Also, a copyright date
in the LICENSE file changed, so the hash for it has changed too.

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

--
Changes v3 -> v4:
  - Fix incorrect license hash

Changes v2 -> v3:
  - Add this changelog to commit message
  - Add Signed-off-by to commit message

Changes v1 -> v2:
  - Update version numbers in hash file

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 package/chicken/chicken.hash | 6 +++---
 package/chicken/chicken.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/chicken/chicken.hash b/package/chicken/chicken.hash
index 5a553da792..bf2ea6902d 100644
--- a/package/chicken/chicken.hash
+++ b/package/chicken/chicken.hash
@@ -1,4 +1,4 @@
-# From https://code.call-cc.org/releases/5.3.0/chicken-5.3.0.tar.gz.sha256
-sha256  c3ad99d8f9e17ed810912ef981ac3b0c2e2f46fb0ecc033b5c3b6dca1bdb0d76  chicken-5.3.0.tar.gz
+# From https://code.call-cc.org/releases/5.4.0/chicken-5.4.0.tar.gz.sha256
+sha256  3c5d4aa61c1167bf6d9bf9eaf891da7630ba9f5f3c15bf09515a7039bfcdec5f  chicken-5.4.0.tar.gz
 # Locally computed
-sha256  b434ac92e094214136a6b5032f0dc9da97f22cef084ac1d0131b02a09e2caa37  LICENSE
+sha256  c0ed699d5c4a8687f90a6488244f7f57d48a7f2d42bb7461b08a0d69a07d4f58  LICENSE
\ No newline at end of file
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
