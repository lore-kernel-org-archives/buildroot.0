Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0C5E9D416
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347B76109E;
	Wed,  4 Feb 2026 17:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-3Z6IoB_7an; Wed,  4 Feb 2026 17:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D3E610B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224812;
	bh=xmPyl7g31vN0GhKEYSyCAu3RN6FZ6IWF/vFvVjAEjn4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p2TqYryicoLT+4i+1zKMefEgvaZE++ant/2YY9QdacX1q9xE5e/x6sRZkpB8q807K
	 zgpgz4grBUp9m5PBwyzIX3Y9DPb+sFXQGOwRsR63t7BdHAp2zplskZSl+B+gk0PY/d
	 CIPOj0I4Y8yDVU4uVs2Zl1uXNJgPzf129wsOxDm9sdZkkALqlR/oUiWn5P6oujBZD1
	 VNL0RaWCYf55rtDxpp2PGY6qhIFD2fiWeSDuCmQNVCQ8x6iMQqKHTgorJ+1OuRBRCD
	 iFbTxhFjZwPokvKa+RG7CgZfjVUZXjOqoRKr8XicXblAHBaG7KojUPRHQcQrkkWNc5
	 l8fFhdjRA+O+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D3E610B2;
	Wed,  4 Feb 2026 17:06:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62564173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7757583F3C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxK_ULT7jyc8 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5092583C48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5092583C48
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2941B8696B; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:25:33 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 44dda069403004e7c06b2f31f7f3a16879647c27
X-Git-Newrev: 9d4a0cdebd0ad838d12ef19c0da9b3c5355db145
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.2941B8696B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php: bump to
 v8.3.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d4a0cdebd0ad838d12ef19c0da9b3c5355db145
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This is a bugfix release for the 8.3 branch, backporting some fixes from the
8.5.2 release, mainly memory safety related.

See the release notes: https://www.php.net/ChangeLog-8.php#8.3.30

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 04ce8230f44457f9f4355d68990e8fe03b1099ec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 02ebf1b0f6..dc5f0e7a3c 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  f7950ca034b15a78f5de9f1b22f4d9bad1dd497114d175cb1672a4ca78077af5  php-8.3.29.tar.xz
+sha256  67f084d36852daab6809561a7c8023d130ca07fc6af8fb040684dd1414934d48  php-8.3.30.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 37dabdcd1a..d184186cee 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.29
+PHP_VERSION = 8.3.30
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
