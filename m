Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABE4C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:15:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD07D61029
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD07D61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9819D82B69;
	Sat, 28 Aug 2021 08:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOmQkSXRjBnV; Sat, 28 Aug 2021 08:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBA92828DD;
	Sat, 28 Aug 2021 08:14:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEF181BF30A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9935E4261E
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tj8JzC_ISOPc for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 08:14:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E14442610
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:14:52 +0000 (UTC)
Received: from fwd02.aul.t-online.de (fwd02.aul.t-online.de [172.20.26.148])
 by mailout07.t-online.de (Postfix) with SMTP id 15B31181
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:13:31 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (GoQpxYZDohUu80718brBvJ-QeoMMLqD16sqWwZkprbKKx2PTomC9IZc8LWzKamngg8@[79.214.206.166])
 by fwd02.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mJtT0-1wzWC00; Sat, 28 Aug 2021 10:13:30 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:37688)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mJtT0-0006o5-6M
 for buildroot@buildroot.org; Sat, 28 Aug 2021 10:13:30 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 10:13:30 +0200
Message-Id: <20210828081330.559994-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: GoQpxYZDohUu80718brBvJ-QeoMMLqD16sqWwZkprbKKx2PTomC9IZc8LWzKamngg8
X-TOI-EXPURGATEID: 150726::1630138410-00000CA1-B4AB3784/0/0 CLEAN NORMAL
X-TOI-MSGID: 1eea4d83-0371-4e50-b257-2e33b0ed0cfa
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.0.10
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Quoting https://www.php.net/
"This is a security fix release."

Changelog: https://www.php.net/ChangeLog-8.php#8.0.10

CVE-ID were not mentioned in any of the fixed bugs.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 1a1698eb9b..70e9e1fc44 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  71a01b2b56544e20e28696ad5b366e431a0984eaa39aa5e35426a4843e172010  php-8.0.9.tar.xz
+sha256  66dc4d1bc86d9c1bc255b51b79d337ed1a7a035cf71230daabbf9a4ca35795eb  php-8.0.10.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index a1ad6e3296..ce20b09a46 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.9
+PHP_VERSION = 8.0.10
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
