Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAEDCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E70DB42177;
	Fri, 29 May 2026 08:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiq0gywQB7VQ; Fri, 29 May 2026 08:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A204219D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044469;
	bh=IueMuVTOiF9CDJ2KniK9E6KZWQI4L/EWMRMBn9qwyjc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YQUhw6ZMHUhMWWKjrKxFhkojZgDNddme54tEYyWnm05ST7PX8TSr2O2JHEMP2yR5n
	 p1a/xgSaaX33jeJyGn2l5o6fL2N0BCOpYNTvahBiVnzJFZzTlJ3rDIKjCOINZLejgV
	 pcM+mIEWeD57owfZMDOgarxOp2cGsHYz11tOjklndvG5DYzKsqALPJpcR1IPfqBE//
	 H/tFBSvUQTew5lY+WsTXPBU8eJcw6/dBk1NHgV76IB3RbFeOcqpXfroBgXd+WySOX+
	 Z6Ori+LkgJb+cjm1ZitguCbXXxm8EOwfBZvhtAQGTGhHv6LLSqcF4JYTsVbAdTpRGA
	 SgpQ81jZQzNFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25A204219D;
	Fri, 29 May 2026 08:47:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B872E9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9732F4219D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sblkbuGmnh1 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B83F042177
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B83F042177
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46A27873AC; Fri, 29 May 2026 08:47:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:39:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 85eb42f33df96d44cc1fe40555fa77c88a14ef7b
X-Git-Newrev: 665d4c5b3d6065a3b6ecb301678fa09f90f4a998
X-Patchwork-Hint: ignore
Message-Id: <20260529084732.46A27873AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cryptsetup: add static
 build support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/665d4c5b3d6065a3b6ecb301678fa09f90f4a998
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add static build support as lvm2 supports static library now

Cryptsetup external-tokens feature still requires dynamic library

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/cryptsetup/Config.in     | 5 ++---
 package/cryptsetup/cryptsetup.mk | 4 ++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 2773a93dd3..5062bba45c 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2, libargon2
-	depends on !BR2_STATIC_LIBS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_PACKAGE_LIBSSH && \
 		(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL)
@@ -20,7 +19,7 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://gitlab.com/cryptsetup/cryptsetup
 
-comment "cryptsetup needs a toolchain w/ threads, dynamic library"
+comment "cryptsetup needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 22c564feab..6fff7a1d7b 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -61,6 +61,10 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=/usr/lib/tmpfiles.d
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+CRYPTSETUP_CONF_OPTS += --disable-external-tokens
+endif
+
 HOST_CRYPTSETUP_DEPENDENCIES = \
 	host-pkgconf \
 	host-lvm2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
