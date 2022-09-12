Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9EFECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 09:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D88418EA;
	Mon, 12 Sep 2022 09:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D88418EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqHMMGm5HLL5; Mon, 12 Sep 2022 09:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E55AB418E6;
	Mon, 12 Sep 2022 09:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E55AB418E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3E551BF476
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 09:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B04F42526
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 09:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B04F42526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIyBsDaMYMux for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 09:58:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86ADA42506
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86ADA42506
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 09:58:05 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar20.francetelecom.fr (ESMTP service) with ESMTPS id 4MR28p5nfLz8t8B; 
 Mon, 12 Sep 2022 11:58:02 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 12 Sep 2022 11:58:00 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 12 Sep 2022 11:58:00 +0200
Message-ID: <6943_1662976682_631F02AA_6943_135_1_2f295d12a5e78ee24dacc276fbe353e996d33def.1662976680.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1662976682;
 bh=ddnERPFWyRsTb4Aw/CTcdjHyAyWJ8qgitYh0O/BOxtI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=Iz0OSlnpH5uxnLbkXhpTV7jiyV5f+qENASRMGP6Hm/GZL0WHId0ZZIMN4025VUpoC
 RYzvi1k1mC+VJVgEgil9osk656Ltu0Sc+BGbFf08AdxDPGwKHVO0AW7xAR947fb/jU
 eyEVsQPQ6wdlCn0PSL44dqNBarw4Gs7E3FtryrFzzEsLemOXtCx89rqOj4UzDh2rDu
 tnj4ndls0qtGu78higoMH+iingWyhPmdHGOU1M8SxO3jYdhE6YMBhYuJxrNXEGn+wI
 nW7smZTbtjOJsyggEZQ+BGFGVk3GDTs7JS8oFwNCjfKCakMlxYZNN8WxnwynpTxnjF
 OC6L1phaX+vyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=Iz0OSlnp
Subject: [Buildroot] [PATCH] package/network-manager: fix detection of pppd
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

With the switch to meson in 58c58466319a (package/network-manager:
migrate autotools build system to meson), the detection of pppd is
broken for cross-compilation:

    Has header "pppd/pppd.h" : YES
    Program pppd /sbin/pppd /usr/sbin/pppd found: NO

    ../../../O/br-2022.08/vtc/build/network-manager-1.36.4/meson.build:570:4: ERROR: Assert failed: pppd required but not found, please provide a valid pppd path or use -Dppp=false to disable it

Indeed, meson will simply look for existing files on the host, and that
can't work in cross-compilation.

Fix that by telling meson the results it can't find by itself.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a3bcd4dab8..105273a74c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -103,7 +103,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
 NETWORK_MANAGER_DEPENDENCIES += pppd
-NETWORK_MANAGER_CONF_OPTS += -Dppp=true
+NETWORK_MANAGER_CONF_OPTS += \
+	-Dppp=true \
+	-Dpppd=/usr/sbin/pppd \
+	-Dpppd_plugin_dir=/usr/lib/pppd/$(PPPD_VERSION)
 else
 NETWORK_MANAGER_CONF_OPTS += -Dppp=false
 endif
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
