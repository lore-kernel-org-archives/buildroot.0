Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939A9C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 13:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D3AB402E7;
	Wed, 17 Jul 2024 13:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLfNfauClZRf; Wed, 17 Jul 2024 13:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 065BD40438
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 065BD40438;
	Wed, 17 Jul 2024 13:37:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 155B61BF3B5
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 13:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0107460AAC
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 13:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvHORRRBi1hQ for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 13:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C2426090A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C2426090A
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C2426090A
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 13:37:34 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.84.100])
 by gzga-smtp-mta-g3-2 (Coremail) with SMTP id _____wD3HwwWyZdmdwHQCA--.20571S2;
 Wed, 17 Jul 2024 21:37:27 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 06:37:02 -0700
Message-ID: <20240717133702.4377-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3HwwWyZdmdwHQCA--.20571S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF45Cw1ftrW5tw1kZryxZrb_yoWfGrX_Ga
 s7Kr9rJFZ3t3yjgr1xAF47Ar90939xGryFy3W5trs0y3Wkua1UZrZ7CF4jyF1fuF47Kr1Y
 q3yfJF1UKF12qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbOzsJUUUUU==
X-Originating-IP: [223.102.84.100]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXBkfjWXAmyL7pgAAsW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=pjhO3
 cqbQEjS8feDPaPzVPuuUU2tXiYahk5nQIgqYv0=; b=dJ9u8ZuTIvjrFV/I1bibj
 GOXVHeyYFczMEiN1vKr95ik9+BWz5o3dbvWpPeVt5gGOuSdEDkufTFBjtJ8wUr/M
 uC90Rm/WWxZ1mqfVRGNKOmAo5csz94/PpKbAfSmBPLjtU/JbEjP9FPFOxsMe2RLm
 MK4FFRowpBmsnYqZtaOQb4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=dJ9u8ZuT
Subject: [Buildroot] [PATCH 1/1] package/crun: drop libgcrypt dependency
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

This reverts commit 4d5fd84496 (package/crun: add libgcrypt optional
dependency, 2022-12-30).

Since bump to 1.15, libgcrypt is not an optional dependency anymore as
it has been droped in 1.14 with
https://github.com/containers/crun/commit/8d96f0884b46765693b6d86125216c895e095ed6

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/crun/crun.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index b48f15304b..be5897dbc2 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -26,10 +26,6 @@ else
 CRUN_CONF_OPTS += --disable-caps
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-CRUN_DEPENDENCIES += libgcrypt
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 CRUN_DEPENDENCIES += libseccomp
 CRUN_CONF_OPTS += --enable-seccomp
-- 
2.44.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
