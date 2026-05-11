Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2173CD3427
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DBA384440;
	Mon, 11 May 2026 10:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y02-BN1GDjFN; Mon, 11 May 2026 10:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ED188442B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778493745;
	bh=h9r8jOybs+dbNiPhOvV9igzY+IDe3MnbqcBcqrQ6mkQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iRi/SDznumEb6XQA9rMyBYc2ImdFfqf41tFYeDCxfez8Jnw8eO5NWPFUHptlkpR8e
	 rONl8C/85wb1XhdwJgb79RpLjiEtBATI+bkB0huq0XAblAV+nwzJcbUWqs9AK1dQfS
	 R5Au5mO6J0JHlsC8pd0QCaLiJZ4FLRH55YZ01SOJuGeL2NlJAY4C/I50T0czGlZdmW
	 wT7NLeXQ8SIuyhH99uf94Oo68uGWx0+osQFwVWJL/Z34Gf+Vs97PQ1xI0XcCuZr3sg
	 ERlqXHjfB8cYrprHpeeRMLByc/kGHj/W1HfJ5A3chVzW2ZBHf3YrLrjJQzmVfkLScm
	 YkqgupEBHZSRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED188442B;
	Mon, 11 May 2026 10:02:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AC31272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C2E784416
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8L671_kHEwQ for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDF1684404
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDF1684404
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:02:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39FAB85A7A; Mon, 11 May 2026 10:02:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 11:59:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a96ad6205b968c0b691fe4c64560cf7dd46192b4
X-Git-Newrev: 4254d4fd82c1929f034150b280f92b3264bc5847
X-Patchwork-Hint: ignore
Message-Id: <20260511100218.39FAB85A7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropbear: bump version to 2026.91
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4254d4fd82c1929f034150b280f92b3264bc5847
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2026q2/002398.html

This bump includes
"- scp: Fix regression in 2026.90 building on older glibc or other libc.
  reallocarray() was required, it is no longer needed."

and fixes a build error introduced by buildroot commit
5b136c89ffed35c30dff1802924a4dcf9bdab798.

Fixes:
https://autobuild.buildroot.net/results/637/6372e58671d3719b127dcb69642420a07f441790/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 81296375a1..31ac153b89 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
+sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index beb635e15e..a7de8432af 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2026.90
+DROPBEAR_VERSION = 2026.91
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
