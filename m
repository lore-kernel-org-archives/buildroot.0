Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9D6EB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 05:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D15C240142;
	Fri,  7 Jul 2023 05:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D15C240142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZA5K5RSNETV; Fri,  7 Jul 2023 05:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DA7640412;
	Fri,  7 Jul 2023 05:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DA7640412
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 560811BF45A
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 05:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B37E6110B
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 05:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B37E6110B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNE5-lBOqCUC for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 05:34:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43AAE60B57
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43AAE60B57
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 05:34:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E84CA4C00F9
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 07:34:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39230)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qHe78-0000OP-1H
 for buildroot@buildroot.org; Fri, 07 Jul 2023 07:34:42 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Jul 2023 07:34:42 +0200
Message-Id: <20230707053442.192171-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688708082;
 bh=3SdcQyT4Lh/kyBjS12WNL0fkPK60+7k311vg7tzJEEM=;
 h=From:To:Subject:Date:From;
 b=FNaNr+zm5WTpsU6ATVulk+jZCj+OqM/8LoYQHJhBtvSkHXziTCZAXIueEXCperXS3
 Y7Sq62OZukIkrCuvWsK4wme8fO8rAG3oN9MfSLhpCSWHi9ZW4uzsE5SBZbM+qrplR+
 knM0fb1bSj4Z+AVNtYDpgcrBfF3nwOm+PDsX2riGq+8lpjdozvt8S7J4wR9C6sz1ri
 XqPXsM3EdA+zJy8lJAB9yuDZTA7NQ7JCUTZxGzNm+gCgF2JolWAhBFHX03cVkhnojs
 ES7bR3zG1/gEyNCbW1sSvyJ2Jk1TbxxlkZ6MnFBBqg2/g6dYBYeu2jwzePRbr6+Vjj
 AsqlnRY830szg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=FNaNr+zm
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.2.8
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

Changelog: https://www.php.net/ChangeLog-8.php#8.2.8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4fe77f1c5b..9fb4aebec1 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  4b9fb3dcd7184fe7582d7e44544ec7c5153852a2528de3b6754791258ffbdfa0  php-8.2.7.tar.xz
+sha256  cfe1055fbcd486de7d3312da6146949aae577365808790af6018205567609801  php-8.2.8.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 3bb27f1306..6a2a6ae71b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.7
+PHP_VERSION = 8.2.8
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
