Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72765FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 18:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45CCC6124C;
	Sun,  3 May 2026 18:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4z8eHHxPedTV; Sun,  3 May 2026 18:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D977608EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777831379;
	bh=4dqh7BYZmdDHgy5Gu8nRTVeVXomL5NTs4Ni5MdgigrI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lakdpNxDyRW/pwkKvIcoWXbEQaWu1riY9wJr3vTRmLGdC58qq+r2pAAduZvwZ/zKU
	 VshXdY0Q68C15ZVMowGpeoghz73vIrOR3CgZL1Mw6ReMP+E6aC02r7P425C28CoRp0
	 c6CImTyb8bDkJ8xPSpFLv8e5biD/i0oomxGn+grBojt6blRatQrgu+vWJAosTHedTn
	 h6lh/BhXwBdFl/n9KnqCQxgCZf6Uk7fGqRn2dASIL2IqPd1t9do08rYnpbFFuZm/Vu
	 TgdMv3UdJpsGN3RnFLQyBkpV+NO8sA+ba90wOHASVs35My5GGU3h3Ws25Pviur3XxW
	 HCC8cIknF1wkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D977608EE;
	Sun,  3 May 2026 18:02:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73877190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 18:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58A4C841D0
 for <buildroot@buildroot.org>; Sun,  3 May 2026 18:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGrjtwkgHDRo for <buildroot@buildroot.org>;
 Sun,  3 May 2026 18:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 766D38418A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 766D38418A
 for <buildroot@buildroot.org>; Sun,  3 May 2026 18:02:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 301A9840E6; Sun,  3 May 2026 18:02:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 19:59:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a14b18ee75ca5489c6ae18fe00ae604ee3ff846a
X-Git-Newrev: ca673af9efd9ff80106adbfedebbde079add9b3b
X-Patchwork-Hint: ignore
Message-Id: <20260503180257.301A9840E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: bump version to 2.4.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ca673af9efd9ff80106adbfedebbde079add9b3b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenPrinting/cups/blob/v2.4.19/CHANGES.md

Added sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cups/cups.hash | 3 ++-
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index e421c6457b..7cb25fc4dd 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,5 @@
+# From https://github.com/OpenPrinting/cups/releases/tag/v2.4.19
+sha256  820984b12a67f98705785aae2dd1347fe0ac097828001d4583ff64574aed6389  cups-2.4.19-source.tar.gz
 # Locally calculated:
-sha256  89c703238de210d4f4f4e5d4269e3d60c4b2f487aad75a8a1eaecd659e4d0b77  cups-2.4.17-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index f79e3846df..0df4f411bb 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.17
+CUPS_VERSION = 2.4.19
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
