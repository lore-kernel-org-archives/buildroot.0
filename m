Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AD6F5A8B6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 19:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BCDA4112E;
	Mon, 20 Apr 2026 19:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uK0IKiSQYWGx; Mon, 20 Apr 2026 19:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6BF541127
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776712775;
	bh=lxLVLZVrgcnluzi2zQFjvkbwMvt6pqveXEzg9nfk1HI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lgj/4gAcxhlnbSZt3t3ivHAIvd/YcG/R1Ig5eQY9SLgL4mzvzUQE1vtlNf3bkZL1h
	 Qa14JvXVjmEzfrUzb1F4szxKvihcJM9l4Ix+CBkYlysQPVZ3YfB8zgE5N7pBej8SqS
	 Akgp/L3T7Sm2gdxPQh+c0k6iMu1KfdmVYk6gczm1QNBASMyXzMEX4B7gLiXxlKbSJM
	 OnaCxzDcOXyViRq1lb68WwXnrsnpj8G9bzrC/76QS2rYcwsV/477cbxEl8jyaNG6lr
	 jvPn0ZJWESDh+jK6yazS8A+Pezjj1hN0ELvCNgaW3LeG6CCBzVTkappuN7Y6l5rp4m
	 t6a2+aZ+Gmd8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6BF541127;
	Mon, 20 Apr 2026 19:19:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99445257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ADF740888
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zv7POWa8DEZG for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 19:19:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6E5F4015F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6E5F4015F
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:19:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 688BA82160; Mon, 20 Apr 2026 19:19:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 21:08:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f2228d6c9e2cc1e8447c3555d89495d0f9ba53e
X-Git-Newrev: a5366d13ba67d297440ad28a1651cf9bb037c303
X-Patchwork-Hint: ignore
Message-Id: <20260420191933.688BA82160@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: security bump version to
 0.26.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a5366d13ba67d297440ad28a1651cf9bb037c303
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/p11-glue/p11-kit/blob/0.26.2/NEWS

Fixes CVE-2026-2100: https://github.com/advisories/GHSA-hq85-3f6c-jx84

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/p11-kit/p11-kit.hash | 4 ++--
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 43a566a82c..943ad9c22f 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256  04d0a86450cdb1be018f26af6699857171a188ac6d5b8c90786a60854e1198e5  p11-kit-0.25.5.tar.xz
+# From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
+sha256  09fd9f44da4813a3141e73d5e7cf7008e5660d0405f13d56c15e1da9dcecf828  p11-kit-0.26.2.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 42de3e1065..68b1894183 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.25.5
+P11_KIT_VERSION = 0.26.2
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
