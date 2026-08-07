Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F103BC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C4940A0B;
	Fri,  7 Aug 2026 09:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-f0Oyt-lT5G; Fri,  7 Aug 2026 09:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE4540A1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095249;
	bh=4C3IUDPAYY2vbLtSX/3k0hjlHsxt+GyY4w9lEOOBFiM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AGk1qBj8xZ/0eAiIqmvP9ICa8hB7uDQQXNZhgoebrc7pJ24fIWUaO9L7DWZ7xi/ep
	 xv2cq4dA4YlBt1romJe11U/FMufpmvbMLD1dYpMessXSW7gNI6HfBgdkEOn++aRQmr
	 bU5M6Smxvs/FbmyHhhfVo91lRJ/m4qNN3Ni/MQApc7YX4B6glYpEE2N4Yt8xUeVxBC
	 bKBt1Q+CJ8yrcHUmmIE3vvhj4wCfZsYFBUKIn/X47Sc/Lu3pxsO4SRvD4pjHESRT/e
	 fO74aIqMHr80mJ3B9wGL+MFr67R06Jvvfb+ETBthblqVUMpGZdFEpIjy33eD9VBc+2
	 5VvUA7kK39/sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE4540A1D;
	Fri,  7 Aug 2026 09:34:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15BFFD3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0391540A07
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FW_lN-cdONkP for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F04FC409FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F04FC409FC
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85EF58CA44; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ae22a252b9aca34afb29c21c043eabff652c6226
X-Git-Newrev: b6998aa87e07e04606f9f0c468e7eac5948b9405
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.85EF58CA44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php: security
 bump to v8.3.33
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6998aa87e07e04606f9f0c468e7eac5948b9405
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes: https://www.php.net/ChangeLog-8.php#8.3.33

This fixes the ffollowing vulnerabilities:
- CVE-2026-9672
- CVE-2026-17543
- CVE-2026-7260

(alternative to commit af3e7a4b128688bc89d814cfa0f8c28ff2735510)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 11c0b2e6b0..dd336f0e65 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  8698ec1f9402fa5e5e872ae3d0916b62f5f27503c1fbfc9cc3521e113355ea92  php-8.3.32.tar.xz
+sha256  e293ed620cec74651bb4a071317892a478aa6840fab22db45c72d77cd42f9676  php-8.3.33.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 9ce3b280ac..3389b9c530 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.32
+PHP_VERSION = 8.3.33
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
