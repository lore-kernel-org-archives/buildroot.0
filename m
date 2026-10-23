Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB6E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BpP3TtRN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HBUFftw6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6461380702;
	Fri, 23 Oct 2026 18:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXr0W-AHdfBo; Fri, 23 Oct 2026 18:18:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7EA8F80BBE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779521;
	b=gy5Qq7D0LV40gf/4XQsXspxquC0rxmX3+wXdGF/KSOLyLaDBy1cBgRe/PuNTgqh9vPmv
	 oGqvicVX2kKnZlVFqV+jEocO4LL2eKUoauA5ODnc8cyBKollyFUsi63EAPosNyBIpxThu
	 x8ccvD8iEBqNhufU+7gkVfc35EjKV568Eck+Y1ZZ86Bd3jbyyYqjHvGyaXJ9LGP4exGsF
	 +F/AJGdVzpZa1Inm9ReRCKQvcxztOpEB+gFYwbDYxDi+gWner+nTDUuCEw+4pGnQsoU8W
	 RmBJpI5AuNSA8P7z94WPMiiPWAm7DS+kpBCZ1lTajo/FlVK44mzPu8hx7YdkYxU49uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779521;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CJeDU7V2roUJ5iwygsTbXLGXzAF6d6iB75enCpfuQ3M=;
	b=buszIUDPOuP2RPFzvsNYO+wYwPZtOn6hQCvbY/8VVt02vzk8TURoY9igCPgkWG6KKdEy
	 rC86mDdH5ReQzRmx+3b/X1OKGBVkmPzX/VWVc9P6xitjipOPWFT6AdiRgLEUttkK34Ro3
	 /5SK8bNs/Jv751Jtb/OMVW5fBpBuoGB0TKTjLc4rlPAlcN0AGOTbs2eQfAispEVd/hduF
	 ghi5qJUJOYCAC3QUCiIzWcnwC6G2hreDA6fEJqL1LhYeGHQkbMZcdiPStnwYJ8i9Kue18
	 nANsSzTdEP9YDFosN7hpBn+JZlX1p1t0XCfVUafU7vovc88QYigHv+h0mpSD1ODk3FQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779521;
	bh=CJeDU7V2roUJ5iwygsTbXLGXzAF6d6iB75enCpfuQ3M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BpP3TtRNe4iRFRTMMWE4YGRhX4Q01xncFjtH0EcF5LBBLGjrIAteaFMIafdh/S3te
	 n9f4oPasbxJjL0XG58iKhlhv9f4gOgh8ljdM2n53OjxIh6Jm7LLs+zo7zU/tcns/DC
	 hdwb99v0rAkukzmCnIIj3UwGvi6x5rzYXbROwmBAt/DPZVsxQOSR2/VxLTvayZkDyy
	 fsxFihK7MojQh1Qh89NbnRt9lhj2IfPS+XRn5MaJ5JrWWssEY4YX1rWMSqo6Pkyq4/
	 j+Oe0Uo4M0cSjKPFJHK7atawdlegSEkEYZPUCoG1K1P4uzPkoQTM5D98PPZmdyiR6D
	 kY2hFf7PmUFoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA8F80BBE;
	Fri, 23 Oct 2026 18:18:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D704235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 491CD6074A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QERaFQ4haYC for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5819B60A3A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779515;
 b=UJ0+eJA+FDlzO8BPV6Rzo1u1Yo19PsvdgZzaC8wwWlZ8gvuX6V7mlEE2AvFUNXVo0ESM
 2CCnW/ZEX/kZ4JErUXfCcj3o5mJLUG+M0dJrOPa5+PL+OQ4+MjXA8ZefBfUs6YgAUpdT2
 MpDcJ/tx5ycmOVLv1mEzLsn8zXoc6yBZrk4yBreCHw20suJfNoHx0nm/f8b5oqVQZjpZM
 BthjO+Ih5TNEV0MwsI26uRzdS4CeSpwnfoWn9gDUElaLq5JIBnjWEjKyOcCDYUEcBS901
 o141o2ZOxH3kaxg/rQQ6j4OUXPlWdsubvYKx0MsmpCwknpSJYxE0wvAloMSXpcWRthA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779515;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=54ZrfQqB1oFvzipOVaqPXRrokCB+wNYe+URcWdYAajk=;
 b=WJe4ilXGufYngwwzWXGQ12A/1K/bYJSD12qiylV/Rt9da9/Y1EAdOg/kGCoKakNlbtou
 PEm+n9IRE11/lrkirZgI8pK3Brok9o9s+aDdlanjbpTcTpL4U3OASMvcHKcNJDecSiGiz
 q3NGXN9PyExIxnkQnrlo1RwSw/E7oVVtf+KDxqEG/8okSpkHOX+Ll1oYLuSHavVwnxFbP
 YZjIpne8r5s2Nm7eN4GtMDqY88IAylqq2ocz6xMPdnqxuX41bCLx96tFZpxKUvgImXlMk
 InjNFCIpIXPLBpTJerDQ0KDGmmmFu52HWctfibi9SlN8B8mvICQYufdrvi/3POv9aCg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HBUFftw6; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HBUFftw6
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5819B60A3A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:34 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6dde81a6820so819192eaf.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779513; x=1793384313; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=54ZrfQqB1oFvzipOVaqPXRrokCB+wNYe+URcWdYAajk=;
 b=HBUFftw6cmajueeyIGItWL7ge7ps1F8y4R9jsaRIdsCC+FmNYk9YvtyBmJj5lyhA49
 VUr+nKFQavQgLfDvn1WXjpdN4YJwsP85Fw0kWEOLuQhU0Sn738MJjXfR8w30rBaf2IuG
 77zFQcUt9h7rMx+Lo+LDQ+VgXmp3V4RRbB3Sz/Vh+/xBtMCrXqkwk8KOknb/F9odSZId
 +6TItijDU1fi172ijzHT0OouQCzjGCyonLWMgDzhvEkqME02Yq/guoKWeAA1l7Lgut11
 pMmQElOqqzox7jC/N54jaDsF8TnHVBEfVHM/DPAUh2ofxcolFCHf0W6PeYPjIEX4kg20
 Ot8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779513; x=1793384313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=54ZrfQqB1oFvzipOVaqPXRrokCB+wNYe+URcWdYAajk=;
 b=ZYsq+YGSvJVa9pzyw8YBo4iH9bk1tSXY2evdRCplu+S6EZZUbVQsqIgMlqhbe9atRQ
 4BdTDGx2vnOPbI43K88867SpDqbk2Zsrcvv7az+51Tpgtovrs7QD8NkrL1yr19FWSCT0
 bk4GRZXmBHjQSfvbQrqLqDjf39MNQv+aEd1Oio9+jhqBv7eatLP6AHIdxgzrL1BShbMv
 cv469mRxWRW7C/sFki/I8AwfgWzKbD9tf/AVCfD1vuXn2xvTG14gDWhZTbuLf52tCXpS
 yL+lx/q2EGhHzvIVbHReazSYUtUkVQrurydtQI4PHL8SFEpdvk8GtboQxYw7cafpk+/n
 8KYg==
X-Gm-Message-State: AFq9FYL0xsP6AGumoWLKtR0E0wyCGfjzUaP+dE1C4bjPiaxhQjINMV0Y
 +5mY3aRcvJ1WCnddtChApfqCg2U2VsQpPvMQkz6UoTLViQW8rWCHBsx6So7jBw==
X-Gm-Gg: AYBFou0pAhjhBzHwYTxMxjSq/rtWPXF7z+07hXfwcAND0YSkZtfeqbUDhrcuHPHV8oO
 H0fd2eYcNpEcF0caPtOKva2+G/sck30kwwFKD8wYCl3p4ggx+HMHDV+NKTtfE4cJYQIvkYgbw/J
 cjQKpUBOrCu7dkRqv2fCERYopGBNb9QtzvSa4DZ8Jia/wuIHuRmCmUmyPFjUf2mzbnnJ5nnSFji
 57z89t50GrswKHJCnqOQrnZyy2+2mz+NUyPL9GGjMMrj06ANaXzRF3Pyvmo7z3LP+St+lhYpgzL
 Z7cDiUj8Soj+ebfnulE5G/NwBRtwTZRubtQrRSjPf3YLmvcauyxF6sxFHwsBvhxPSH42yJ5bWBD
 +ekZylwGjmJ5+WZUXI0FJ3y7U/j4gvxKICSmIQwmjSRQJVk+C0gDdEdRJ9Mm0ETcFbXsBclAZyO
 xIxWQq0qP3uwK00pfFTXAvNS2BmGU71R2wf6iPbpv2w46JcuwXtk7g47PpxWttqijzsA24HHeI3
 KqWhaAuMjzzVUSRh/Qd6/UBecyb43XkbT0ylytjIDSGwTOpb/m7RJ/CAccd1EfBT3qfXX59Phb8
 JR+NPPWYvveaO6tKGc9VXrbA8+wpJ6Uv3JAYSQlZHftl4kDC76GLNp9SYQyzc3AyZIh6Op0xV2d
 +pps35FYr5FvJJFixFuNdX9JK8v13Ut9qoJ/Yg5yipQALkZ3OIkKoKvw96SieNJVgDHGncL/NrI
 lAjqcQ4UAXq/DSla23ED2g6Gs=
X-Received: by 2002:a05:6820:1686:b0:703:c2a2:cca9 with SMTP id
 006d021491bc7-70b887efa1fmr2089248eaf.3.1792779513582; 
 Fri, 23 Oct 2026 11:18:33 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:26 -0600
Message-ID: <20261023181818.920329-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to version 0.161.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index d45c91abee..ed222d8e6a 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  252e224309e54dcf795e8ffee564823a  fastapi-0.148.0.tar.gz
-sha256  06ee16c50e429daf993a58ecbb5306d284c4c1ee8135380af39a5e1cfa715187  fastapi-0.148.0.tar.gz
+md5  9319a9bb00c891dd4d6df45dce5b34e6  fastapi-0.161.1.tar.gz
+sha256  4076b88434452e20289379068e976c4a04c65ffc8e6be31510106e150a422f0f  fastapi-0.161.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 4ef5141a5e..547748417c 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.148.0
+PYTHON_FASTAPI_VERSION = 0.161.1
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/72/da/e962004c32f34fb630e8393456cadcd08d4300b6fa0099ec0ae5052b8418
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/ed/3d/2cc1a0dbc2dac6e157b4ef12bac063e1016cb7c6d7395f76665e439cf1aa
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
