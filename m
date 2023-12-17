Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6F7C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 17:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23654408E1;
	Sun, 17 Dec 2023 17:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23654408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8T2c1TRBjUU; Sun, 17 Dec 2023 17:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD84408EB;
	Sun, 17 Dec 2023 17:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD84408EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A8AC1BF422
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 17:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B46B96001B
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 17:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B46B96001B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Osr_pF19a5PO for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 17:18:25 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EF5560A98
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 17:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF5560A98
Received: from fli4l.lan.fli4l (p5b3a0598.dip0.t-ipconnect.de [91.58.5.152])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C659A4C09B7
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 18:18:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46646)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rEumT-0005Df-09
 for buildroot@buildroot.org; Sun, 17 Dec 2023 18:18:21 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 18:18:20 +0100
Message-Id: <20231217171821.1893522-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1702833501;
 bh=fUknBDYMQU/+dIBDaii9ODrHiFqPxC1J8ztA7eVuQkU=;
 h=From:To:Subject:Date:From;
 b=yUsTXhPLJKu27rg3Bbtu+n01zufYKZZ6Cw7pDQMUElDBV5aVdQAIcTnLYH2DiA61A
 QlUTnipPKjqhMEVD2GmmWd4LeNsWUQIG8fOQJ+QjnCh+uH7zXO26ZD2m4kb/0M+FGD
 RLBRRC8kQgYEOMrGjf6GV3mLDoxtaC5D/xJhtwH01rAd4T8AXj2/h5x9OED0O+pmYQ
 UEVV4n0GKcG0KZvhW26gXRSiH0YKKg6uIwRMb2fhTjdyzsuq/eqxStfXadNf+n/On3
 M0/fAqVJ3D9WyBYWcAiFrv3wOY7f6EccMebYkC/eNDf2QN4Wuv4TT6zcRfjvI291qu
 91k85s1goFa7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=yUsTXhPL
Subject: [Buildroot] [PATCH 1/2] package/linux-headers: drop 6.5.x option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 6.5.x series is now EOL upstream, so drop the linux-headers option
and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 1 -
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 312d53943c..4689226290 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_KERNEL_HEADERS_6_5
+	bool "kernel headers version 6.5.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.5.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_PYTHON_PYXB
 	bool "python-pyxb removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index ed9c6143db..9572acda2d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  28edfc3d4f90cd738f2a20f5a2d68510268176d6111f6278d8f495edfd9495a7  linux-6.6.3.tar.xz
-sha256  78fbd43822f4c56bc16e89e8874767f592532e1a0ffcd1af4dd279559b5fcbb5  linux-6.5.13.tar.xz
 sha256  629daa38f3ea67f29610bfbd53f9f38f46834d3654451e9474100490c66dc7e7  linux-6.1.64.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  be2bee8b346f3ccb35879f16c80a323edda571e36190403805c14a9ea24e4a47  linux-5.15.140.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 344acc9cde..ab923cbb95 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -418,7 +418,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.202"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.140"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.64"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.13"	if BR2_KERNEL_HEADERS_6_5
 	default "6.6.3"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
