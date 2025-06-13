Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B3AC61DB2
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 05:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE9D440016;
	Fri, 13 Jun 2025 05:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcK6kKoAqF96; Fri, 13 Jun 2025 05:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 265A4400D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 265A4400D8;
	Fri, 13 Jun 2025 05:44:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B29EA1BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9941840141
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BXBULWbz87T for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 05:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1FD1400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1FD1400BB
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1FD1400BB
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:51 +0000 (UTC)
X-CSE-ConnectionGUID: Tw5B3CCBSgGCT9xh4U/C3g==
X-CSE-MsgGUID: j/E8mW6IQrKIC/dnQHEIRg==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:44:50 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jun 2025 07:44:49 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 13 Jun 2025 07:44:47 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 13 Jun 2025 07:44:47 +0200
X-CSE-ConnectionGUID: bGxMD0VTTtiRBDINgs68Sw==
X-CSE-MsgGUID: sUI2/MgQTyO0rcYFIuSCig==
X-IronPort-AV: E=Sophos;i="6.16,232,1744063200"; d="scan'208";a="301527491"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Fri, 13 Jun 2025 07:44:44 +0200
Message-ID: <d2a08a5ea591122a0a08567e98a89ef0a26cc21a.1749793479.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749793479.git.yann.morin@orange.com>
References: <cover.1749793479.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX304.corporate.adroot.infra.ftgroup
 (10.115.26.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1749793492; x=1781329492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8noXTY/CgKVUasLlAk5otDDSnU4/78BQIdbXTl/gxsI=;
 b=XoJrGaUEqHs+tuTJRF0liLnt3UyBg75vkK6Tydo+XYw5uQGgeSudQslq
 wvibLrzxz549KQW40Z1IRO72bkJo3ziiUO2ohVYd/59jtfTeI4PitEGdl
 2AWWC6LUYPbTI9Lud2J97j6Cn04253wpGTBC3Y9URIaLrt5VRq7+P2ieF
 606sXojcWBJ5oX+uQrknRTUVd+42pcCiw4GzJqSC0tVnmI5U6Omj6V16d
 cCzEOsoH4Ox099MA8h15bh2mdIKEH3j940WZFQJnX0VygQL4uuhrmRWp3
 v0EfalYmQRKsx3FcJmPLDVdS6Mf01AdZWQbW+H1a+pRuCAKzQwZSU8Vlx
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=XoJrGaUE
Subject: [Buildroot] [PATCH 3/3] package/docker-credential-gcr: add LICENSE
 hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: "Yann E. MORIN" <yann.morin@orange.com>

The hash has for the license file been missing since the package was
introduced in commit 992d43b37356 (package/docker-credential-gcr: new
package).

Add it now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index 2796b5746c..b2ad975851 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  126fdbf7351d2c7aaee6c525d9660738519eae53eeef77920b105fd4d1bc5dbd  docker-credential-gcr-v2.1.26-git4-go2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
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
