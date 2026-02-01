Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D34EE7C6FC
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 09:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FD6284219;
	Sun,  1 Feb 2026 09:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjX27mZYPtU8; Sun,  1 Feb 2026 09:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DE0F8421A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769938049;
	bh=H88agwTySyVKZ1BOQvzUsZzcXVKPMJouGxas58m0Mhg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AXg9/iPqlTw7coXRd7J+54vDdM+spDrAHsMSU19ZGXG6nsEiG2EOBY/jMdKkMzsr4
	 KWv3L0shAhMH0V9EDIYYRCxo0t1sjy9G6F519TVORwsf2Xla+B//iQsJRU7KbL5RaB
	 E7fJ27GQSwanMado4MUgZwUtud02h9JokO30lVsg/z08VY1TXzKGp0N3ADuV+bDEUD
	 67fjkvr2gNmJE97Wp4FR9CRMXpxjD7MtCraZ7y65F4HSQjf83YIXU/NTanRXNwm+Z+
	 IZ27hbr6pFLYVKVdBrr4Z3vZVHvBh2S1/gVxcqdBY3GYjKaUUDYHMrlsvKanN3Z3Mw
	 xmfL05kLcCJEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DE0F8421A;
	Sun,  1 Feb 2026 09:27:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 560F234E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E49B8421A
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7_VGo1TaDWR for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 09:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6761484219
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6761484219
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:27:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F63386114; Sun,  1 Feb 2026 09:27:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 10:22:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b16009c06d9a62bd0ad036918f0cec94ba367f25
X-Git-Newrev: 5715e7da20b37cb3b704bb1a18dd8a09e1fcbc28
X-Patchwork-Hint: ignore
Message-Id: <20260201092725.4F63386114@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump version to
 2.7.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=5715e7da20b37cb3b704bb1a18dd8a09e1fcbc28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libexpat/libexpat/blob/R_2_7_4/expat/Changes

Fixes CVE-2026-24515 & CVE-2026-25210.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 3 ++-
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 9d99c38a45..7536e7cb1d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,4 @@
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_4
+sha256  9e9cabb457c1e09de91db2706d8365645792638eb3be1f94dbb2149301086ac0  expat-2.7.4.tar.xz
 # Locally calculated
-sha256  71df8f40706a7bb0a80a5367079ea75d91da4f8c65c58ec59bcdfbf7decdab9f  expat-2.7.3.tar.xz
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 07aba205cf..215c34e9cf 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.3
+EXPAT_VERSION = 2.7.4
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
