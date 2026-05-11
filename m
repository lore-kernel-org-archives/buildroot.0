Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C10CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 19:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F17D360686;
	Mon, 11 May 2026 19:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7-gU6DBTRx2; Mon, 11 May 2026 19:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F06FB60675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778526721;
	bh=RWzvU0Ttw+pqQSWBV7ksg/SzsvstW5MPRKDP9o8CAcY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kXaw5kvxc9qwBdd6KvPGuGiGRNqxrjWRZwu6hP7sb+81P/2uLJRVpVquITmU2jRjG
	 oa8t254e9J7hV7Utm22ffvlT+MxzuO74tStcEDaVxQUb2t5fjQe5zeWrCKLjSnZrCj
	 o9S8hZKDuNBWwjGbgIUdHiZKDHIVQeJfVJSloWYNFCGTEkk7XsUis8Gtdf6wwYBAVZ
	 Sm4dDV3fYgN/kAKBqs2Mn/KVlmVja92fSZxzfpD1YIjNVjL2MKdcBO1pLk4139qkKM
	 oblMe/eTfviyHcMVxNWiqqpFzk/CBICt/1FRX1doNBqvWCLc6JwY0AqapXTUQHgspr
	 GbrrewtDtZ4Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F06FB60675;
	Mon, 11 May 2026 19:12:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7172272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B853F60669
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SA4bwqKy7QXH for <buildroot@buildroot.org>;
 Mon, 11 May 2026 19:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 114CF60675
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 114CF60675
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:11:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DCBE85E39; Mon, 11 May 2026 19:11:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 21:09:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78a93cfa9b56791484598aef6b4f1686ce8c1de2
X-Git-Newrev: 6be9c7e9cfa90ff465fca6de4c2802149dcf722d
X-Patchwork-Hint: ignore
Message-Id: <20260511191155.3DCBE85E39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: security bump version to
 2.92rel2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6be9c7e9cfa90ff465fca6de4c2802149dcf722d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2026q2/018471.html
https://thekelleys.org.uk/dnsmasq/CVE/

Fixes CVE-2026-2291, CVE-2026-4890, CVE-2026-4891, CVE-2026-4892,
CVE-2026-4893 & CVE-2026-5172.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 258f0b1e93..74ee5c415b 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.92.tar.xz.asc
-sha256  4bf50c2c1018f9fbc26037df51b90ecea0cb73d46162846763b92df0d6c3a458  dnsmasq-2.92.tar.xz
+# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.92rel2.tar.xz.asc
+sha256  43d72b8c129bdf33d17bafedc98823f63e46b5005128066bf0d2a472a32ce06a  dnsmasq-2.92rel2.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 74fc053089..d7ae8a3312 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.92
+DNSMASQ_VERSION = 2.92rel2
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
