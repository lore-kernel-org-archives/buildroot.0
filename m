Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15190CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1ADD6131D;
	Fri, 29 May 2026 08:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fG7jNoB7q93R; Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62BE961309
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043120;
	bh=qMkRoqoSyc3/tNSoC2IOfX/KRjiFHjwGZedOE26o/48=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D7nKfaVm7gfub8zn0ci2Eq/6fCX69uCh259q3VIxHrdbjH8qS21ufKQ18rSbUy64n
	 g+pdmCavmlu3/FA90I91M+4a43+r+09Yq3Td5mLzbk0+cV6+cJi8WOtwSrXCbVM98E
	 1c6I365cCZEKlnz5dP3uhA/t0E1J63NhUAAdukCjIWj246JX4b8wd8QT/4yB0X6pqt
	 m+BYuGXPttdFy5JRXvXMHduXpG03VWsvk2pffwL7y8dS9R/jiYiAplbiYNY1td9AAq
	 QfSSIM02+i7bSJIAtFxbqivgfhXVcO8R94X0wyH1aeeuk6mAusarJ23kREhodvQPTU
	 AVpA7x/djiIAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62BE961309;
	Fri, 29 May 2026 08:25:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C9928E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE88B83AAD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNE-cBhMuxFU for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C1683A9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83C1683A9D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23D74870C6; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 10:22:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a04a89d19129ea37647ab4139a603f9cd1f8421b
X-Git-Newrev: a497a51a0d26cc02f967b0eb7f7f2a10e4e52ef1
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.23D74870C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dnsmasq: bump
 version to 2.92
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a497a51a0d26cc02f967b0eb7f7f2a10e4e52ef1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG

Release notes:
https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2026q1/018380.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 04b64c8502cdb809b10ec6c01e4d408fcdca4a14)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 212774cd10..258f0b1e93 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.91.tar.xz.asc
-sha256  f622682848b33677adb2b6ad08264618a2ae0a01da486a93fd8cd91186b3d153  dnsmasq-2.91.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.92.tar.xz.asc
+sha256  4bf50c2c1018f9fbc26037df51b90ecea0cb73d46162846763b92df0d6c3a458  dnsmasq-2.92.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index dec7c9a86d..74fc053089 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.91
+DNSMASQ_VERSION = 2.92
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
