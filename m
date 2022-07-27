Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFC8C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DBB981959;
	Wed, 27 Jul 2022 14:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DBB981959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNQGyEP-Hn0W; Wed, 27 Jul 2022 14:08:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFEF6812C0;
	Wed, 27 Jul 2022 14:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFEF6812C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4E01BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34EAF40A7A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34EAF40A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qI7J31lYijQw for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:08:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27E3A409D0
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E3A409D0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:08:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [123.185.16.214])
 by smtp9 (Coremail) with SMTP id DcCowADXAyHrRuFiBt7YSw--.22238S2;
 Wed, 27 Jul 2022 22:08:44 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 07:08:22 -0700
Message-Id: <20220727140822.355859-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: DcCowADXAyHrRuFiBt7YSw--.22238S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw17Ar1DGFy3Jr4rtr48Xrb_yoWkWrXEya
 18KFZ7ZrsrtrZYgw1fXa1vqr98Z34rXr1xJF1DtrZrXr12krsFgr1vg3ykJrnaq3Wj9r43
 Za1rJF9rWw12gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUU0tCUUUUUU==
X-Originating-IP: [123.185.16.214]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiGh5LjVaECogIsgAAso
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=asx5D
 kYaNRLV0pFZA6w81IAzNFGriUvKiGHXplGno64=; b=Y5l0bk0NJ4uNh8N+gM8Uo
 KfPJ6v+yGqj/gaw8PK/NR3jU2Zd/DxEQYbpTUKV93UCrYY8h2Ty2Tm28cZZ45RCi
 dqStkM76gKQPbK1wriPKA3iC+ZWD7bplO4RITw6tijZu52fbC/m31pygWctiwQ3q
 3X++cN0EaFjV5nPKnV70dk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=Y5l0bk0N
Subject: [Buildroot] [PATCH] package/pkg-utils: refine
 KCONFIG_MUNGE_DOT_CONFIG
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Given a .config with:

    FOO="1234"
    BAR="$(FOO)"

and then:

    $(call KCONFIG_SET_OPT,FOO,azerty)

would yield a .config with just:

    FOO="azerty"

because \<FOO\> would match the assignment to BAR.

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---

I found something similar in uClibc-ng:

    TARGET_ARCH="x86_64"
    RUNTIME_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/"
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e5dba2add0..6ece27baa2 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -22,7 +22,7 @@ KCONFIG_DOT_CONFIG = $(strip \
 
 # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
 define KCONFIG_MUNGE_DOT_CONFIG
-	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3)) && \
+	$(SED) '/^\(# \)\?$(strip $(1))\>/d' $(call KCONFIG_DOT_CONFIG,$(3)) && \
 	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
