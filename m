Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB0FC52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 12:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3873E4017E;
	Wed, 21 Aug 2024 12:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIfFG8uYO5iZ; Wed, 21 Aug 2024 12:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB7FC402B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB7FC402B8;
	Wed, 21 Aug 2024 12:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF921BF5DA;
 Wed, 21 Aug 2024 12:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B96980ABA;
 Wed, 21 Aug 2024 12:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHaV-s1FiMc2; Wed, 21 Aug 2024 12:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=git@douglass.dev;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8E1480A7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8E1480A7E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8E1480A7E
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 12:44:28 +0000 (UTC)
Feedback-ID: 3578:1022:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -151260533; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Aug 2024 12:44:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 08:44:14 -0400
Message-Id: <20240821124414.8330-1-wdouglass@carnegierobotics.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820232730.60670833@windsurf>
References: <20240820232730.60670833@windsurf>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=carnegierobotics.com
Subject: [Buildroot] [PATCH v3] package/chicken: security bump to 5.4.0
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

--
Changes v2 -> v3:
  - Add this changelog to commit message
  - Add Signed-off-by to commit message

Changes v1 -> v2:
  - Update version numbers in hash file

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 package/chicken/chicken.hash | 4 ++--
 package/chicken/chicken.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chicken/chicken.hash b/package/chicken/chicken.hash
index 5a553da792..0a3b0b15ce 100644
--- a/package/chicken/chicken.hash
+++ b/package/chicken/chicken.hash
@@ -1,4 +1,4 @@
-# From https://code.call-cc.org/releases/5.3.0/chicken-5.3.0.tar.gz.sha256
-sha256  c3ad99d8f9e17ed810912ef981ac3b0c2e2f46fb0ecc033b5c3b6dca1bdb0d76  chicken-5.3.0.tar.gz
+# From https://code.call-cc.org/releases/5.4.0/chicken-5.4.0.tar.gz.sha256
+sha256  3c5d4aa61c1167bf6d9bf9eaf891da7630ba9f5f3c15bf09515a7039bfcdec5f  chicken-5.4.0.tar.gz
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
