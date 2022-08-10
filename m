Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4A1C25B08
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 11:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C31E861055;
	Wed, 10 Aug 2022 11:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C31E861055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5wHFbMgMSsR; Wed, 10 Aug 2022 11:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0094D61040;
	Wed, 10 Aug 2022 11:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0094D61040
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6DA61BF314
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 11:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FCC94086E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 11:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FCC94086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFdUCoCmlITU for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 11:22:19 +0000 (UTC)
X-Greylist: delayed 00:15:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3952A40863
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3952A40863
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 11:22:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [123.185.17.158])
 by smtp8 (Coremail) with SMTP id DMCowAA3ZS5WkfNiCyeyTA--.27694S2;
 Wed, 10 Aug 2022 19:07:04 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 04:06:51 -0700
Message-Id: <20220810110651.15132-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: DMCowAA3ZS5WkfNiCyeyTA--.27694S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4xXFWxurW3JFW7CrW3KFg_yoWkWFX_GF
 17Jr1UJrs5WrWUZryxtF13GFW5Ww1rGr4ktF1DKFn0yr1DJwn3tryvkryUGFy5GF47Kryj
 yF1kXr13ZFnFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUb1rWUUUUUU==
X-Originating-IP: [123.185.17.158]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXRhZjVWBor7b0wAAsR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=aNSma
 wGlfaaWy7EZTdmwR7mPT8aRb7smLTy6CItpAfU=; b=QuPAJbN/PtS2BOB6SlIFl
 L+a1jQySGofA2fOe9s5Yxn0r9OiTSy3RrWrRgCqkRaFw8r1dDwln/Cbxv5OpwYbO
 XLIp+bFxldxG/P972KDlIZ0yUtmD0J8KrFZuj3RNqTnlj8ObGZjwRxTmPCjtuOHw
 CN1bOpgvnd6s47bT+Hi2Tc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=QuPAJbN/
Subject: [Buildroot] [PATCH 1/1] package/ttyd: bump to version 1.7.0
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/ttyd/ttyd.hash | 2 +-
 package/ttyd/ttyd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index c4263d6e94..140580eee7 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1116419527edfe73717b71407fb6e06f46098fc8a8e6b0bb778c4c75dc9f64b9  ttyd-1.6.3.tar.gz
+sha256  47bc98d43cf2060af06378a2113605b229c46895a391613bdaa5a1197bfe5d47  ttyd-1.7.0.tar.gz
 sha256  711762f081c180ade3d09d7b0b7537eaf35eca8d1671e47bc66eaa39376edb12  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index 856270a88d..7b582a696c 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.6.3
+TTYD_VERSION = 1.7.0
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
