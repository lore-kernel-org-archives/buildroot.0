Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1C0606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o0kVSIrj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vvp9lYOo
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BA481678;
	Fri, 23 Oct 2026 18:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMO5EEAaycCj; Fri, 23 Oct 2026 18:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 39B938167C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779544;
	b=C+UidIY8eKOZGubCm6x6PwtfOQrOKQxKvaZNQzXkJ/Ytm6q+prE2T43R3PWBpamHfEae
	 t8YD5oUbwYYtfMAqNSJshuKZ657kQRxHcWeId/zHibaz7IxjHdy2aDze9LKMYHIPbIGT6
	 H01LVdf7PUAWnKBcg4kuYSrQwCA7tMkVd+M2jiE82ijbNgE75UtmFiHUySuOOaC7tnCm+
	 gYqg1pJGCVSudZDQ2e1ywWRR9HYcl+3kWtaJ/BzVFLsOkihTNTQr1+64NRJYinoaP9vOs
	 Cuo00lkj4b1SV3+bBWshVRe9M2FZ37l4tUC2VZ+c5ljixD7+qPLIAPsCL03TAO6BwuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779544;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xeBa43T9T0NUPI3qRjWWVqarOAvdFPxlgagHd4Gd6dk=;
	b=C8l73nvzbJxpjOCZYitd97dDaoIjNPvQDBREOlmbqFN0QYxgbP7vjhUQRKRyihm1QOSY
	 OAfwf+ZxPisBMUc4S0WKF7yO66jd4HWO2Xtp9sdHR1u6fkS8gPIRbNdv28cUvpuOCb8Bh
	 dDMnCTOz5ui8vwCUJp2mNvZsRET0qSyOkIGWX900OttduVIUjWtL+rzZQUgIk5VbmiJts
	 l2/Sl+mHmxFSmT/Gp4xqW4+tpABEP1tx1WNBXS3xNF6u9CxA36oYN9k1bKzc/I3YKAgu4
	 w4devLQCJkC+DuEb0Sf0s7geiT69bZ7VaPTFimvl6dOWWCwMEco/56P7oT+vHrFm4GA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vvp9lYOo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779544;
	bh=xeBa43T9T0NUPI3qRjWWVqarOAvdFPxlgagHd4Gd6dk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=o0kVSIrjnGSHwQfd0DnvzJRKgM5RrnQYSH5S6fXIEhSJkye5eDZPGKXvEYVPygXes
	 cxX1oPvP0yNyxJXTJeQ4FAu7hF/SWOTBGxujDjUCuf2DhYhIST8Cji++oXP2G+TW+i
	 PRnXmiLoAe2Xcar7gEEMH9yjFJDLb37dx9ARW9Pb6pd1zagU13DS7q46uJCWghLFzQ
	 Xnx85QjmXe8lyqDDjCRmJ7XU1Mj45XCIuendnDeAxS/ao37St0skwM5bPOfPx7uNMX
	 31G6Edtdn9RcxZqZarmDSHhJMjsCtH5lqFh00eOp6BCN8ElgcQLWyqaM2Lg2IHlR8U
	 p7oTp3WO1zt4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B938167C;
	Fri, 23 Oct 2026 18:19:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E18C235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B6F38159B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgADM-5lA-J3 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F0C480CEE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779534;
 b=f7CDqhnzar6oz7baFwqj+iNldC2SVQIS7m1QcO0Zjm47EUdDEcZ5HsFBxIWj0jXt443X
 QOpYXKJe/giJ66hzYP+PB7FfaVFZkFrU/CXAZVsUg93qZN003e/cSpufNTS27PdjUrndA
 AB0Szf1mfq84W+ca7M8BEyquAjha9n8wgDdtM1mXAD2Dk82mmbs4Dfdy1OLT0WfwOuH/I
 58ztyZS2Qo86NTQg6jjKYQ/QX3L3ToQBlg0vhBov8cXUKfkRErjqr1wcDlbRhtKgpQ6JS
 iUtowhcNqWzDMlcEJUZFP8q9OA/EeRSMDqLjAhB2J9iuL8nuGpDt8VGrqCmL9vL072A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779534;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XvCH4Y67wG1fO81VpMjqZiV5+esl4Hgr35c3W3LRp2E=;
 b=JRYOsTgyCRutrmb4zpsM5tTe3wmnR5gk2O+uG0I0aZokGC1+VSSchEkRdu+PpYJi5Kd/
 7wxIaGZ18bNfFabtAzuE/1Yv33f22QRjH2qbRnNobcihDX85vJ5MEnp2LjTr8X/xwsGqr
 zButj6XxpyfSuNeDWnjkd6bb3Mkzd0LLHkHjkAmbU8A5kax8FrFAh6YeL0tEkksI8tt3a
 7n8NFXkp82RL7hbrwNYYMY+YryryJyPZAKMKTXbsDANWvDL6fYlDETdrtWE6BbagADXj6
 vkXJ2qOs+FhvcKdBYHWWK7ZMxzMbttU8KZq+NYl+lznUaAG8+DVWiMl8EU5EdZreciQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Vvp9lYOo; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Vvp9lYOo
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F0C480CEE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:53 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6dd059478dcso779246eaf.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779533; x=1793384333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XvCH4Y67wG1fO81VpMjqZiV5+esl4Hgr35c3W3LRp2E=;
 b=Vvp9lYOor8ZQaDB0CImcLpJdN861wEfGPbl5R6RHCTlO51r7IN9kyC04Rg7VsuhkJu
 Be1CofnDOagVT/+G5YnnTS/cUoLoQx6jTIgB9yTQY8nsA2PvcRYcxGH4Yd+P3odcpWpK
 MN2tm9FfLayJlSmh6RGD/vXsO9ZziKfWldtofviG4XVcB5SJfB3sbZMbnECy6nJ9aRL+
 wJw+Cid7a9HctJ1hhjlIn9YgYjr4M73WSQQKsuD1PeEvI+RtPn1EF8Y7+xDA0rlRfHyU
 u/vMdLIHOhTHNdAHRSkVOIGfHw0jEs5JCEmOP0JgVZ38xdAV+ddwYE2xAvqRjH6HVRTa
 mMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779533; x=1793384333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XvCH4Y67wG1fO81VpMjqZiV5+esl4Hgr35c3W3LRp2E=;
 b=Z62dDoYASnY1VomH9JnJaQlmPCr/6ng+Z8ZJZ/6uJ/2/QzTkb7Q7mwgaAjNjx4rA2v
 KPgm6zSGVSpm4g5oYVWqbm+lM2qDqIuWdUxzyR39l5yGgCGX/PhKcuFbQKBpmqUipVEd
 Z5f6TelSIy/YIz35boaViiTDVyNQqafhD0exqlG6jItb67Mkn0rJuqiqMkbslnVuXVmj
 YDbHwVR65+ZXkMld0rAo0CSgDbVFiM/UnoFnu+nV6/wc8eiLLwbs7541qpj5uAWCwpi+
 tFSFvdE89L2KF5m6wcQa/GDO28XE9bA0PJwr4L+gjE0Mj0BzEclecTXP3ea714fjnR3X
 mpLQ==
X-Gm-Message-State: AFq9FYJ6bG4PQwK78xKnmGjIo8g7H8kznOkL5fAQkfHAERYKkoFuCA7U
 EaqUGynVvE662Nj4ESsDrJGycaRpLua6GxFdoyyErvZ3QlpKOjYrl+9CRdoGrU2k
X-Gm-Gg: AYBFou2nhglcmwHSfKHVH701kikL7B+LDl7u5Xu7C//lRQqXvbVEm53KwfQhTsG9S3C
 9pfOwIhFdNJiUQfeJrD8pobhOTQTbMXoCXwM78DkQERTJwoPf+srYLEqiwFEXmbLSkVPL5n0Hhp
 oV/RSRfqMGYvTWrRacdgfozbZO5gtoYTaG62S+28Lca1/mddQ2ZHbJEM32GAfsOh+ZalAKNMCRo
 jebA3azEAEcOyi204WMXBbWHZXNkAApSSuNBIUHpnjX5EOk4PZh23f3CGst7QrQPxFOxnrJR9OP
 W21RiF5+SrkVJE1o2vpcV2oFzNstiMq6yu9pY3Qsj02cLnlPh1r38Jpqk6ELu6Yv5Fb4EvTfQwb
 vFX8YEYF+7B2xEhAyZ7afhsP1FlYPqoyls7FKlRdgiXhR4n5AqXCw6sW4iHTy6vArqubv8sEUcg
 wwUcp7BZOiePVzS9DftRnaHjiMQrzNz5uVTGs21odn81biH/CADG4sWaR3aPZJs+STf2vL9/d7g
 sC8CVLnvZT1i+HSBAZACPbZN8vA0ZnUwtStCoUM4FqoqswcQ0onID3+nBN1abs9vQrdp9m0fRi8
 AFSsuxApTcLv4RvUeYbnXioS4Sbrhf2/6Cm7xqiZw6CVhyHS7NvZ8Splj3I8VQ15n/Lg98sftas
 yTbs/VmlsaI5KZcbXv2sCdmyK0WEebL3ZXovBpnrtKM/AMjmSdAi9WJd/w9d6nSkndiqBMM1NHk
 E411io3rM58vpb9xQaNoZ/81k=
X-Received: by 2002:a05:6820:3287:b0:6e0:edfa:9b48 with SMTP id
 006d021491bc7-70b88af064emr1852823eaf.77.1792779532733; 
 Fri, 23 Oct 2026 11:18:52 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:38 -0600
Message-ID: <20261023181818.920329-21-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-sentry-sdk: bump to version
 2.73.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
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
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 196132f5f8..ee77b2d028 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  b4ab7ff3867322c4059ac4ede7afd5c0  sentry_sdk-2.72.0.tar.gz
-sha256  0d2ffbc28ee2e63cbaf3d015e93b448cffcc3ef3be03a44704ad36ade72faa95  sentry_sdk-2.72.0.tar.gz
+md5  b904b4e99adb7227d3b9026e71bba3cc  sentry_sdk-2.73.0.tar.gz
+sha256  4a2ab97b16e4693c325ab361c7bbbb346dbc7d0bc0150922d795a25bac8d5280  sentry_sdk-2.73.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 44e102d9cd..e15f847060 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.72.0
+PYTHON_SENTRY_SDK_VERSION = 2.73.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/26/c1/d2bbb2b03bdc2ef14b35e02b647b8489156c50b6e0b8bacc5fa303902e23
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/c5/3b/1e47acf2456781c26e12007379ecc154bf310b8f64d40390d78b791d55c3
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
