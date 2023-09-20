Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FC5CE79D0
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 13:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93DFD4015F;
	Wed, 20 Sep 2023 13:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93DFD4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBzZJ6qmDTjX; Wed, 20 Sep 2023 13:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D30F140291;
	Wed, 20 Sep 2023 13:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D30F140291
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2E211BF400
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 13:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88114401C5
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 13:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88114401C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OcA8X_KTPMMa for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 13:08:12 +0000 (UTC)
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEE90400D3
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 13:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEE90400D3
Received: from ubuntu-jammy.. (unknown [223.102.85.15])
 by zwqz-smtp-mta-g4-1 (Coremail) with SMTP id _____wDH4Z2u7gplJyRnCg--.5579S2; 
 Wed, 20 Sep 2023 21:07:58 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 13:07:54 +0000
Message-Id: <20230920130754.2258-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDH4Z2u7gplJyRnCg--.5579S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWfJFWUtryrZw4xAr1rCrg_yoWfXFX_uF
 42qF4kWryFqrWDuFWv9Fn5J3s5K3s8WFnYv3Wxta98tryUtw1YkFyvgr1rZ3W5Jr4IgF1q
 9a9rWr93Kr43XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREoqc7UUUUU==
X-Originating-IP: [223.102.85.15]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBdhTwjWDkpN76XQAAsG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JS608
 nQ1TCsCrYEGV/HYezEwz0j6s2toRZmK5Ux8L3A=; b=IKTciSyIqYzRfejXvImjA
 hgtNGTfT+AaF3MquDES6n3Hv+k6y5GU8QS3lwVMtAQbTcAAvavc8G/kjpjblqhU1
 wc6McvTf2OgluFnC42vok+gfTdRUTELQ/1B0SMGeW00YPEYYSbP84OUSs1QBwFaj
 8JI1vFyw0/zFN3STtqJyXU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=IKTciSyI
Subject: [Buildroot] [PATCH 1/1] package/nftables: install libnftables to
 staging
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

Needed for network-config-manager:
https://github.com/vmware/network-config-manager/blob/v0.6.4/meson.build#L119

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/nftables/nftables.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index b0a14bd429..564c08c1b4 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -10,6 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
+NFTABLES_INSTALL_STAGING = YES
 NFTABLES_CONF_OPTS = --disable-debug --disable-man-doc --disable-pdf-doc
 NFTABLES_SELINUX_MODULES = iptables
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
