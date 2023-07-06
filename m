Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A586EB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 20:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F1E261151;
	Thu,  6 Jul 2023 20:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F1E261151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmJiUs253RmK; Thu,  6 Jul 2023 20:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60CC66114A;
	Thu,  6 Jul 2023 20:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60CC66114A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A79491BF4DB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CA7841908
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA7841908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UhiFMxwDGhSR for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 20:46:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 522B741900
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 522B741900
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 20:46:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E6A3A4C0EBF
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 22:46:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56256)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qHVrh-00052k-2Z
 for buildroot@buildroot.org; Thu, 06 Jul 2023 22:46:13 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 22:46:11 +0200
Message-Id: <20230706204611.3130492-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230706204611.3130492-1-bernd@kuhls.net>
References: <20230706204611.3130492-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688676374;
 bh=tY3QRNOUUOaL/q/hGZWMv69froVE3GQi7anstaAd7rI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JhmBx23PeA6NqJ/Rb5EOb4LNyBX0LLHpja6ns03/jbhRpGOCkkHk3gCeOOhWyh0ro
 H+F/VzDlvN36zAKBvVZFT1MCIHE1IJ6ZWxXN8rDFsKqe+d0uY+tgwVmxh4n7xiV/60
 Zbtc5Xf2uCSVgcw88wfiWfxTkYX4l9lj67QgYWbVYKemOGILLOONKx5KB1sA13Ofze
 6ds1f1U5yimxDdp1Xv8i0HogRUd1/0bKV/GfJrkh0ubGO9Tw4g2BD+WlQCbaKIv3Hn
 14jKMVx74SnYv3B6Ah1FKlqjtiIuDgFh5CKrcdo4+fEShH2Mqi13X+nyYM3Qn1HbGI
 Y0yu7IeIC4y8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=JhmBx23P
Subject: [Buildroot] [PATCH v2 2/2] package/cryptodev-linux: bump version to
 1.13
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

Changelog:
https://github.com/cryptodev-linux/cryptodev-linux/blob/master/NEWS
"* Fix compilation issues against Linux kernel 6.3"

Fixes:
http://autobuild.buildroot.net/results/9b9/9b9ad744d8a37fc46726461551a2dcb3c26a1341/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/cryptodev-linux/cryptodev-linux.hash | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index d649e8934a..300aa3bcd4 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f51c2254749233b1b1d7ec9445158bd709f124f88e1c650fe2faac83c3a81938  cryptodev-linux-1.12.tar.gz
+sha256  33b7915c46eb39a37110e88c681423c0dd0df25d784b6e1475ac3196367f0db5  cryptodev-linux-1.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 5a9e6ad233..580ea89520 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 1.12
+CRYPTODEV_LINUX_VERSION = 1.13
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,cryptodev-linux-$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
