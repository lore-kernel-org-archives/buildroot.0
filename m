Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA585E66892
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 21:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 947A680BD0;
	Fri, 19 Dec 2025 21:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lI5F8pEQ7ktB; Fri, 19 Dec 2025 21:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B971C80C2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766178398;
	bh=PWB0dpDrpVEZVdF9ORcwIbTZHAuMEP0+DSIAwFzJyCU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ULSc2a3y4rC+Ut89AoH5v8+/QdCj+MA00X4DaNPantbU3yYOBkiY81oUfPuWT8fY7
	 GyVLboNedE9qySkjsKIGM+SHr/8cSkxWlEajZMiq6FhH/iNaEmL73aHIhFJTG+RJmj
	 0mVM2Vrd6L7hNo7eiOmSLEGv2CJ1FABk9cXg+lq0BX8vxM5xtF1Yktqqa8PwHdbERW
	 VENjXYKrqqO7gVDwWMtZmkE3H7k7/oCwAGVmb2bU0DmDoYW///qX4r2IIRrZRlN4w+
	 b+ierCvB9clMRepqjUqQhTD2WGEn30MpTlSt4ZQOemcbAZ5fg/2IoPgraXzGutp3Po
	 BCEYsCerDFVaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B971C80C2B;
	Fri, 19 Dec 2025 21:06:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03E711A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA17D60791
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OoLPKrBFnCs for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 21:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DACD960B4A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DACD960B4A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:06:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D50B487412; Fri, 19 Dec 2025 21:06:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 21:52:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78d0a586a8af51385df8f749549e5c9ab3be7227
X-Git-Newrev: 15258031791d34692d0784545fae7b0456064d22
X-Patchwork-Hint: ignore
Message-Id: <20251219210635.D50B487412@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: security bump version to
 8.4.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=15258031791d34692d0784545fae7b0456064d22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.php.net/ChangeLog-8.php#8.4.16
https://news-web.php.net/php.announce/478

Fixes CVE-2025-14177, CVE-2025-14178, CVE-2025-14180 & CVE-2025-67899.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0532adeed6..4a9d2e4bb4 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  a060684f614b8344f9b34c334b6ba8db1177555997edb5b1aceab0a4b807da7e  php-8.4.15.tar.xz
+sha256  f66f8f48db34e9e29f7bfd6901178e9cf4a1b163e6e497716dfcb8f88bcfae30  php-8.4.16.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index cd48cd1bd9..7524187649 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.4.15
+PHP_VERSION = 8.4.16
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
