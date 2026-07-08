Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E497C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5507740BA5;
	Fri, 10 Jul 2026 13:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhEaIWVwt8NF; Fri, 10 Jul 2026 13:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D387140B77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691116;
	bh=s3+I25WqXaD6lCJ9FFzSTSOofZHfXr+Xf3EMN5CWDcw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ojRJ6OHL86Gc6yuUmi40OnoemEWsw0gmGI/ewuA1nFspJ9TimZDNIh3mv3cfCjKE1
	 oY40HuL5FbKxfn2UMLO9+mY/AXG9V/E4iUQ7VkQIsE1vwI+cy8wPuW6LYaoKII3jpi
	 oBZQRNjPFf1vCgWqcgMyfVeEuaCcqH+3ZUmr4wYgD/Jectmy+kZahUweWte+xPQcof
	 yXm9EG2ZOz49ZVlCy8wUPpS43d9cZ+4BW6OVyHnlRzac+fpgJp28xGUiMjO8fz6uZN
	 QX+ZwODyS557u2XpnpufdZ4QhFmU03H+2ccaCWb5LBjd4cMgrWdMmT436fn+4GXD6t
	 Xl44GekttA63w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D387140B77;
	Fri, 10 Jul 2026 13:45:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23B062FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07188810B6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvaLZAjlWROI for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0B59810BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0B59810BE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4FA78867A; Fri, 10 Jul 2026 13:44:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:53:26 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 023a2fffa5dec0758793ad966925d145bef51112
X-Git-Newrev: 190ea0849b161af57507c89e462083b813b6d0cb
X-Patchwork-Hint: ignore
Message-Id: <20260710134417.C4FA78867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/php: security
 bump version to 8.5.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/190ea0849b161af57507c89e462083b813b6d0cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://www.php.net/ChangeLog-8.php#8.5.8
https://news-web.php.net/php.announce/498
https://github.com/php/php-src/blob/php-8.5.8/NEWS

Fixes CVE-2026-14355.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit beb6be6b06e3dc536a24ea99c0e94d81c75a1212)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 2a89d03ecd..3c18506359 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  01ba2ed1c2658dacf91bebc8be6a4885f69b811c7993831fc48e26107ab29985  php-8.5.7.tar.xz
+sha256  58910198d19e873048fe87cdfe16bc790025417ede3d1651bfa1c4b533d573f2  php-8.5.8.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0bfb12a8eb..56d66e40d7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.7
+PHP_VERSION = 8.5.8
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
