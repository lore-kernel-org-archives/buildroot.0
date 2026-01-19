Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227F8D2ECEB
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 20:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B780D841EB;
	Mon, 19 Jan 2026 20:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ogytJOgJhZD; Mon, 19 Jan 2026 20:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3294841DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768856184;
	bh=yRAuQ156Q6zMxf0oyJ9m8tWSczZJHG9hzkoThM4IJew=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LiVE1GMvusHHrg1v3yX/ZZYeC6tnMDoaZtJN3V3tiBghq/bBRH9aD6JTx6xVJAJvK
	 DlpGBJZUgOq863/EQgbkNJxISd9Jnk6mTe++OeQXLLnGTtVLCNrd05Z8CR1XUoxmMM
	 5psC5eHs2UrcESRntRYj/v2kF4+U+y912jwVJjLMr4N2pQZjRZXC7/xELHn8mYQ+3R
	 cNdbMG/7QoLA+xkcq+f0C+B4ovfEriZYN3Ss5nuBJm1E8VUOU6grreAlchMkLj+vdW
	 gUX0QDe/C/iQnWb0kCl/Qf10Z6qLr1jC/l/l0UK9J6dkfH8UmOSOfiJhhtD5h6Po3f
	 UkekqLFaMSCdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3294841DA;
	Mon, 19 Jan 2026 20:56:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 935DB2A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81B54841B3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsVMIUhLxItJ for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A150F841B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A150F841B2
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D992886C4; Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 21:20:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 888beb6c4493cb9d23958a8c1fb8b80e87d899aa
X-Git-Newrev: 04ce8230f44457f9f4355d68990e8fe03b1099ec
X-Patchwork-Hint: ignore
Message-Id: <20260119205617.7D992886C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: bump version to 8.4.17
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=04ce8230f44457f9f4355d68990e8fe03b1099ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://news-web.php.net/php.announce/480

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4a9d2e4bb4..23ca842b72 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  f66f8f48db34e9e29f7bfd6901178e9cf4a1b163e6e497716dfcb8f88bcfae30  php-8.4.16.tar.xz
+sha256  28b234e347286158cae921d61283eb1169d89bc9d2e5f5976567260ff38b0bfa  php-8.4.17.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 7524187649..aa6050c1a7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.4.16
+PHP_VERSION = 8.4.17
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
