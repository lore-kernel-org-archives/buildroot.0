Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C202BC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E74840AAC;
	Fri, 10 Jul 2026 13:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1AlFPRAJIlr; Fri, 10 Jul 2026 13:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22C940A35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691014;
	bh=BJI72sg0vzWSx2DukzL0BPsFNZZKRw3sb/2h7lXn+vQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oQE64A5tUhmGjTVlX37th5TIliS1coZgtq0V3zFd/w5sslMOnPrYvq5MdsQsQ58sK
	 T6VdXYjT+KVIR1HP0F1IPO1hpdeDyeGM/xKZBDlrBrNQNoB8aRbRDitvglOpcvv7gb
	 hxN9FVB1gLIvh9yAL3zEVXvXcDcN7zJjYCSZRMUfq7OZ83mFZIVvVduXau3k8nA23Z
	 21Y3v0uDatZFx5Tqiiw4/RUlhA2FMV6orR4G6Por1jbR0On/Of1dpfXeXPRN8i0ioF
	 5ViAu1lpFPpKA9esgKhCCY3VJUqsvZ0/d9gEQKdytDVq3KZnEaLGrocGbf7S2flTq6
	 kE+usGt3P+PxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A22C940A35;
	Fri, 10 Jul 2026 13:43:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7A3DA3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9679140913
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65G2o7pzoUVI for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E4C940902
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E4C940902
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B41AB8864C; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:53:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d3d411aa79b89ee2311741369c2bcb47f94b8f42
X-Git-Newrev: 0dfac4dd3fda47baf4f60a0e570b27526dea9e59
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.B41AB8864C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php: security
 bump to v8.3.32
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0dfac4dd3fda47baf4f60a0e570b27526dea9e59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes: https://www.php.net/ChangeLog-8.php#8.3.32

This fixes 2 vulnerabilities:
- CVE-2026-12184: Segfault in file_get_contents w/ a https URL and a proxy set
- CVE-2026-14355: Memory corruption (zend_mm_heap corrupted) in
                  openssl_encrypt with AES-WRAP-PAD

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 978987ee46..11c0b2e6b0 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  66410cee07f4b2baeb0843140bb2a2b52ef930b5cf9b3d6e6d158b33aae8fa37  php-8.3.31.tar.xz
+sha256  8698ec1f9402fa5e5e872ae3d0916b62f5f27503c1fbfc9cc3521e113355ea92  php-8.3.32.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 7d9cd3cb11..9ce3b280ac 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.31
+PHP_VERSION = 8.3.32
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
