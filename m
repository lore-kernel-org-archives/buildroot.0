Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63BEC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 16:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EFC582CCA;
	Thu,  2 Nov 2023 16:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EFC582CCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSCmR08SKzMw; Thu,  2 Nov 2023 16:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B05283211;
	Thu,  2 Nov 2023 16:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B05283211
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A38CC1BF380
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C86340211
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C86340211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7OaRSApqO6y for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 16:09:49 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C887485C2
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 16:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C887485C2
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 17:09:45 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2023 17:09:46 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 17:09:44 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 02 Nov 2023 17:09:42 +0100
X-IronPort-AV: E=Sophos;i="6.03,271,1694728800"; d="scan'208";a="61773729"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 2 Nov 2023 17:09:26 +0100
Message-ID: <07e738074928626377bb888bbe53888e79fe070a.1698941362.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698941388; x=1730477388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NDNjvVe3F1xuGDxkLQQgwdjwSAi+uh5xtYbJx1dlv08=;
 b=eAWZVYh03h6/5mBRwsF5Ob3zGv5hyOdUZiArDkqI18yZEjYj+/frcm5a
 2xIavmZXyVgqMkGRPCUvBVx2LQRH2jU1cGE9hH64porWcXW/dwCVQBPj7
 Br2E7baXwd4aDQSUrFLRMQi9f7ahiZ3GVfFxDEEWiETRBwGgCGCGY8kiA
 sfByOizNXzzg40dAPrpd9yY7cq8GPowbNFb6XVj5rV/OsI44Ya3B43vzb
 XKnMeRWBUY4kEF6LBjHfXHDtj/mse7M2GBUhZV0L/EtFyzdWJ/JTqlp0q
 hOiGqunThSJTo3GXYhaf3emLjylXOR68InhYZV3NRV9rjwcMGDcLV0rKw
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=eAWZVYh0
Subject: [Buildroot] [PATCH 7/8] package/libgpgme: add host variant
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

libgpgme is needed by skopeo (to come in a followup patch).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/libgpgme/libgpgme.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 036103b7fc..55710430e7 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -47,4 +47,23 @@ ifeq ($(BR2_MIPS_NABI64)x$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10),yx)
 LIBGPGME_CONF_OPTS += --disable-linux-getdents
 endif
 
+HOST_LIBGPGME_DEPENDENCIES = host-libassuan host-libgpg-error
+HOST_LIBGPGME_CONFIG_SCRIPTS = gpgme-config
+
+# C++ bindings require a C++11 capable gcc, and -Wsuggest-override support
+# Let's assume the host toolchain always has C++
+HOST_LIBGPGME_LANGUAGE_BINDINGS = \
+	cl \
+	$(if $(BR2_HOST_GCC_AT_LEAST_5),cpp)
+
+HOST_LIBGPGME_CONF_OPTS = \
+	--with-gpg-error-prefix=$(HOST_DIR) \
+	--with-libassuan-prefix=$(HOST_DIR) \
+	--disable-gpgsm-test \
+	--disable-gpgconf-test \
+	--disable-g13-test \
+	--disable-gpg-test \
+	--enable-languages=$(subst $(space),$(comma),$(HOST_LIBGPGME_LANGUAGE_BINDINGS))
+
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
