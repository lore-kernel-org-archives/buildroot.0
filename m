Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525A9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 16:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07098851BB;
	Thu,  2 Nov 2023 16:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07098851BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OP-huRa69rL; Thu,  2 Nov 2023 16:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC57838E0;
	Thu,  2 Nov 2023 16:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC57838E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60F061BF380
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38E7F434E5
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38E7F434E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnQn7jjE_luS for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 16:09:43 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98A7040141
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 16:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98A7040141
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 17:09:41 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2023 17:09:40 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 17:09:39 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 02 Nov 2023 17:09:37 +0100
X-IronPort-AV: E=Sophos;i="6.03,271,1694728800"; d="scan'208";a="61920791"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 2 Nov 2023 17:09:24 +0100
Message-ID: <89fdb022da6dac26d2c05be4c56242747f59abfb.1698941362.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX102.corporate.adroot.infra.ftgroup (10.115.26.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698941383; x=1730477383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1SQzDCJRvI4zpiwNIe5fqM9OWwrKN6FOlXfwgoknLh0=;
 b=GBMahY+ikfmBREWMvHDaphFZY6MY9GWS/IiU9HwjL0FTJ1qz1zhwfm9O
 35A6Q32DGjKgPl4PRBJMeeG+vyMlNE0PtUWdWJvb5FKIhWKCOH5uCfwew
 rY/GU3rBF/eXjh09Qkht3st5ISaDA5NNBfxTcUWuUjcqsusByItg5Lrxr
 yIxxcQ8fE/CQncpzjtH8UFuWZxqSFpwyehGM8+DhbybG+Kd/vagi8NU7J
 g3R67H2maW+iJEX8CSHZRK+jiALCpx6Gk06jYTJlIXwcg4d3JowzoniNv
 FrZaJal+MuK0gEGiDADUjpVQTDIA4pLGJ/sMDwN2HE97r6k1QIHI28n0q
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=GBMahY+i
Subject: [Buildroot] [PATCH 5/8] package/libgpg-error: enable host-variant
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

libgpg-error is needed by libassuan and libgpgme, the latter
being needed for skopeo (to come in a followup patch).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/libgpg-error/libgpg-error.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 60e3da9de1..88dbdf2259 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -26,4 +26,10 @@ else
 LIBGPG_ERROR_CONF_OPTS += --disable-threads
 endif
 
+HOST_LIBGPG_ERROR_CONF_OPTS = \
+	--enable-threads \
+	--enable-install-gpg-error-config \
+	--disable-tests
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
