Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D55C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 14:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C10A180F1C;
	Sat,  4 Jul 2026 14:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yygj2lxhVsHB; Sat,  4 Jul 2026 14:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E316980F1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783177196;
	bh=b4bhTw8WcYFHeOE4+TkVP7DMnBLlRQU7C5bdWiede2c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=llXdXz52QiyQc80OEasRrPioV5ml5YO6ch2imZwVmAn+hDp56D9JgNK7b4jabz5h+
	 zj2g6ht57VJTl/XD1KTe0XzXOSSlhcwW6VJZa4BY4Ai8RtZmqPjZV1KNiM4DZYFF73
	 Gri16jkC302b4ZYb9QZDpRSNj+GA0qk25YHY3MOIlI8JiNrzEoSTibyquskm0GD5dQ
	 DuF5CS35sjWOOpX3QepCezioQYSHF8ApQq51NiPIfAQVzJArO6hefnHbXdG9yqOMLE
	 jGlI5w/WQHn1dx7/nvc2UIf6RdN11YdlKbPgwKMzuDoeI+tLGYKjzID0XuBqGAI14L
	 8U6KR71UrL0gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E316980F1D;
	Sat,  4 Jul 2026 14:59:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EFA8363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7104280F1D
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTAde2P2sBIZ for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 14:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D85E80F1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D85E80F1C
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:59:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B45808834B; Sat,  4 Jul 2026 14:59:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 16:46:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45a0ce557d9508f437dd196eb95107958283abf5
X-Git-Newrev: beb6be6b06e3dc536a24ea99c0e94d81c75a1212
X-Patchwork-Hint: ignore
Message-Id: <20260704145923.B45808834B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: security bump version to 8.5.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/beb6be6b06e3dc536a24ea99c0e94d81c75a1212
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.php.net/ChangeLog-8.php#8.5.8
https://news-web.php.net/php.announce/498
https://github.com/php/php-src/blob/php-8.5.8/NEWS

Fixes CVE-2026-14355.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
