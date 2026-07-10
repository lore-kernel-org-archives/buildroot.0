Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9276C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB77A40AA3;
	Fri, 10 Jul 2026 20:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GkaedlpLyrp; Fri, 10 Jul 2026 20:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4438040A7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783716529;
	bh=uloOtw0br6PyeUXpHF9/nqBGcu7Feu7Svjv9GfXAwec=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pHnefc9/qjiTe/ER1vZnbWFYPf2vzWjz6PSX0qrpc5MbE1US1VQBMGb315MQXbuFf
	 tdIK3mo2EL42ozpN/mtewQSnAM4V5Phkua1P36d7s9bpqKD7vVDImP+WCZ3L+Myr6d
	 10i9ENw/fSZYDSod92SZkOsPSIAt2rS43i3hJEoB+NNZH5QygNrF/Qj4MndS8t+HmF
	 kWnWxZrO6YGqYPpaZRQpxTZMpTfwiLylSfpbu8/YjX7itXRUrmDoAB2iurfgIin/Sa
	 XEOY8Dz9PdjD3piQSqIhxBzuXujpJFB9O5xol+P9sse1+5dbkXiEeWwJ8oTwp7S+5U
	 nWoqZXsQDGisQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4438040A7D;
	Fri, 10 Jul 2026 20:48:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FFEEA3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EA6C40A64
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8gnZ5Av3hZ2 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6265C40A61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6265C40A61
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:48:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 659C2886F3; Fri, 10 Jul 2026 20:48:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 22:44:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 053615b6a769826ff77dd0ccb1bef08a12943fdc
X-Git-Newrev: f42ee2bef29857aabb787761ac6ee10eb2175fcc
X-Patchwork-Hint: ignore
Message-Id: <20260710204813.659C2886F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.24.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f42ee2bef29857aabb787761ac6ee10eb2175fcc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.24.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 83e77f039b..7c44ed747a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.3.tar.asc
-sha256  4a5e0ed1ea192b798c873d9957c50a5767c10c2767cccb00d56ecc427e94f8e9  samba-4.24.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.4.tar.asc
+sha256  df2c51ab4361ec626ab9988e5946efcca8465bc7afae834291d5558468265ff8  samba-4.24.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 006fbff6c5..d481f9d417 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.3
+SAMBA4_VERSION = 4.24.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
