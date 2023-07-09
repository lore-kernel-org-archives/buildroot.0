Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1ABEB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 08:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EDF660AEF;
	Sun,  9 Jul 2023 08:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EDF660AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-7gypXmBc89; Sun,  9 Jul 2023 08:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86AC060AA5;
	Sun,  9 Jul 2023 08:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86AC060AA5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57A781BF41F
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 08:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F299414C2
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 08:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F299414C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySzabcgZ8vSa for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 08:19:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D07414C0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8D07414C0
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 08:19:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 09252A4C07E7
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 10:19:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46974)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIPdc-0007kX-2V
 for buildroot@buildroot.org; Sun, 09 Jul 2023 10:19:24 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 10:19:24 +0200
Message-Id: <20230709081924.802356-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688890765;
 bh=XY94Uf5AcrJO4xYSpQE2meQRQkxUrIsFnB/2qjWOOGs=;
 h=From:To:Subject:Date:From;
 b=lT1e/KcUWZzyUPnEfpqvgtIqSCX59EyrnOZWnwLIj2edIM71prYt8YEdUo5E60/Qh
 D4P/vobYfJOwbZsBBfmGUHrrf3XqYEO5rXcTxPo3Iv6SsXJbVG92lu/k7b0huOaq5D
 GCjJXeJZ+koAev1Effe3MNBdeP21rTqmSKWoMjPcxNbM1n+NbVl2si3o6ZA2mi6Hzx
 2TaqR9MSlHotOxun8711S3yzA0V09w2jX/7g+nzTaDcC4rIxkde9dkYnmTPIdpAXAC
 ZDnsI2RqNGbE1TlKqYSiDA37H9PE/L+OjE+mJvkihcOCIku5uoeoi0tKV23X1fXrsn
 a/Yn7PwaqI05A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=lT1e/KcU
Subject: [Buildroot] [PATCH 1/1] package/valgrind: bump version to 3.21.0
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

Added sha1 hash provided by upstream, removed md5 hash.

Release notes: https://valgrind.org/docs/manual/dist.news.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 83717f26f3..d406babe35 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-md5  e3ca8e03c6c527e80e7da5135a1b6beb  valgrind-3.20.0.tar.bz2
+sha1  817d769743d278b5d07526e85115082054e9bf9c  valgrind-3.21.0.tar.bz2
 # locally computed
-sha256  8536c031dbe078d342f121fa881a9ecd205cb5a78e639005ad570011bdb9f3c6  valgrind-3.20.0.tar.bz2
+sha256  10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971  valgrind-3.21.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 98beb7ffef..4c4c3ce543 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.20.0
+VALGRIND_VERSION = 3.21.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
