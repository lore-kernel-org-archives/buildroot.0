Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E17DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 19:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B838E41DD9;
	Fri, 18 Feb 2022 19:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWKZci967Je4; Fri, 18 Feb 2022 19:02:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8BD741DD8;
	Fri, 18 Feb 2022 19:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4681BF3A0
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 19:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06FC741DD8
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 19:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aV0G4KORFu7x for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 19:02:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B72FA41DD6
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 19:02:43 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout01.t-online.de (Postfix) with SMTP id 3CB2B7656
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 20:02:40 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.192.64]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nL8WY-1fY0q90; Fri, 18 Feb 2022 20:02:34 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:50526)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nL8WX-0005Z3-GU
 for buildroot@buildroot.org; Fri, 18 Feb 2022 20:02:33 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 20:02:33 +0100
Message-Id: <20220218190233.473109-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645210954-00000271-9AA223C3/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ac84667-29a9-4481-8a9b-e1f8c7545bcd
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.0.16
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

Changelog: https://www.php.net/ChangeLog-8.php#8.0.16

Fixes CVE-2021-21708.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index e78385cbe7..2753f9a0eb 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  5f33544061d37d805a2a9ce791f081ef08a7155bd7ba2362e69bba2d06b0f8b2  php-8.0.15.tar.xz
+sha256  f27a2f25259e8c51e42dfd74e24a546ee521438ad7d9f6c6e794aa91f38bab0a  php-8.0.16.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index c9de8c2c76..5b29692d94 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.15
+PHP_VERSION = 8.0.16
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
