Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D24C5AC80
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 684A460A44;
	Fri,  7 Aug 2026 09:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-Spr91Ph7Df; Fri,  7 Aug 2026 09:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E093D60A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095351;
	bh=DvLz4RE7guBgEDME/cvOxBX132Q/HHMtfeWt06vETvs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BZOYtAWRWBqycArbV5vrORL/NNFfYYYtUqwwtn5EQeXodXYOPJnjmrxMGYKSkAWK1
	 nRnV+ygDG0KHP+w24VXZH35GJNlhuwMmkI5lC1kIoNGMN53l4qLmPO1iJcG7UjA/5r
	 dLDT6CXyNhGKL9F5QhXEypzjqeYhnQIHXbcOAn12fvRsxBu28FTpEc6Rq6upQzn++z
	 bleNEnp7fH9WxOpa8k25COFvzSkFLFlcSfoJtlC6BTrewPhPAdX8SoXMbB93Kpjtod
	 cYXXLkcl6/alWbk5LpLiVWR9BtOyoz9msHaEnULTvDI382DSfprXwiL+HdYsamx9ot
	 KLA8Hn7SoKwPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E093D60A3F;
	Fri,  7 Aug 2026 09:35:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF971D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D65A440064
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hydTQKdJNbn0 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9E9B403D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9E9B403D9
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F88A8CA42; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 287dd16fe365d297395d204011bc5d567ceb700c
X-Git-Newrev: 8410c94db50d6d9781cf17272c5244753fd50cef
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.7F88A8CA42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/php: security
 bump version to 8.5.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8410c94db50d6d9781cf17272c5244753fd50cef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://www.php.net/ChangeLog-8.php#8.5.9
https://news-web.php.net/php.announce/500
https://github.com/php/php-src/blob/php-8.5.9/NEWS

Fixes CVE-2026-17544, CVE-2026-17543, CVE-2026-9672 & CVE-2026-7260.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit af3e7a4b128688bc89d814cfa0f8c28ff2735510)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
index 56d66e40d7..ec69ef18c7 100644
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
