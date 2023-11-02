Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3264C4167B
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 16:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF37802B0;
	Thu,  2 Nov 2023 16:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAF37802B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQP7Vv1dmYvS; Thu,  2 Nov 2023 16:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E6A8290B;
	Thu,  2 Nov 2023 16:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E6A8290B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4251BF380
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2571540141
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2571540141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9eK_lcGF1oc for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 16:09:44 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFDF6434BA
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 16:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFDF6434BA
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 17:09:44 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2023 17:09:43 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 17:09:41 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 02 Nov 2023 17:09:40 +0100
X-IronPort-AV: E=Sophos;i="6.03,271,1694728800"; d="scan'208";a="61920812"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 2 Nov 2023 17:09:25 +0100
Message-ID: <4db136849481236cd6c1475f74e51822e0df640d.1698941362.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698941384; x=1730477384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ihFNoaZbop1LmOiaTS+NYHsfMtyHXWXdH80ZYRw2ns=;
 b=jA6oFstObAAlFIwUhb/g3hEEp2aCJ2xtpnJi7aBs5j23dBQvf/j7c6tr
 yFH19O4Il4StFzmKA8YcVrjAJM/hhXxZG6ZIEt0vpYNvLO68WpOZJ5pzz
 rRGUAcT6lwzsqzA0qUPvwfPGMEJjIyacnn+xqoyEW36FL+Ah1ITZIIKMW
 0gv6xqYq5AQixC1FIfdH8bKt4KWq8f/r7e3aOHNnsGuYIpVLej72aHSQD
 18e8WKJKamvPeMBstMoNSKLU8RwxGrmp9uE7Xr6pxSCZcnogp1mTHj5gQ
 dmGmnBPQ63bAAjJiXcRsVteyKwhwtdxm0U/fD/uWTXgfbbig161iV4T+c
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=jA6oFstO
Subject: [Buildroot] [PATCH 6/8] package/libassuan: add host variant
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

libassuan is needed by libgpgme, which is needed for skopeo
(to come in a followup patch);

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/libassuan/libassuan.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index fb95a6fd67..cec214f636 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -15,8 +15,14 @@ LIBASSUAN_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
 
+HOST_LIBASSUAN_DEPENDENCIES = host-libgpg-error
+HOST_LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
+HOST_LIBASSUAN_CONF_OPTS = --with-gpg-error-prefix=$(HOST_DIR)
+
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
 LIBASSUAN_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+HOST_LIBASSUAN_CONF_ENV += GPGRT_CONFIG=$(HOST_DIR)/bin/gpgrt-config
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.34.1

____________________________________________________________________________________________________________
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
