Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA0606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FoyXkFpr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=bX8TRcUj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E0D60650;
	Fri, 23 Oct 2026 08:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-hUfqDimEBX; Fri, 23 Oct 2026 08:32:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A4426065A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792744337;
	b=F4871TwXF9eAzG/jxgw1DopoZ7NfTRc9zMKDsolOKKT5s1n1RxHfCN0dlHyx3MhbpTXq
	 PCU4ouGcvofQxWx31fQPMGMVE3Cm0dajy3VHl8aSPviskR2ySKXHYUKEynGNJK3KptTnG
	 gyUDOts6bvz/jTaBGTL57JhTuARqpqNRS1nLTxsRZEo4vwaKKMJwCUgSTZ6hfmoR7hD2F
	 TdM8Fadq7CmAHTKAbHaMweMiCN+A8jsQa6FUx7ryeCZ/AT5eWeCzdy3yGpyn8B2xDPXaQ
	 /5vJo0mlCKw6tgFRFwHJRvnbIUqsxIJrLeBOdJA+SOXwuFPxfcXTemf7DmFjqrCx7Gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792744337;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7/2KkDX5pmrP0gEaJi7RArzB8aSNxNBW3jHWl9H3KNw=;
	b=GLPmhNakdDEaJMmrq8vrk09llBpMvu+A3k2Py4i+OLTqCM3dpQHVnS+PKorpd/KJoHkE
	 j9WCH0ZBGNl+/BE31+hp4ACbi9glaOlXAOnQYhKs2RN0oZMjZAMeN8yTojeRwWrKVKrF1
	 +bwh72rBqk1A0lXRlVZIUheE2Qsovy3ZBH5wiQdy2ecwdfojyBdNgTPqABffNV2j8SuGH
	 4rz6nk63oO/xnXn6dopoNPLsSeft4QkOvbmyoAXeg8khSat2bNI3c+ozPuNrCVH0xXjDy
	 DFSoj9/aGxWfSOcnk31OHoiqLgH1HPP1+9maYGEIAjq76tHLoQ4qipYRMYZX4eneCkA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792744337;
	bh=7/2KkDX5pmrP0gEaJi7RArzB8aSNxNBW3jHWl9H3KNw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FoyXkFprHQpBwckN4D+jC2dbYVvKBEE3CXxNRSFCt4qdx7JTzIWRHTnVDyGXsPtwI
	 w1nyc4b4BJZEkpRnJq16hR8Nu1FjJCDKXBoyC030vaonLN1vBTy0YrzoBsZxDHFOQm
	 uTA9cH1FtckaSxvoBZs6jzyf7lA4if26BU447o1idyGtJaUU5eGmr8gqZ9uAJUH9oy
	 dAe1WOcgDgAZDHKA9IwD5cr5sCd4Cxa6kVyyhZYKDVM8MUpXxjh+EJbsj8CFZ/StdK
	 5vLiHuAiPkfEteVpmes+e70AtpI19DlZPedsO7Q0WbWbidjSHiK7utH8XTCoXSu7D2
	 K+ifUM2OK4nsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A4426065A;
	Fri, 23 Oct 2026 08:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8AF71FC8
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 08:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA29F811B1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 08:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icKWcy8Vxge5 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 08:32:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D5C58811AA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792744334;
 b=gQ5525YKI6Q7D4htlIltUKKLKGqG/OXSkbkayvIc3CHJA2T9zn5O4lyNCv2p1TzKTVEi
 R1Urr71aT9C2HpelxEfeZUKBejrrh3/0+kvxROQclIXsEAfyLmA8fXs2KpbvEPPIzss8+
 7jG3ICra9Qqwa6mbVKuLTX3kkux7ApBEBWquNuHnU3ruthf1LxHbIkcaXSAYx9PeJRea6
 T9ihJvBQVD1lNvo/kctajxzukLcpj8GK5n8yovhMQlihCDVDAYLtBS0oPIUV/t/t7hEw9
 lE2CxoehRTQL+revvHQvB6HEc0cqd7VBwyX+lbaWbI2jXquTpVlEPDwiNDhWOCQ8XUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792744334;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=2jwYxnqN9sJx8sGpkgy9qZR27DvP7fhDGTCjkdIwOXM=;
 b=rFuyHKsLcVd0xKwDnzhDt8uWS7MYtgcS8fKc9uKRQJlq+DezcwM4ZyWvgshApHPT7soi
 nQG/d+wdF3fX4Xwq+iCoewtjCp7uOGyZkN6cLA8Mn5KUrvaENqNsWSaxPvtkFZxP0bjbr
 844YepdKhQ5mh/es4qPjQFrZApW2Pr8ewI2v60Ov7lnDpEipNxpr9aPu7yElpDxn+vQc1
 PCoMMfjnQ9H/SCeg7tFrwVq1IOQapJ2hGxPxUz1TtLO/bhugJjJlRO3nZ5V5LS7OVv0GK
 ow6/U4zyf3cCoJO/JwglTf8dC7LRZgOM3lJQiMVOIIIJ8+1hkmDR7mqo8Qf8GDcZj0A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=bX8TRcUj; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=bX8TRcUj
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5C58811AA
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 08:32:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=bX8TRcUjhjDApnNiQOM3JDC+nVAA0kj+M/IquoNLFuoIquqf6AthO7X3/hY531xFgV91SzsQcMv4CEUJhA3oWYK2KqaIxMoRMK/Ea60iX6K2yCc9DvD/+YvBX2DJJ0Pjl+aRN1C3FQn5m+7/zv0u+nEeHep236sffvl5WAOt7RKy3EE4nEe8FVZcVm0oMiMtOfAWufGLIwcU09gNnp0boWuZhFqVIUMZhuMfoatEb4gMtES3IRWybOt4w2O4A8FnZVgYosHqG1Kjt/dL1i4Nu4ONO3ZrYaAzCVgYX/Cs0FndAxCb8ZS3T+w4KRO/HEpXxbunXOxvBRPciUybI7Kidg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=4rxq0yvCCETmlWnbbCtZCNp3JE55w1MsdRnCHy7HvN0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -166456756; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 08:32:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xKAh7-0000000FpqN-0iLf;
 Fri, 23 Oct 2026 10:32:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 10:31:35 +0200
Message-ID: <20261023083137.3767694-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH-2025.02.x] package/brotli: security bump to
 version 1.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following vulnerability:

CVE-2026-111497: out-of-bounds write permits remote code execution

https://github.com/advisories/GHSA-9v8h-qqgm-4m35

https://github.com/google/brotli/releases/tag/v1.1.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/brotli/brotli.hash | 2 +-
 package/brotli/brotli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 145467c420..0500fb79d5 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  6eb280d10d8e1b43d22d00fa535435923c22ce8448709419d676ff47d4a644102ea04f488fc65a179c6c09fee12380992e9335bad8dfebd5d1f20908d10849d9  v1.1.0.tar.gz
+sha512  f7f3a7e4620403aa26d69458e0bb886d322f7677685c55717fac824f0b789e0c25cf4ff7d8d455d70a8526d0150d7a09b9df292a11f9ef5d3bf625878cb51368  v1.1.1.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 80aa2566b5..b7049b104e 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROTLI_VERSION = 1.1.0
+BROTLI_VERSION = 1.1.1
 BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
 BROTLI_SITE = https://github.com/google/brotli/archive
 BROTLI_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
