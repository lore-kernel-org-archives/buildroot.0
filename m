Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F987C61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 09:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA12A60705;
	Fri, 28 Aug 2026 09:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOeVQTW88ZoM; Fri, 28 Aug 2026 09:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787908113;
	bh=JyLQmb44LrmzJa18qiqnXc5Y6q5sM51ZEnZY964K9cw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HLDd+ykzxj31kiiz5t6dIYiq2MHxeOIk6Fhkyjgvj4o9kSHUnP+jhx9ypB8l0n2Z+
	 1TFfV3yg4fCOVjMLnAX3TFFRzKYch/hoo9N74Uf/qA47BG8imFG41Q1hIMhUw+Sf2H
	 E1qIm9u0BRe4jItTFXeB/5EQ6X/U5dtVyuNfGBUno+mpoBEdQqtk/wTHDxsiedcH7F
	 RBz8omNquzGzRtYt+Zc9M0KYB9UsKV/Y4mjrAUg7otccUgvdCZ7MV2ck/5OGFXg/Wy
	 T/8upwR5OWPP6mPET4cw9M4JPqHIxiWlulb4g4/EFgouliWfJEztNrR4xGMpgqsleC
	 YPGe385JJZ9tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CC2F6070B;
	Fri, 28 Aug 2026 09:08:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A9CB386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4A5360738
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKuXSpetQ4cy for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 09:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08C4D60705
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:08:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AFD1921BB; Fri, 28 Aug 2026 09:07:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 10:47:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 211cfafa166d75a30a08b2a050a356a222c3a831
X-Git-Newrev: 6561717f1877d35457eba5340307ea6f4ae44e20
X-Patchwork-Hint: ignore
Message-Id: <20260828090733.1AFD1921BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: bump version to 8.5.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6561717f1877d35457eba5340307ea6f4ae44e20
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://news-web.php.net/php.announce/504
"This is a bugfix release."

https://www.php.net/ChangeLog-8.php#8.5.10
https://github.com/php/php-src/blob/php-8.5.10/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index c093ecdacd..0b3d87fd97 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  0db7855f25bcd0ab1d592cdb35e284d6f6a5d2ae0f6f621122e364cc39b708f4  php-8.5.9.tar.xz
+sha256  6a8bebaa4d5a979a38db29a9373e9851f60c6b11f72172c585947e78f3081957  php-8.5.10.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 05eb4b9092..ac5730a22c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.9
+PHP_VERSION = 8.5.10
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
