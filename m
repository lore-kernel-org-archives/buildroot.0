Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964DDCCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 629E540D2C;
	Mon, 19 Jan 2026 09:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wl54Xh6gO1MS; Mon, 19 Jan 2026 09:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8183740D3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816761;
	bh=ZgjjrAWbDIV/Nmn5iTAD4YD7X6H0fosPJbaPRVa4R/k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qZVSkw2CM6Uqi0ufpAmjGQwl9EXpiY+6VasbcgxN+Fri321fO+7IuWfiaj6ezuxZS
	 +KX6Pqmaj45eqd7XcS0APVTUdhlX3j1J6Tu09Xs8guq9DSja2qQshXX7JrRVdvK5L+
	 0VHPU1blbtQtdFeRk9tGEPSgcEAKYUessZ+eES1B7V6AFtfLhHgWMe2Yju3pVtkyLS
	 vJh7DUn1LBv3KssTHYxO2bjdmse2WXNjx9cJR4DR0yBQq5FUussdbojpp9BaOYhDNZ
	 6sk5OaNWQZI8pQ7WvOWS7SopIbJ4RatQeo1tZg+gVXTA8SgaGTvNXGItKfZTq81RXu
	 VOcXsQ8qXkMPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8183740D3C;
	Mon, 19 Jan 2026 09:59:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EF7B2CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E84F406D3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2YEc-KO7SIk for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCD26406D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCD26406D7
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAFF988679; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:35:10 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 39a3758ebccaba73ed7a66e6f24fb14df598f4e4
X-Git-Newrev: a84c83d2962a7e5fd08b408e1248bdf2455163ab
X-Patchwork-Hint: ignore
Message-Id: <20260119095850.BAFF988679@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libarchive: bump
 version to 3.8.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=a84c83d2962a7e5fd08b408e1248bdf2455163ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes a bsdtar regression introduced in 3.8.4.

https://github.com/libarchive/libarchive/releases/tag/v3.8.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: Mention regression fix]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 13c3e723cee2a2c892c51dee9a10c37dc38d873d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 1a61d254f7..db7ed95bd9 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.4
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.4.tar.xz.asc
-sha256  c7b847b57feacf5e182f4d14dd6cae545ac6843d55cb725f58e107cdf1c9ad73  libarchive-3.8.4.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
+sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 083e913033..f3e90e5910 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.4
+LIBARCHIVE_VERSION = 3.8.5
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
