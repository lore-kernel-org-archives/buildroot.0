Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52852CD8C83
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1403581FE2;
	Fri,  5 Jun 2026 12:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHEBDBMFO2Yy; Fri,  5 Jun 2026 12:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 275A782036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663163;
	bh=HO3uRWIJy5pF+xrf1HsTdsJdGkRcA6jQSUz6XcWPsZo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a11be2peWIGc+JfmScaAGRQXeR99DJar+NZXSdNE8wwksB2hZioRNw3PiMJ4eDTzm
	 u7eOZOLJdl3AGiqtKChhC0Tnb73511d+Ah4iDTTsK5V1LcMSAETH3rDqcSg8C0PlEg
	 3io9BpRFNa3YQk5kiwQTB8TcEpaKhgUEtTirOESk7BI985uee7CjkW0j1BQc82iTmn
	 mRzyE1UqfFnglWwoEdgtvavw2LOjN0zJPIyBfZ6/4KEdAcWs2YjGMAsNWCvBoCBwIY
	 Fczk6vKve/IJAi3LSccn4cWu3xCyR6kobIk41g3l9/pAySEmhGrqVIiloHiRfXLz7P
	 JkiZO4g8S/dkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 275A782036;
	Fri,  5 Jun 2026 12:39:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 140D949B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E06E60B98
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R13Mrsbg1s_q for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE29760B97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE29760B97
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEF9B87B3F; Fri,  5 Jun 2026 12:38:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 14:02:00 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6775bfd7494faefbe12266e2e5c35497649e49fb
X-Git-Newrev: 3e66f293f32d525febf370a32da08c7d05303f3e
X-Patchwork-Hint: ignore
Message-Id: <20260605123833.BEF9B87B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/samba4: security
 bump to v4.23.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e66f293f32d525febf370a32da08c7d05303f3e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

See the release notes:
- https://www.samba.org/samba/history/samba-4.23.7.html
- https://www.samba.org/samba/history/samba-4.23.8.html

This fixes the following vulnerabilities:
- CVE-2026-1933
- CVE-2026-2340
- CVE-2026-3012
- CVE-2026-3238
- CVE-2026-4408
- CVE-2026-4480

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 46a4dcd0e1bfcb1be3c8ee5580476c3aa5dbd2e6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 84ada82bfd..7d88dc129b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.6.tar.asc
-sha256  e3dabd8b5e42dc97669fa0faef032510a94e496b58f7067082e5036d88f0e702  samba-4.23.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.8.tar.asc
+sha256  976129847456dc5b78c00f8ffb79dc605c49d6aaca8b2aa772fd22dbb69fae01  samba-4.23.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2631f2dcad..0e58a80386 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.6
+SAMBA4_VERSION = 4.23.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
