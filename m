Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3F606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IIHHO9aK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yngbN5+3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D1FC608D6;
	Fri,  6 Nov 2026 19:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeIIPWsWstlE; Fri,  6 Nov 2026 19:16:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72250608E7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992569;
	b=KgYnHZmDICWSmWV73VX9n+z99oOk53DynIAia1guDw8gvkuifQNa6owpUmPr4HIunYU0
	 wKqP9YlWd3RDXsQ38c7CoijyAnop/cbUH0uHmt51Liwx9+cHyF8ok2PCLUyzhOX9YGptw
	 brE5GjQN7A7MtX4haduIDaxmVQ7lkYnriW+3YD3stDCb0T52wdRVkmUglhw61HnFOgwh6
	 Q4cYoSIEk1XJcynT9oC34crxITpeEOkmcs4/Nzl0TI8DVNV/d1MuGzQBMIPD1hOGimrSi
	 PWEQSSkuDtXgxUXpHwgSkuuMJELKRqR70lPxAUOZUgAIB8jlNy1AvYhfBUkocYN5FuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992569;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=P+WWQBodAYsjhrOPhVLjNyRLl6J4wQozuywnmTnMp60=;
	b=XRa2RIIcaEQfL6m7hCzQY+QiKyq0EzdIrtGOWdjKoNNltEP1UOcq5rcI6OI9d1tkf+sg
	 QhupGfXFe2c1k+NZozw5OKE1Yu4VlAQc668Q5b9GyG2s1SF4T55PbZpZT+3z63OEklt89
	 bYHs/5OIATHVgHnsvX1hl+Lr6yxxKj3tUDQQjQtoq814tiMWu5NduK9lzsxgeKrQoP5wI
	 V0igkRyUn7x3g5FcIMmxxIoal5dllNLk8AEHp9GwDLGoM1I38xtal3bo43cyixiVkaPWh
	 Be+UEJaJY4hBpqAAcN2sAbXbpUsf2EjHLYABaNX+TETY1BewYJw8ep18AultgHy+7tg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992569;
	bh=P+WWQBodAYsjhrOPhVLjNyRLl6J4wQozuywnmTnMp60=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IIHHO9aKGJJCZ6lAVXzQlWsK3D2mzGdfFtAfwHtIMye3GONYdpbX57bTw64NyoOlU
	 /X4OwfNctcPVBXFG6xco873iNytf93f8+tgHBR4GhcRmv3iD1wmXcv2Wl/FoF2ow97
	 KjM1sc53/wgbhZpHCXWT7MyPvDkd1JByFh2rPz9uOg15DLcGxSjCBQtaIkmJOzKMiG
	 8ZPoDnDXJODcEsOvwepgJZ5tMLkfLSIzKo5gUEGa5QOnZ7UdjjKvZ53JlzmdFP+8uD
	 HcpbiLjpb+k8gWCtsp1En0VCHOdTOsVMbCbpHuFq1ZZhZCCU/qj2TJ0qa0tKnoD1Db
	 GwCTmTec75WPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72250608E7;
	Fri,  6 Nov 2026 19:16:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E65E14B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D88B1403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7JtCKQW7S8d for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EA132400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yngbN5+3
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA132400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:04 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-847ac7ccd85so629934a34.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992564; x=1794597364; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=K0VhzGeW9PYAIXAtVXrRK2sIfhyPmGE26yF5R+dZTZI=;
 b=yngbN5+3QZeEWSK7qRK1ABPY4p9rsX0NiXykV19rg4gwLeFWXS7Bc+wGAUsa5BLl1C
 rToIa3wI7K52M2/cfp0lWMUbzgZoKspqF6i9viVXVpeesRDPrI0lYb928642YIsoWDBs
 Lghycccwgue6Lb/eAOATc1cAakPLZAJirVfjiWIqI9P6mCbGp4QSNpVXpHaiXw/LF+CS
 6sjqzNYHABhzlGIfmXpB95zrr7ottZ/UJudDG4PxPelao0erBTbSL7TepzKNZEa5roNI
 FDjYNKzBt2BUBDnMt/OFMOvTFJ06QoG9V6eNISjqOmk6Of3WsqLexjSQQ0u1lcuuv0zy
 5Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992564; x=1794597364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K0VhzGeW9PYAIXAtVXrRK2sIfhyPmGE26yF5R+dZTZI=;
 b=cpEvLP20ekavIvAVhjUlF0Kat2AZ9mrtM30gPQ5VcbVbR26uqJ+n7U9kdL21YGnqfH
 dSGKrnkVFaWXbeNEYHl8FxatDXLkVF16lATD5et/C1rqcAIRlR6r/tw1oo5srKXOFV4Z
 fX0eNNmvSIkZNkh7SG1Ys+cIMF43TKdn5wdA06BZTy9lWLl95KYHisWyXhb2Fq+56V+K
 4yoctycu9gmiZ8g+Q8ws6zLMvZR5vs7qhAg0hxWW3MH4HYJtRmSDQt/+kxfhmUdfqT22
 n71GehE/NZxJPs/tZl2gmBaDHx9bPal7H0evc5gMhv2LFIYLOwlWo7WCg7kxBWamakUE
 d6bw==
X-Gm-Message-State: APuU4Z+8VtrB5Pcfg5mtsAfY+DuWBKtLVP6e38tRPE4qWcAwJQ2spwIG
 dSZEaN66h/L+A9xVT+8U2pt1o1EqDDljBpRXs+D0rewetZH9MzOHSdVNfdl64g==
X-Gm-Gg: AYBFou3hi+vXOP+QkrgPLipgXttf7KHlJPVu/aJmr//1+LkMCRJenb0UStMWiOxSqep
 c4lYAZL8DhS650dOZvp6hr1ywJhpcZEH8gUhmKjLVfz+1xqm4iXYRVgwi6xDU0JH+JGdRYQG3ID
 htwOhcH4GAUWShXvHJSKCj1cjsrh4AuyuyF/Q29uCljm69XuGO8/J3LC7VJCGxzJ2mmbEOR4/SF
 14JhK68yxqZWXGTwhkYcrsXDj95KXyp4nNgmbyKwbXRLJi9HVCxklkO0chxNWgW7aKE7cWpV9k9
 gZnP9IWHhTK/5ck9FDbMSQMKcX+9mOr+xLc3fm3Lve8OFwbEwwkjVEXfR8Jnf/Pz/vJ83Oqtupm
 54N/6KE6Rs9aLmQRUOo5UsyXuJMCxF1V3IF8dJsF5dE2tWDauA1VZLI2+hEKlSlAeXlXZ/Oe+Rs
 Cc5QHIylawitGK4SuI7awFwLPV0mxjPCCx5mWBRvZQX9XbQty7Nd7rHFoxPkTkdvQr0XaGswjxT
 plP0/yQm5EFI/5Ctmq83qztxZCnMCqZIDKXvPGig1zm6LqpwnfONx8BHLxB0v4w9g8MY5leMu/l
 dmrFdQQmWhgKhWVdprjO6OMNLWvWqs5b+vWIkKDPtTFZnzO3anOnQsOFVwsOH+UixQFv23sDwmN
 ZJ7b5LwiT6BL7pwyrmpWJKfiSozPdAglyvHC1q9Q5tT7kAZuhPqhOVBnHLfifpH+q7n3dywGqH2
 LKI7eMhNqH9qmUzqEk+g872w5euObDKs4lwkUFAPyHQN9e0YpNkea1enIdoVlaomc6WmmihGedG
 Q==
X-Received: by 2002:a05:6830:6809:b0:80c:d34f:5f65 with SMTP id
 46e09a7af769-85f1d1c41d3mr3095067a34.30.1793992563692; 
 Fri, 06 Nov 2026 11:16:03 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:37 -0700
Message-ID: <20261106191536.2120153-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-google-api-core: bump to version
 2.44.0
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index be09a0a49d..3d9ae90a5a 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  ca991e5ca3103553a8798db83c30be5d  google_api_core-2.43.2.tar.gz
-sha256  5dfc5e9d52982bcc03bd6af380a893365b5fdf907dc527f63d3a372833c33329  google_api_core-2.43.2.tar.gz
+md5  224eee0f680689c74b802dbc612358c3  google_api_core-2.44.0.tar.gz
+sha256  5ab9a396965c1227d7dea4581e562b7018aa2bca96d2de0be5eb70dc9c8ab3a1  google_api_core-2.44.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 9d58e498e1..56d83df8df 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.43.2
+PYTHON_GOOGLE_API_CORE_VERSION = 2.44.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/a4/74/307919972c4dc84598f4128a8d6ae05ac3d9e6ca73fe60a7bb93c670931c
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/72/ef/63d89cb580f3a42c51db53b3d151352aa61b9c87ea8cfdd8d24ee6caa09d
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
