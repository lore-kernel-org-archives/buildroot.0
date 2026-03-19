Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAFCF483EA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C56821E9;
	Mon, 23 Mar 2026 19:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGCnP1uOwXFI; Mon, 23 Mar 2026 19:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F17582234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295278;
	bh=W9v4h/Mn+R7966Af4R+RmcCELXGL/TgomjLmxL6Rib0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ID3kMAtvYN0axEggD/De60i6QcShAckXM5kaebr67KUH885+hXxK9EEUX1BF15/l8
	 MycAYihJSUON+iRO0A6QN28d/8Mjo86x0VX05+7x+25f7oFUsdX4F20I6XxDDXow/e
	 q3BD5RVcWamfGYWireCF+1VbVAWVr5/tTKXMrjUIAbQeYEsBFB0aKMAG7bLLvGKOhq
	 K51A97+em0IQG4sBRy8ULVQD6HO0e2TBS1zzX8de/tTbDy/IRGkaxEyCNGi/JOtLXl
	 2uQ2x59+T76wNqsoyyHbQA4jSSQxfAXfUJpwG1zinrPL/auC6VsfaQCJJZfBT/V+me
	 bTdw46WUb+l4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F17582234;
	Mon, 23 Mar 2026 19:47:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 116EE356
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 311236086B
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRuAD-Bii6LT for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A5E60873
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86A5E60873
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3E6D84C4A; Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:56:11 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8ccf7b3887e641c0fa83fc2eb74f356c52a099a6
X-Git-Newrev: 34474109770f804c0e10262e8a65930391b893a9
X-Patchwork-Hint: ignore
Message-Id: <20260323194728.C3E6D84C4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/php: bump version
 to 8.5.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34474109770f804c0e10262e8a65930391b893a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://www.php.net/ChangeLog-8.php#8.5.4
https://news-web.php.net/php.announce/486

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 712e3e10cf62804dab9f95bd232c5724bfe0a09f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 5747e153f2..7fdb76b01a 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  ce65725b8af07356b69a6046d21487040b11f2acfde786de38b2bfb712c36eb9  php-8.5.3.tar.xz
+sha256  c1569f1f543f6b025c583cdc0e730e5c5833c603618613f1aa8e75d1524b8c91  php-8.5.4.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 4cba87a06e..220fb8c5c0 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.3
+PHP_VERSION = 8.5.4
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
