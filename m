Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2FDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 13:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8CB4827A5;
	Wed, 20 Apr 2022 13:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCdAFAUZZQT0; Wed, 20 Apr 2022 13:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E201482628;
	Wed, 20 Apr 2022 13:56:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B31801BF2AA
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 13:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFFDD82628
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 13:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qn5QBrvST3Fu for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 13:56:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by smtp1.osuosl.org (Postfix) with ESMTP id 812DA80895
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3L1Iu
 qw+NVSDK+ecDtqDZizEVBoKxoRkAebwBQ6wKNQ=; b=npF4zG2LbdHv4o16sH49B
 jpRmb2lZU9OI8d3c1bu+TjaBt00VFbMEmALMMB87g5gM2cZrXJrhrkrPqOb7kUEC
 X8eustXuvXCaeXyMKvndYVhmnBYV3R72Q2t2MsrdKAtBu0k7ID9wO0AXYOmzvbAQ
 qv+nHc7m23MRQ5dUDQS69c=
Received: from localhost.localdomain (unknown [123.185.181.60])
 by smtp12 (Coremail) with SMTP id EMCowAB3p7f6EGBidnqnAg--.6015S2;
 Wed, 20 Apr 2022 21:56:12 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 06:55:49 -0700
Message-Id: <20220420135549.3536397-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: EMCowAB3p7f6EGBidnqnAg--.6015S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrXFyrKF1DGr18CrykKFyrCrg_yoWxXFb_AF
 y7JF1vqr4fJrW29r1vyFs8Jr15Ga9xtr1Sq3WakF1DCr18tw4kGa4DCr98WF1rWFWIgrya
 yw1Dtry5tryq9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKEfo7UUUUU==
X-Originating-IP: [123.185.181.60]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiQhzojVaEBxWfPgAAsa
Subject: [Buildroot] [PATCH] package/systemd: add the missing sgx group
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

systemd-udevd needs this group:
  /usr/lib/udev/rules.d/50-udev-default.rules:43 Unknown group 'sgx', ignoring

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b07fac27d4..44185a35a0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -603,6 +603,7 @@ endef
 
 define SYSTEMD_USERS
 	# udev user groups
+	- - sgx -1 * - - - SGX device nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
