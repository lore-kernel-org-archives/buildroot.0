Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1322BCCA464
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 09:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B327409CE;
	Fri, 16 Oct 2026 09:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moEIp7T4RzIx; Fri, 16 Oct 2026 09:49:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9D0A6409CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792144187;
	b=I/FZnunVXjnUfsch1xPrHW1I9mRo1Ch9GGzyctPzcuqfoHMM1Sjk2fVeyPEDRVJgKT+C
	 Nm39Bf7s6W+/tkrht8LYI+PlIu3czr0NGQwsI8GHovCfNweF6U0F8sYgPBliwC5fX8Rv3
	 PTA8/+xisuJrMnBhaPMG+l5/X1nmF+vV6dFbZGcUulw+CHEvZzbKi/rSeYpw5ZhgBUETY
	 hhqe9nP1Hf/CUH57Xwv6PA+meqXhJSZ8866/LN6aNp1JslJk205365zsPin/pqFMyoxwj
	 pZVjYdXi12uYxwVKQvGI6y+RMjpq6OT5ddOKfWhxnZMTNi4u9DbsMkWCXsngLF1RQxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792144187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CR2DfGIkAgDrShbtHNvg6y/I9avA1PTA2IK/je1sCCo=;
	b=OiGhho6SV1VicFXy+u3dQq2cibYn5xVQ2EVMkppbyj44xUFGCe3+bWS78wKWglSzRtKr
	 l50+KCGA01L0kRMNlWeZPBQMp3HJUaOf7L0RYo4QK09GF53J5zbM3cL32yFbChPOqn0/+
	 b8gvReILa9n/PoqbukVb251UpTVmoy8wdt9NT7B4lXMVXBVcaElMJT+stI8w5rxgFA7Q+
	 1mc1TYuwYHuBIEZyKzh+txwf66A73K9QTaTuE6D+UyxhObIIitIYOlhZvPovCUEysT1lm
	 U/CbOLcsp3pXGZwe57XwJXpDuyaUZQcX644P9x4wYVXx0+KmOF1Lex4qRECuUjKwIQg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792144187;
	bh=CR2DfGIkAgDrShbtHNvg6y/I9avA1PTA2IK/je1sCCo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tibo7Ky3opp5Yj64wjm028uTyvP/nJkgH4VSc4KfvK936IppPEywvN8eLqWaN3iML
	 Qz7LSzr0mFVFqdDeXSZE/oW+c/B2Pq5mM8d724seIn7PeapPBdxKaVaSOvzh1K/HKY
	 79nWhTy+hhpLKsSYlOgnuvlfd5M05WNV1NCgftRpk3ZmS43AZWsGMqpFUEMCtumr7d
	 rG4soEIcTPOt0C6j0ZS6jrhfP0AZeBfYzRYYHth8DCrGVZM6MT3xR53ehWlq09C55R
	 tKsITHyd96PJosxkk261aZyGEBTIGa8tLsTSIqOnTwwGoe4j6ciPLWDVmrZOtgJh4S
	 p4UGlnEmiLAnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D0A6409CF;
	Fri, 16 Oct 2026 09:49:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECFEB362
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2ADA4045C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_Ua_l0W-Q-7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 09:49:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A31484016B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792144185;
 b=o/4EOj4hKl1mu2HNf5u2PGXfj3+IhtzemZ2fQT13P6+ogyFY7ghD2e3N5rv+4CIYqzAU
 2s6XBVcarqgrTitD0sdGiXk4FaqltaOzFI8gsyotpBJBwozzqBvoI5f8i5qOKLggGtYO/
 6Xo4EIa4TnLoZfiYoUZNiRbEVpxrQf6sTLyxzs6JRPE5N1oBkL8r6hrii5UE25msJUdH+
 0fefY2UEx36mKZ7tSqNTGI44rV+dylK5sfVYCOxHupyd5xORs6KU2HSnl/ffebvU3QDZt
 Zvdf0Szro0VSHrMKdndB4Ih75rMEyp0uazf/lKj7j/b5OFz2tzmr4eEqjR+nkQSxPSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792144185;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Organization:
 Content-Transfer-Encoding;
 bh=hFXrEt7wWPfEnJidpPnsAVYClqSeBz7I/dSOuYRzipM=;
 b=oXM0GLJy93jz9rspXds7scFb4NvPrLZkaHVgGRA1SvrA8aGamtfzIKhex2F1XwHv+y91
 +fCnrEnsY2VmsuNugyKwHZi99At3GxCf/OSlnNayDjw+WhNYXe+D0RtL3Xu36xqwH0seS
 r2V3y/kpQ13WvAn7wKcsL76pZ79LcgQfg6hhphwnh+dzyZcbSOLp+7CMlZQNNOcCTor0C
 DM94q4ToozBKtIgtr8RCmctlBg3Ifp9/nWoEK3dRwNAxCEek1R11beKo61mY7kyIQ6+Oh
 agzPSqHOZiyBkwv7dRWpWV/EKrIrptAEfdY0K9Kjj3dRhxYx/Z3iTIPBsM/SqJC/GXA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lqNMXVzW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lqNMXVzW
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A31484016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:49:43 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6acbdbc1725so4255713a12.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792144182; x=1792748982; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hFXrEt7wWPfEnJidpPnsAVYClqSeBz7I/dSOuYRzipM=;
 b=lqNMXVzWvRq3zYopwwonKyK2y+nCCpUhhPeBBduEnt4sLmFdAM4RsyNJXf7a0ThXjh
 krdNWIgfPcSz4HimahsA1U25nfBJiHq2CrB2hqyHvfCGDFbyaHQSMaRN8+ZSFuRV9r5A
 7VqAUL4ctQulqF2MmTBkAFG4oip6zz7dFrJlqWjjjqB0Bl9nxFnt8syjybr0aUlpWYHz
 a9m/nZv0PMDybE/sPOdGkEnzogM9CQgG+kbvF+tFACogP+tCEmo5i9xf+ZZqV9yl3Ye7
 25SLUiryI3xLz2furvuKG6M+aFVKj8Wdlm27kW9LY8LTjOUjGIrhL0mzYt5+4SKgiEcR
 RlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792144182; x=1792748982;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hFXrEt7wWPfEnJidpPnsAVYClqSeBz7I/dSOuYRzipM=;
 b=H862sv6MRwbrxpCYnv4VC32vl3hlN1Tchq72k924xlqqEBkux2xy86PJOIgeLJ2YJ2
 70h3VyMjW7kah0RYb3l+kOU0aLa2nsxxDS7P7Cx6pj0m2ZFnlLo+x8wPqU4U4YmN3QC8
 MV0ED6+CIljgTMojrOzcWy/oDR2rctKwozZWfg+QlX5y5PL4tlT1MP+dGnnmR9UwV5mW
 ZJ1QI0IWHj7t65C9n1eiagtY7D0EMlGGOAR1k0zdLFT8bzTH8o7sPe1YAWhvSpWJWYpR
 XGnohwF7X413vGmmyvNqrDJug/FEJI0j9e97AVnUqpvaDFt0/kX0nEhyeioKs6Uzjzs1
 4iQQ==
X-Gm-Message-State: AFq9FYLdxdWaWkOHiuXg96thZcJmPaTk9fdsWKhiJ2KHTob82yaXMbvH
 dc/ozeo/sOZ/AXsP+Q1uCqQYbes54midXDdhwVzuICqyfmB5MBWDq8VtnPx+4pgx
X-Gm-Gg: AYBFou3gw66JZxIWyU/fYgGEXZi5rFBdPJZ14zFBtSNS+cng7/wa65FpOqplPhI9xsx
 ERz5EsadOBbsdj/AZptCgwQX5YI0/IDmwK7vrixPfwdFMbeyQ7eeVCL8Cccd+LhwXnXTXuVvxWr
 gN0tdPcuo/u9T06CkxhbmEuL61vz0dTy/n9iaQneNUVcRazHmH9oP2CY/aEHEuEhHPceiMvEyDf
 0evqQJfrMQRC5Eav8J3VjPhAaIDA0Gttz7OqzgtSHUB5IVc4HHQBXVgtWG9LjAWKiDGEBOFSCHj
 FNfdwhl85zBTFrzaUIut+GrWrujuSXMixhoOsJ5CComU5rSdb7wwucWN0WLL1Zw7J4LgSBDBuWF
 Jv5TFAU5+A8RH7WJwEGmeu3C6BvoE2aGMaFUUS/e7FHaBZmetn6LO2Z3JZdfamAY9TxXL8yElTp
 n3ygPA24g+ycvGzYF1AUbgNgAONvIUarM/OTX+2YtrOJFlUv+/iyhupRetmUn92xSan/GQQhslR
 2+sbb/gKQWvvLuMQakUNvp/JqmFTIhnEKvp
X-Received: by 2002:a05:6402:1ed3:b0:6ab:e30:c9dc with SMTP id
 4fb4d7f45d1cf-6b17c245c21mr16646392a12.7.1792144181812; 
 Fri, 16 Oct 2026 02:49:41 -0700 (PDT)
Received: from gimli.addiva.ad (h-46-59-24-110.NA.cust.bahnhof.se.
 [46.59.24.110]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1ea48bsm671530a12.35.2026.10.16.02.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 02:49:40 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 16 Oct 2026 11:49:38 +0200
Message-ID: <20261016094938.135839-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.8.0
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

Adds support for injecting structured data when forwarding to remote syslog
servers:

    *.*    @[ff02::1%eth0]    ;RFC5424,sd=[device@32473 name="kilroy"]

Also, a bunch of fixes for, e.g., UTF-8.  For the full release notes, see:
https://github.com/troglobit/sysklogd/releases/tag/v2.8.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 4 ++--
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index c74d7f9ba6..9e170a48a6 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,4 +1,4 @@
-# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.2
-sha256  bc410ca64551a11fac6518b418fb6b8afbd888a70af2c5eb353334a706727bca  sysklogd-2.7.2.tar.gz
+# From https://github.com/troglobit/sysklogd/releases/
+sha256  67f49c6b2e9d75ce15202db815112719f4af0db8901032f0c3a0cec1b9f65551  sysklogd-2.8.0.tar.gz
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index baafc38083..554033b671 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.7.2
+SYSKLOGD_VERSION = 2.8.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
