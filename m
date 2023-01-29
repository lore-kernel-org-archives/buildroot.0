Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D753C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 11:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7BDE41626;
	Sun, 29 Jan 2023 11:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7BDE41626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqEZIuQYCYUi; Sun, 29 Jan 2023 11:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D31DA41620;
	Sun, 29 Jan 2023 11:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D31DA41620
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE0461BF591
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 11:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7B4341620
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 11:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7B4341620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xt5BL5M2d3tc for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 11:42:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA4A4161F
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FA4A4161F
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 11:42:13 +0000 (UTC)
Received: from ubuntu-jammy.com (unknown [223.102.87.214])
 by zwqz-smtp-mta-g0-4 (Coremail) with SMTP id _____wDXbteKW9Zjx_JdCA--.49624S2;
 Sun, 29 Jan 2023 19:42:03 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 11:41:47 +0000
Message-Id: <20230129114147.2504-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDXbteKW9Zjx_JdCA--.49624S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4xXFWxuryxXry7ArWfuFg_yoWkWFX_KF
 1UJr1UXrs5WrW8ZFyxtF15GFy5Ww1rGr4ktF1kKFnYyr1DJwn3tr10kryUJF15JF47Kryj
 y3WDXr13ZFnF9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRSdy5UUUUU==
X-Originating-IP: [223.102.87.214]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBzhEGjWI0XLAkkgAAsY
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xHx4s
 REdKGoDYbN2FUQIIPl4WBzzXgqKBkY1rOgigxI=; b=Ecg7oFNZ4QpkwfWT6HZPD
 e/EDZxcwke23nmllDb8TPfKqeL2hN8xxu3HZiFkyEwilU5ilqpXZ3iRToV8+fW2P
 MvesxSCC1cz0hNjwCPEv4Z2ClkydgybF+Vuws/MvxI4kyXfwJIDj0mXwuUkd/2Va
 Z5em3btZMpDORv52lFQ7Uc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=Ecg7oFNZ
Subject: [Buildroot] [PATCH 1/1] package/ttyd: bump to version 1.7.3
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
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
index a2a933b63a..85bd71ba2d 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  edc44cd5319c0c9d0858081496cae36fc5c54ee7722e0a547dde39537dfb63de  ttyd-1.7.2.tar.gz
+sha256  c9cf5eece52d27c5d728000f11315d36cb400c6948d1964a34a7eae74b454099  ttyd-1.7.3.tar.gz
 sha256  8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index 085511b5fd..d17e21d60b 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.7.2
+TTYD_VERSION = 1.7.3
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
