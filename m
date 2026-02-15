Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3295DE63F08
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 010F86070C;
	Sun, 15 Feb 2026 22:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GfHddFQPEr2; Sun, 15 Feb 2026 22:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B235C606F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771193940;
	bh=kaAsynnhpjpWmyb+tzdaNaL/TvMg5N3ZGEsgutwEAj4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k18kYZq/qoBRqMNyZK1kXOKCKKUkQoLhgW/fU0OR8eaFMd8NvGt9rSy0dOJVLxXH1
	 mysYEc9idPJ/i6U5BZzuLJSfpOTpFUqRxaosmmCfxwIGoxmy5Rc7Vf3SvCCrY3TNBR
	 vyQebOwv645IJGh0eNDCNueyLoLKT2tjS17QKY9/Sla+oqfC36N6w5+J31n5o5HxQw
	 XFdhxwdh2/z8qyOnCNlhv5YTzrCLlN2cjRE+/vTwgYboU99czRm0Ji9xgBftUYmNqA
	 wNa+pGhsD+nDJJQLYj75Ui/vEX2LbzWk4Z78MDKv7NNbOfR0SrXa8COtNgqUpDbU6S
	 RLZZG5rm0zDnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B235C606F7;
	Sun, 15 Feb 2026 22:19:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A4531EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8824440870
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inOtlBcqt25h for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:18:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95FE34086C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95FE34086C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8537586EA2; Sun, 15 Feb 2026 22:18:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 23:14:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df61ce39c1ae66e9778f225e875ce191275835b7
X-Git-Newrev: b034877ca4bb9dc6426d32ba049272014c8e99a9
X-Patchwork-Hint: ignore
Message-Id: <20260215221858.8537586EA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: security bump version to 8.5.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b034877ca4bb9dc6426d32ba049272014c8e99a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes a number of hangs and crashes found by fuzzing, a stack overflow and a
use-after-free bug.

https://www.php.net/ChangeLog-8.php#8.5.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6d13f11e56..5747e153f2 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  cb75a9b00a2806f7390dd64858ef42a47b443b3475769c8af6af33a18b1381f1  php-8.5.2.tar.xz
+sha256  ce65725b8af07356b69a6046d21487040b11f2acfde786de38b2bfb712c36eb9  php-8.5.3.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 2c91ef7b63..4cba87a06e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.2
+PHP_VERSION = 8.5.3
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
