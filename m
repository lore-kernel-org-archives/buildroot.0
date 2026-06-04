Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E7CD6E75
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 19:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C54D54ED5C;
	Thu,  4 Jun 2026 19:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MYvyuIHqKAA; Thu,  4 Jun 2026 19:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A9E0428E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780602702;
	bh=nla6Vj2uD8IZU+c3uQ6ZTBVmgrAgftHe4/0Ii4FntzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DQkJcXGO5XHRkM4yEJez0+Mg91NKHwaZclGf+yh8qbyO7cavHw/GNGzWgsUQe4cVh
	 xlVYiWrNx31GXRVMrgSt4IasD4Is8y321t4GBE+eGNiUow2/RmQmBIG8ZjJsaSPXVx
	 0XloL0oUNJaHc2FMXlnAndtW1TRlsOLBVWIH4+zHxzVo7WdiGsYUf/1kkXG0jvKRM3
	 atXkh2NqxzI4uAoz/Zy4Pexicgm1ma9B5kg5bZgUNmmkk7Ma6MSgo1ww3vr9maP6ww
	 hKnzymk2+UzwkbDTyua4XPhNHLT4kRVZfZCY5eed/Yd1WslMsbwhnQzZlJr9r9rxvo
	 y1iF+2JvUZOiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A9E0428E3;
	Thu,  4 Jun 2026 19:51:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C863192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 425536E83A
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ye2gXWHHkaRL for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 19:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 370596F8B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 370596F8B2
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:51:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A13EB87A94; Thu,  4 Jun 2026 19:51:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 21:42:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 443bec78114bfd9e7062fc59a633cb9568c55859
X-Git-Newrev: 08f8c44d150c5fa2d9c8a639c076090cd6a76bba
X-Patchwork-Hint: ignore
Message-Id: <20260604195124.A13EB87A94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: security bump version to 8.5.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08f8c44d150c5fa2d9c8a639c076090cd6a76bba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.php.net/ChangeLog-8.php#8.5.7
https://news-web.php.net/php.announce/493
https://github.com/php/php-src/blob/php-8.5.7/NEWS

Fixes CVE-2026-44927 & CVE-2026-44928.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index c85df44d73..2a89d03ecd 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  826c600b7c6f956bd335558ca3bdbcab23b22126c1cc8d9348be2280a2204bb7  php-8.5.6.tar.xz
+sha256  01ba2ed1c2658dacf91bebc8be6a4885f69b811c7993831fc48e26107ab29985  php-8.5.7.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0eae93fac2..0bfb12a8eb 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.6
+PHP_VERSION = 8.5.7
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
