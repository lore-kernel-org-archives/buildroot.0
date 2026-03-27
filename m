Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3AF10F2874
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C1C241244;
	Fri, 27 Mar 2026 20:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iG-tQs3P9g-G; Fri, 27 Mar 2026 20:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE3E4123B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774645114;
	bh=pzkGMS98d0ffdXrNwxCjwY38cVe6ryvFGyD8m2Gn9mA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LExYyw9WJ5WRMFAbQUdhsgg7LIhOG3hx7JAjx0y2+VrEGgsPxRBOep63byrdP9u9U
	 1RwHKGiUBerOx3HM7rf+fj/cKtaAcHYhooQQJNbrTdbUFDIresmPitmw1RH1Enjm9x
	 NiJaVl4YxmQ5cijLdDiepaVoo5Q15IGAsi0pvTI8dJvAbN/glYz3h2GcnHoTKfq9dV
	 HcenlbSLB/gNczGxmknQpq7PDnLGD8dVAu6uFugOV5v84xbSF15ABzU5qnKAMtvRx0
	 8q1otbsM2szWfClkQqzhPTpSm/zQQKLNLvF5RCXWN032xJa1LSfyxIXo5aLM1YO+Tp
	 TFv5U+Sq2eoJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE3E4123B;
	Fri, 27 Mar 2026 20:58:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 025161D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E80DE61026
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9TEKbrMtuik for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EBCA61024
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EBCA61024
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:58:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 623DD7FC0E; Fri, 27 Mar 2026 20:58:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 21:57:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee1e0573435b4165f5ace58fa417d4a1a0ff5a12
X-Git-Newrev: 394753456628a7121218946d41d8593959c25d6b
X-Patchwork-Hint: ignore
Message-Id: <20260327205831.623DD7FC0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: bump to version 1.56.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/394753456628a7121218946d41d8593959c25d6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/Canop/broot/blob/v1.56.2/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index a86498a169..ec72063928 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  bd6e52151e28b4f76248156dcef5c0c56260caaffe39599c798792a528786fac  broot-1.56.1-cargo4.tar.gz
+sha256  46fc9c18ac0bb7a23eb752aab853b2484dba5b168052d380b1d8b902bf4a6fbf  broot-1.56.2-cargo4.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index f1174358ec..dfd9629d12 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.56.1
+BROOT_VERSION = 1.56.2
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
