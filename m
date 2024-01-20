Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA569C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 15:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F5EB82861;
	Sat, 20 Jan 2024 15:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F5EB82861
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0yxFvDMzNwd; Sat, 20 Jan 2024 15:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B504F8272A;
	Sat, 20 Jan 2024 15:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B504F8272A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97C0E1BF34F
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 15:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CBA84252F
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 15:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CBA84252F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1wt-X6W5Oev for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 15:50:11 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8616142522
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 15:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8616142522
Received: from fli4l.lan.fli4l (p5b3a01c2.dip0.t-ipconnect.de [91.58.1.194])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69666A4C01B7
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 16:50:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46158)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rRDbk-000000000CY-0tfE
 for buildroot@buildroot.org; Sat, 20 Jan 2024 16:50:08 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 16:50:08 +0100
Message-Id: <20240120155008.3148748-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1705765808;
 bh=M0b0JVLCeC5KsRQhVPAbItHUr0+5JvX76TjwvF0D6og=;
 h=From:To:Subject:Date:From;
 b=wVqQY+3f7aJ/wUMGOo+kCxQRVRqh5GuO3W2foovhNedFc7oLWY67BI77hXLMVaYpk
 3K7s3pyLQMFXtvzLxb/Yf0XpCbU/SrHaGUuUK75fTFEB9KjciIkvEKiQQm8cn1Iipn
 psrRGd3fin3IIl0wDIYYxOF3+VoftiToEFjF1A2VbPqRAuQoyu2JE0pDCohSkqnUQt
 qXwXa/vN3Debw9UiNjSrjgEpk5V6kfMbKXftWv8CJKj6NwnjWOQ2aLnG2yHyO7Qzh/
 1oBC7im1XJdbW2WdvD8EjCImYapFLkkWK2l1YvfGxEpzRziwp7V6dJZ7wP4CbJ2LfC
 AOaHGFivigAhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=wVqQY+3f
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.2.15
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

Changelog: https://www.php.net/ChangeLog-8.php#8.2.15
Release notes: https://www.php.net/releases/8_2_15.php

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 3759852a9b..7c8736e41c 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  763ecd39fcf51c3815af6ef6e43fa9aa0d0bd8e5a615009e5f4780c92705f583  php-8.2.14.tar.xz
+sha256  eca5deac02d77d806838275f8a3024b38b35ac0a5d9853dcc71c6cbe3f1f8765  php-8.2.15.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 63fcfd8634..c69abd5f31 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.14
+PHP_VERSION = 8.2.15
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
