Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E9606A88D
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 19:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WnNl6anJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A35AA8165A;
	Thu, 12 Nov 2026 19:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFvsodAqJNM3; Thu, 12 Nov 2026 19:20:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CBC1481624
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794511214;
	b=eAcxOCxMyEgwFYhbZaJaKIT1sk4Bmzy3v+PbZlbQ8eoRmoPKdtqYYGiPK1+aH3dUUZhX
	 4iJXgKCg9Rz2znxK4RVVc3b6WAVx2dRDqcdbwbeXLxpX/aGha+w7i32Bbx0gl4gjmTSXq
	 7I4SUDh8434CpG2aT4MnD1K2A/f2Sk/MOoOEE/tZ2hY0B8kYCxGZx1s3q3baTIsO2pkZH
	 pmk3UvdyOLCehf3r28ReXWz8LUB4iunO9FKP0RhXeXOWh388TnLWapwVgAFnz/glm+4ZD
	 jGU0thrzOb0fWwLXiF8KwVICpyiIdme2n6ccQLcHvf7B1BxuTokFCllJRpXQKsX6juw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794511214;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5AuLLN/BD09ETVQP8sUJitANFSwED9KQHARuVB9Boa8=;
	b=I+TMI3IFKDBAT5iwqzl6LJjxQKR2lHFnBlC8z5/V6BhIORZc4Yoq84e+zyxWY6X8gF50
	 L9vs72sowZngbvhg1cz/nB8sWhxBhIp/mk7mnn2TjyxHagp4aTWz+7D79RnDus7pNMi7x
	 TXm6jyKyAtejy7vLCX/areJkHCief6yG4LXd3WYy3XZpSDjNtxFZmOcwttpd8tPLjpRVd
	 e/Rh3upVnV5aDAXCgCR8GKHnKJf7d/ZW1YunShM6HegDh0OYf0SwRSlHHNGYOlaV3uEyn
	 p7H/I9RVFhaqnEuV2xx068DJUI8ZDBbi8VqTRthhKrlsCsi/lFV9GKvdIbt6Wto10mw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794511214;
	bh=5AuLLN/BD09ETVQP8sUJitANFSwED9KQHARuVB9Boa8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WnNl6anJxPKLWcn/PV/MH9x6k3IMzP2CD3dYDKdPM3VL356clWfTVH4genAgZRZXd
	 1QAUJO131zZzYqGtVnj10xB+GiIGKac1Aca4H73CAEh7GqTXj+Z9wAS3XmKxLfYEJT
	 Go+bdmgkVGqq56J+4BsfRyldkFOTxoIACZslTGFD23jvcvLrazF9F8c5PHtan+eEIn
	 9gUK/D37tcNgJ9Z8Nk5mrrROZxNHYgCJUqw6pXJCs7zm/NehUYkm2DXGl4C3TmhYgK
	 hpJievCRwxOXsIjSPGNtjr68m9v16/PlczF1+wgACgpfgw2mjDkOSIUoMoBi4FX/iS
	 AEoyX9ci8H4mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC1481624;
	Thu, 12 Nov 2026 19:20:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A57E62FE
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A67E81624
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oU8kcx8WGUS6 for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 19:20:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 28A1A8161D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28A1A8161D
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:20:11 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794511210; mf=PHBzLnJlcG9ydEBnbXgubmV0Pg==;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.net;
 s=s31663417:rsa-sha256:jiCdbCRJarncR4F7buYnCfodoMA3
 k74wMGCDtrV3fcMvISGyfWYLedhZFmf1ZM6r7N7Z2vg5DczLEvr6EyPNduhtDjEVxuTgbUCvyd2
 r0Cdh3b5EGXU+1RoYYjdPX/gyT0zgXLXo89b0CqYKRcNTPMzMGbmPsN1VbUDb5GP/nF9N5RTC6C
 qxJaGX2XrceLXi0uB7qyHxYdOC7Q94tD4Urk01RSPv5edyVkk9yZKw0jDzA6s1wqq0qMOILRMKk
 m1c9B8clEcO8sOMQEPnyhXMx3f86Yet7HkmMGzFr6n+NVahorw/QDlVCwXQPepScvMSbgB4Xtg7
 JOCaCXCVekWsFw==;
Message-Instance: m=1; h=sha256: YE755QJLvCIegB7vPK/b5rrHvxST0tRCwGKne4Ki/S8=:
 xwPVTNJXu2TZYq73BKMs/o6lQlqJJcKyOphvOhX2UNQ=, sha512:
 mZNKEmuO+468mqmM/3TxMGqqBiY8hv+8kC4DiU/w9wH1TnhYpQFkcL4LZHLCVISv7KwGj1Y4s5IRLWKadJwK+Q==:
 Y8TD+X99gbn+3bWbrRGkKSssC7aYbRY3ikCN43p2gNCgoReYhKEHh1o2vGmna8vOMM7yMATovb5sQ84iOhilVA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mGB-1wPkPK0jsp-017wxw; Thu, 12
 Nov 2026 20:20:09 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Nov 2026 20:20:07 +0100
Message-ID: <20261112192007.1759828-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qIxr/1ftHh2tmb6BqKmJHM/GyN5oyRlyqpHF0QXdIpA5Kk82sfr
 vGssPyKZPuCTckAGMZ62lt0gnad+/RkVl82vPw218H4gbH6noMn6FWGi6n3DR8Rmlg9TL3D
 EGxF76b2g3BNABZjqjdcAP4aN/ilgGDCEO1RQ8Kd/7iHNKhcLfGvhav1FnF6xIzGqYWUwLo
 61vDDXhtz2GAmlZUOgQ3g==
UI-OutboundReport: notjunk:1;M01:P0:RmJNUrZr5tA=;pabIZYihFpC/MK1q/qjNgjX/Fkw
 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
Subject: [Buildroot] [PATCH v1] package/apr-util: bump version to 1.6.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 1.6.6 (for details see [1])

[1] https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apr-util/apr-util.hash | 4 ++--
 package/apr-util/apr-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 02a425651f..31dcdbc155 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
-# From https://archive.apache.org/dist/apr/apr-util-1.6.5.tar.bz2.sha256
-sha256  96de1dd6f6a0476d2d2e7964926d8c1ddc3bb0e210e1b1812d3ba5a454a392e2  apr-util-1.6.5.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-util-1.6.6.tar.bz2.sha256
+sha256  aa77dd25f036731b7246abbfbebe6cc813b42799b62c874bc82bd4e1f90f2918  apr-util-1.6.6.tar.bz2
 # Locally calculated
 sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 3669d2d2bf..6934db291b 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.6.5
+APR_UTIL_VERSION = 1.6.6
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
