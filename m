Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E06DC55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 12:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF5780E5D;
	Sat,  1 Aug 2026 12:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id im6UwRNgD0_E; Sat,  1 Aug 2026 12:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8E5780E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785588515;
	bh=l8QCcbPCPVwlF/yGdX5VcWZcPLjb9FwTemiVl1e0mC0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CVHdvjxBJfg91JdeqaCZLksL+5ERuzSyVmCjYnBm0subPuw+5qTJHkgVvsjbjbhqo
	 6ID1k2YSBbxpwVRCzwSGkOP9CYbxiIqGWWYZU9s6pU863DRNev45gk1p2V8b5WnKE+
	 rIh9EjBNNZN1UCEvTJAtHOU8Rd48OeDl2vm2A6nQ9FLapce6T48p63nQrxnrtUp1H3
	 nmbU0tvx0JuapyfFVY8TddcEBkgk/BCdutsfM1p5F8HsIRy2ZAjGHe31ZOdanwphtt
	 61NRkI3z5uzpFRxRs8BJSSV7sKDzCNVaN4u4t7XxiX9eEFecIVb6JypRANuyp4lE9e
	 etnCVwCtCuCrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8E5780E4E;
	Sat,  1 Aug 2026 12:48:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2263FE3
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B963F40802
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3QYvqKET72M for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D68A40830
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D68A40830
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67FED87057; Sat,  1 Aug 2026 12:47:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 14:09:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 623ed7c8c7a01f493427164c98bcc731d035f45a
X-Git-Newrev: af3e7a4b128688bc89d814cfa0f8c28ff2735510
X-Patchwork-Hint: ignore
Message-Id: <20260801124749.67FED87057@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: security bump version to 8.5.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af3e7a4b128688bc89d814cfa0f8c28ff2735510
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.php.net/ChangeLog-8.php#8.5.9
https://news-web.php.net/php.announce/500
https://github.com/php/php-src/blob/php-8.5.9/NEWS

Fixes CVE-2026-17544, CVE-2026-17543, CVE-2026-9672 & CVE-2026-7260.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 3c18506359..c093ecdacd 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  58910198d19e873048fe87cdfe16bc790025417ede3d1651bfa1c4b533d573f2  php-8.5.8.tar.xz
+sha256  0db7855f25bcd0ab1d592cdb35e284d6f6a5d2ae0f6f621122e364cc39b708f4  php-8.5.9.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0e9e68a5a9..05eb4b9092 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.8
+PHP_VERSION = 8.5.9
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
