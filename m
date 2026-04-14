Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74889F9D0F7
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 20:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31F67422E7;
	Tue, 14 Apr 2026 20:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvgegGJGmss0; Tue, 14 Apr 2026 20:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C3D742228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776198642;
	bh=CJBRPHupChu2vhwoJIV0/01HCKhSLNHcQ7NoL4zLGlk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zt6vaPK02kc27V+v52WtMSZQEmERQVmV+PaXEqvHfFoiSvgMFfUN0qQzcvMqMoKl2
	 Dd1tMBdh+GwkUNO1dROsUjujXYfBGpWzs/WZ1pSD6xUoS269CU9Z5UhIY1NjXZdQRm
	 uFee/9vEONtC4bbYMG7tSNK8K9+IoOMIzp/9TR2TPSCeBJPjE0HNo2H9UoycivsYsL
	 xFym7bo5DSidS08ObYbbZSIVg0/rT2pxGrMSEaF6zNbL46oTWX9fkAzTMZ7gZUIWIW
	 XMz0pM1LB2uvgf9t5EzNcbxkT6wbdJp2MghoLKpHB0FulvZ8J+1Y0WKlGZBg3NsuDB
	 nJGsBboKjy05Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3D742228;
	Tue, 14 Apr 2026 20:30:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E33E394
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 102B561C0B
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jh2lkxTY6CgE for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 20:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48A4560690
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A4560690
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC57F81588; Tue, 14 Apr 2026 20:30:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 21:46:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc7c20d817c6cd949c0b48999092af161ca51e49
X-Git-Newrev: 482a8e61facd22de81cfb8faf59b66f4a15f4c85
X-Patchwork-Hint: ignore
Message-Id: <20260414203038.DC57F81588@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: security bump version to
 3.10.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/482a8e61facd22de81cfb8faf59b66f4a15f4c85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/wolfSSL/wolfTPM/blob/v3.10.0/ChangeLog.md

Version 3.9.2 fixes CVE-2025-7844:
https://github.com/wolfSSL/wolfTPM/pull/427

Upstream switched from GPL-2.0+ to GPL-3.0+ with version 3.9.2:
https://github.com/wolfSSL/wolfTPM/commit/1402d0d132aef7d52569ee17d19fb6b04b57074e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wolftpm/wolftpm.hash | 4 ++--
 package/wolftpm/wolftpm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index 33d0aa2414..1875a11666 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b4f6c090cad7fdbd4fd976f1bd8f271694669459b240fa14bec60a89b749dc1b  wolftpm-3.1.0.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  b77ebfdf66dfa5e8881056c9512a6ab7d4ff8d0a920c36fc1eb311bd7f1882df  wolftpm-3.10.0.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index 4d1d459801..f1b0891277 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-WOLFTPM_VERSION = 3.1.0
+WOLFTPM_VERSION = 3.10.0
 WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
-WOLFTPM_LICENSE = GPL-2.0+
+WOLFTPM_LICENSE = GPL-3.0+
 WOLFTPM_LICENSE_FILES = LICENSE
 WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
