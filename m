Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22735606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DeZYqORf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=Zl/CJQ6E
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA8CF80DC9;
	Mon, 23 Nov 2026 09:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwabTvimyLB5; Mon, 23 Nov 2026 09:35:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 05D4380DC0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795426555;
	b=sJ3FlFRm2aUiBcFm10+NGNT6JEsQI20Mx/8Iui8QOCuAXLc065ZkjSZ7Aafcp0CDCae7
	 cYH/5pqYmPrtPl14ttrGq97azQXGDDb8mNBu2nWxIvgGTaGxfxlwwP2sfWNhtFA9vKxUX
	 knBkKKkfzPnmD16kGo93FWMZ5R/pQc+K6zXBj3YC59SJOy79ycmmtRPT4aPxZSNdxh9Q7
	 O51V963Enh4acFp6jnVJDvtJ4nVYLv3fyhex9pY420fLhj394aCjxqkd+qRsOi9wgufUV
	 IKgPSimssxH9GdfVg+H1MtIAUb9ZsHOXLFDO1We5dB+3PRHQxlMCFaYvYo+Rq1MXOCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795426555;
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
	bh=Evq6bjQD5XRhNq/8rWMLPHCLQaM8IOgfMowSQKsGGcM=;
	b=fox8wmYVdETHAyYGsUAusdV1NXdLSfdxHrw4JsbGZvpej5IFGlBwnKelBv7L/G3bk84q
	 rPWZ7ZvCzLPPRcJzE+b5sEsxxESD/Pi4ypUBlcaJXJGLaUtGGFb6MAOydIGpctgkn1yo2
	 X7c4PF8uIIrmFTmbjLPHMIqQwpF2eRgfkEKqE8agD05cJhy2ZaS7Vy0Bvp0E8OLBJB5QA
	 nFF5on8fmerAHNw+kWwyiS2hAKnIbGNqwvkYqtphHqCVpFFNnBTt+OnvK5HE+JTUgzMMa
	 DUZMQudIjskKGwnjDEEF9BIDCU7S1OLaMl9+fjCYr+pth3K3aClBV6Xo4VHTNO9ohBg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795426555;
	bh=Evq6bjQD5XRhNq/8rWMLPHCLQaM8IOgfMowSQKsGGcM=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DeZYqORfhx6Q/iTMs9h8QpJtJ1GeXqZRHkanmrgC1hsPPkf/ikRNigKVosy20n8eh
	 vQeA2XubjFU79ckJ9G7ncTY33K7tJPO6mli3oFbvWHAXUPEShdCkov/Lrq7TRhI2p9
	 eUpDGWZIY6eSQmRtsxNesDWnoVJPl3SVx+W3Jlf2mGnMXwO49FGeNzhLw75gSHLNOt
	 F7MLt/iIjxoN0d0JUDCr8ZkpNeFq8YDtt1eQdoGx0Ke9JEatMAxyK6kgXtiLdrQqdK
	 xiUGi8z0Esad3erL2YtiAHMbdHVd+eixmbeEAmd8QV63H/e7Ug78Yw4taHpNqQ6F6z
	 glQFiYDVrp+gQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D4380DC0;
	Mon, 23 Nov 2026 09:35:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD00B1AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E434606DB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tofyv65tJ1Xc for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:35:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6500A60651
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=80.12.126.238
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Zl/CJQ6E
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6500A60651
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1795426552; x=1826962552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hl+OzqBwvVplSB9fhGItUBofRkJH+HrU/1hDCYkuleA=;
 b=Zl/CJQ6EqFSLWX1/MnZI5N0ztKO2U/UA1LTKgcEq/X4DVk5ngSgMGQvt
 Z5robi3DpVtwaKyNWOPaWR5RQVURMnwqbhL22MY2Ibz/SUTs4Bpr2GEaw
 LAEmJSHh6lwgfKgk8GrNxur75wwWNeSIvFrsRTfp9b0PzPfaqol6Yv2pW
 j1N5hmlmkYveFTS/DL3v9TZ5PaA1JUEXh/igRAeIqpxGJg2A3LfFxIev1
 GNVBtVD/kKVrK9tCqHsZomphrIYqpnmL2OVEOm/6aGPF1S7v4fvRQ3p62
 qLid8T52gcbk46htH2fQ3Lys7FvkSWHPocDBhID5C5Xljx2ChnvU/8MHM w==;
X-CSE-ConnectionGUID: g7E8HiETSrOUH4OAeXYX1A==
X-CSE-MsgGUID: tdqR4dd+TsOBx1g9/0V2eA==
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Nov 2026 10:35:50 +0100
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:35:49 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56;
 Mon, 23 Nov 2026 10:35:48 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Nov 2026 10:35:47 +0100
X-CSE-ConnectionGUID: H6DVKW6AQCiZGAuKPwbDWA==
X-CSE-MsgGUID: L3aaiiw+SEixld7HpCNIyw==
X-IronPort-AV: E=Sophos;i="6.27,227,1787004000"; d="scan'208";a="497192436"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 23 Nov 2026 10:35:44 +0100
Message-ID: <b3246a3664bd584cb79929f6871af37caf657117.1795426541.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795426541.git.yann.morin@orange.com>
References: <cover.1795426541.git.yann.morin@orange.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 2/4] package/skopeo: security bump to version
 1.25.2
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin@orange.com>

Fixes CVE-2026-114236, CVE-2026-111361

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index e496eb4410..50f8f93407 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6a3f342a327ec7684198eb0e15114940b6101506db48d9a96590f5942cb3b335  skopeo-1.24.1-go2.tar.gz
+sha256  d2ebe154195934908e2dd8d992bfda5dc554e1f5d8586c49b6a931fd69563d24  skopeo-1.25.2-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 5d23cbf451..eacb24ec3a 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.24.1
+SKOPEO_VERSION = 1.25.2
 SKOPEO_SITE = $(call github,podman-container-tools,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
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
