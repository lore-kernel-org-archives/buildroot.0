Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DBDCCF2DE
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 19:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92E280CF9;
	Mon, 19 Jan 2026 19:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JtD9qHsG5Mcg; Mon, 19 Jan 2026 19:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1CAB80CC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768851893;
	bh=I+gnHrJVQ6IIm1mxs4b/gNs7jg5DzPYV6Jass5Xni5k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NfYNksXeOlOtIBCl0ADPtt7Ud1TgEKP07xhXsARdlUh4hh2pLzJ/gkYU7FATlJiPC
	 WriDIFHDdBdD07Olg9dUEdBsME+qU2Y/PsqB+gJFgnG4EC3hDKiSSb5lUA2e689P2Y
	 YObWCSlrSaBJEZAE9RKsZoDB9GkDe23tiuDvfiVu5zSOCbj83N1GzMCdd+qBdD3S8N
	 k/dIGHBDimZx4gSpEhOzZjuFIUAy3YffPOuVS4cCQ7PQYlNNtdI/c4rVlTTHpgqKCV
	 +ED7gYFmQGTVR1rUI52+lzu7hJ0iD0FEIOdFepZrQx+RxWyH0/GKYMbhE1XMKrZ+Pu
	 WFQsRLFULI8lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CAB80CC3;
	Mon, 19 Jan 2026 19:44:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F7BB122
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 19:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EEA0415B8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 19:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02LvtUlnZyLr for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 19:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43FB3405EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43FB3405EB
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 19:44:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 206618864F; Mon, 19 Jan 2026 19:44:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 20:43:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45181a9a5e03f62db580f4d05f9a816368aa07f0
X-Git-Newrev: c654e2b7c5c8ad267493142597fd7231bdd74248
X-Patchwork-Hint: ignore
Message-Id: <20260119194451.206618864F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmocka: bump to version 2.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c654e2b7c5c8ad267493142597fd7231bdd74248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://gitlab.com/cmocka/cmocka/-/blob/cmocka-2.0.2/CHANGELOG.md

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmocka/cmocka.hash | 4 ++--
 package/cmocka/cmocka.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index 5061cf30d0..2e273e7a16 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking pgp signature from:
-# https://cmocka.org/files/2.0/cmocka-2.0.1.tar.xz.asc
-sha256  3f3533382ba29ab3abf5c4f4b27b79d165f0df51ea587de749b11b68b4019180  cmocka-2.0.1.tar.xz
+# https://cmocka.org/files/2.0/cmocka-2.0.2.tar.xz.asc
+sha256  39f92f366bdf3f1a02af4da75b4a5c52df6c9f7e736c7d65de13283f9f0ef416  cmocka-2.0.2.tar.xz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 4dd78f39cc..747fd7b189 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 2.0.1
+CMOCKA_VERSION = 2.0.2
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
 CMOCKA_SITE = https://cmocka.org/files/2.0
 CMOCKA_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
