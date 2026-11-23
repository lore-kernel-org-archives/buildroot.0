Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9437C606A31F
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FKsnAU9j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=hQH5/+/u
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66FB640588;
	Mon, 23 Nov 2026 09:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JD8SXZvalOIo; Mon, 23 Nov 2026 09:35:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9104540567
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795426558;
	b=h2NRw3iqEgSGXlxVu/0rnFLaOTXphOd7A+punl2gAJWCE6VyNV38JY3J/zMggDEDzz6l
	 d22issFMMZ6wl7npTip5oLe2ZDiLi0vXYIJpQzTpslnOK4hN18wtIETD+IDyKv84T1EOY
	 hA0x3blLJ1CjPaZnOnSfiau9kNLlBeZcW3pU/sXBrBxMEWLpwPNkRLDS+VEdWqpd9wXjX
	 /aJGCVvmsvI3z8xuFg2LthcHXIU/SGnjWLiN5FwauY7lS758MlrTsSfnVlApsE47WeaCq
	 7vBP5l0zN5ytlTxyJD+Xh44y/ij6rBy3XoTbrJfWCEPd5OCwCpIf3kL1qaZ6PxjFKRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795426558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ExShO+JDkubkn6FFoLHfw4EqQs3jMRUS12Jn0LYfIKA=;
	b=o7rwh4X9dqM9lNSsodGA6rJKd5viYLTzYTW744gJDR8qNaMD2ijCxRCGxjvVL6E7zu8n
	 ayAiAs1rPmLvsajrd3Aec4XUI6H0ejcGaifDwal8Hk+X2fZptVLsoXs/356R8bWcTSTla
	 r701S/RszfHRfAjvDNOOMF1OJQ+mNppb2B5Gr0rPiKpPPmg29bD5AcvXcgFYG6+WRyGw4
	 ax1SkzZC8uqw7pdKlKUWJy1IMgb3yc7ij/AI8pjgZSCS1jOsVTFbVrQqzBhhzt4/0zk95
	 1A8fHjsFReeAruiq7MRVOg2gC4rtqV3JbQusamNXfx9PU7U3scxXOnHLxdHIgmn2MFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=orange.com;
	dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b="hQH5/+/u";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795426558;
	bh=ExShO+JDkubkn6FFoLHfw4EqQs3jMRUS12Jn0LYfIKA=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FKsnAU9jkg/vF6aN9LEe4Jurn7K+2bgLmvy+hdeix+PaCtbpVAbiCaYqnJUHezYz2
	 eelPaqUCzlKoIBuCI4N2e5SXsEYym1KJ72kqibHyRZnRPOw1y7+8k6jhs7wtmMbTxt
	 Xzkfr2sQXYgiY+sUElPJYhN9zoS6nTeahTydY0hhHo+ZsEcCeMvEDWiKhPMhRA3kBw
	 ubKLeura/LQAVvfmSvCQUOyClsgus/RVuZGU44stlCdUkF2ir4DZdd40Pd0aNAEfmx
	 eZQFI95g8oVGAzvzSjkAnoSSfYUbQuzeJeoWcmtCoOcyOIndiItujizvnFc3NodKEY
	 M6OVTEr8sEvwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9104540567;
	Mon, 23 Nov 2026 09:35:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BDC9260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1176C40567
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dWZ3k7eQEOI for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:35:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B660B40556
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=80.12.126.239
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=hQH5/+/u
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B660B40556
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1795426556; x=1826962556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MG0Czn9a4VDPBe3P5032IzsaEGIHUvILe+2w/e3b/Lc=;
 b=hQH5/+/uydPdffdZZhBHxJjGQpQvi1oReUMI7BwOQJLhyo6vZ1y3vKJy
 0H4OnCbGtNGXsO3MIM8bL9q1L6sLl/FaEtXaBTnsHlxGK0WLsFw35wlEy
 WYXeAOLR5v7mNxOs5okJG7GiwQWX+E/uidsYJwJEITZHPBZ89ejR/9l3F
 0A82D8i6z0SIQosHquiFsDobanYY1g6IiJYjSvymvgiT9dDqqF7S5sDLQ
 vJZzOJa4ip5QLRNl6qJkdYGAQ69G/5sPWDv8U5Sz7jwQcgJnNKHxM+m3/
 FuCiZxC0Je2TMXhXkK72CGbGfK5hCFTFX6Kd+HUlfs6pr5XThRdNcjpeu A==;
X-CSE-ConnectionGUID: Xqne+9UITNaH/osTuZkl7A==
X-CSE-MsgGUID: D+w94YbkQSSS22Bjuwu8PA==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Nov 2026 10:35:51 +0100
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:35:51 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56;
 Mon, 23 Nov 2026 10:35:50 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Nov 2026 10:35:49 +0100
X-CSE-ConnectionGUID: DJH5CY8KTFG2lLd8AaZdNA==
X-CSE-MsgGUID: IaurYs1ZTzawwVb1RMxFZw==
X-IronPort-AV: E=Sophos;i="6.27,227,1787004000"; d="scan'208";a="496970453"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 23 Nov 2026 10:35:45 +0100
Message-ID: <ab11737894018cba091fee7eb1cd1b627925c8e6.1795426541.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795426541.git.yann.morin@orange.com>
References: <cover.1795426541.git.yann.morin@orange.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: OPE16NORMBX507.corporate.adroot.infra.ftgroup
 (10.115.27.27) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 3/4] package/amazon-ecr-credential-helper: bump
 to version 0.13.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 .../amazon-ecr-credential-helper.hash                           | 2 +-
 .../amazon-ecr-credential-helper.mk                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
index 04668d6478..839fa088d5 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
@@ -1,3 +1,3 @@
 # Localy computed
-sha256  dbb977df026de70fbe3389d9fc6756286859ca4a76a76ebb8c17108b0cec6752  amazon-ecr-credential-helper-v0.12.0-git4-go2.tar.gz
+sha256  f7a6cd9f0cd909271f804fbd0a1caba978137b0de22200dfe9206d0cdc8f3154  amazon-ecr-credential-helper-v0.13.0-git4-go2.tar.gz
 sha256  ce65129252f145d6dd627bc354ccc28ba07c6cd27a8d278b7dcfde3ed6976a5a  LICENSE
diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
index 570cc16b0c..1a43513a7b 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.12.0
+AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.13.0
 AMAZON_ECR_CREDENTIAL_HELPER_SITE = https://github.com/awslabs/amazon-ecr-credential-helper
 AMAZON_ECR_CREDENTIAL_HELPER_SITE_METHOD = git
 
-- 
2.43.0

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
