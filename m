Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6E9107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B99B40688;
	Fri, 13 Mar 2026 21:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qnygCEP_iz4; Fri, 13 Mar 2026 21:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B4B4062D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773436318;
	bh=ghX8RmCdXj1MrYILPeLA5jVYQ3xZqvYF8091/sLTUG8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nvdrQGOwvTpKW9eGjALo+5FfgNhSuigOK+SOc6kcqztugIcN5I0efFoH4VOR0X7FX
	 TYvJh2sALK7DvzyJadi24R5uk+JlMJWzu54sAA14h/95HA098Zb1VoaM0QRJYYsG1F
	 EzDgbgbJe2TdgI7CVCQ45MNA6tWx2Xiq+f9ZBIPmTjaB6zNTFNWbXTBSjMbtswbE3m
	 gKGT4rg23rsotmrAVMEG9ZCgKZoaSSFw5BAmR2+CudqanYQz20aW4utYYicT9q+msk
	 lXqqeaQQbdtRWW8ErgcwwBg4XizMNaIem9f+ordSHrRpZWDlshfEAlE8rOUWTqEcv+
	 TJWQQ1P1cXOGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B4B4062D;
	Fri, 13 Mar 2026 21:11:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B0541AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C65460A88
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fqh1aVMJt4kv for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C3F660839
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3F660839
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:11:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32AA286FBF; Fri, 13 Mar 2026 21:11:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:58:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dbb2a0aaa66e84f7318f7bfb0f9411cf3ef5b4e
X-Git-Newrev: 712e3e10cf62804dab9f95bd232c5724bfe0a09f
X-Patchwork-Hint: ignore
Message-Id: <20260313211156.32AA286FBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: bump version to 8.5.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/712e3e10cf62804dab9f95bd232c5724bfe0a09f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.php.net/ChangeLog-8.php#8.5.4
https://news-web.php.net/php.announce/486

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
