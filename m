Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FE9C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9EFA81656;
	Sun, 16 Oct 2022 15:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9EFA81656
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qRX64uPDm_l; Sun, 16 Oct 2022 15:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB2A981521;
	Sun, 16 Oct 2022 15:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB2A981521
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DAC51BF2FA
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 395EC4091F
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 395EC4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xf0oVYzATT4a for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:52:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4130840104
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4130840104
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:52:57 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout07.t-online.de (Postfix) with SMTP id 3BE1DEFC5
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 17:52:54 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.190.223]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ok5wa-3k9x3Z0; Sun, 16 Oct 2022 17:52:52 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36454)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ok5wa-0004CU-1E
 for buildroot@buildroot.org; Sun, 16 Oct 2022 17:52:52 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 17:52:52 +0200
Message-Id: <20221016155252.1723048-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1665935572-F9452742-9762A4C5/0/0 CLEAN NORMAL
X-TOI-MSGID: d34b36d2-673a-4bbe-a015-6a1048e037e8
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.1.11
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

Fixes
- CVE-2022-31628: http://bugs.php.net/81726
- CVE-2022-31629: http://bugs.php.net/81727

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 5fb373ec11..c4c42a2c7d 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  53477e73e6254dc942b68913a58d815ffdbf6946baf61a1f8ef854de524c27bf  php-8.1.9.tar.xz
+sha256  3005198d7303f87ab31bc30695de76e8ad62783f806b6ab9744da59fe41cc5bd  php-8.1.11.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 77584813c3..7136fd9744 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.1.9
+PHP_VERSION = 8.1.11
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
