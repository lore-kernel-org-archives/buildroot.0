Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A065606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TD4GwOae;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeluD898
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCBEA80DE3;
	Sat, 31 Oct 2026 18:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8kj6bdO4yFL; Sat, 31 Oct 2026 18:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E2B7C80DB1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793470126;
	b=fMPadhlG3saOn49ahKCUCc0TuMVbvs0UiuTqSZT1AwKWCEMdQucqxCSHM9eqUE43XGus
	 QnAsSa6cb7/bPJyZAZ4r32nZOD+zc3P6CUTq0CBMO0k2fDHPRMmpXa0s5Ou+THxWiqmmf
	 AQHHTmXbq2tQg/ZsgvGZMGT+e/dIE9PCNa9LRIhZP6QWrSWQi+mzNgtIaIlXJKyMFRboD
	 yk/8ZFqEcgc8L6ChPaAv8u4XyU7U1ROhGoszfrf3oqs/KMioV//p5f5kPqsvL5oPtC+/5
	 TpJlagW2QWH2M4/dwoVlO4Q4BwiFjrNoH4h/aCZ93pAHnYT1f5o3e1EEu9eSTTkUj4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793470126;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z2UYnpjrL660evAe9jooAHFz2OrTnayLosAH5n+84Zg=;
	b=esls/StVxywX/BHW/NeVC1NU+57XCidV1RvR5jgcUaZPqHJFAcoP4mT/MNgDWygn14Ay
	 yLdn7osvx9DREXOngDK1rvVlBrR8uWUcf/NiAO4RxFLch+lTb6e5Yq7o3bplgUNpTttFn
	 ezJds7msI9zuE69z+ZzZfoDfFr+KIMHuz3eIueH/bydvsfTyQo5yyeiJYgngUeS3E/jcn
	 6B+bh2x4cQLmY1mgdZLXMcVw6mlOWhaXbkwR85MqUrZLcUwHQth+pRGxODKGH0l3c3ZKW
	 jUcFYrbpbOwswsgqyzr/DFYEeJBT74Zu/AjutAh8oG5rRmSjRfTPTQc8E44iJupXP6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793470126;
	bh=Z2UYnpjrL660evAe9jooAHFz2OrTnayLosAH5n+84Zg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TD4GwOaeSPwPmFqzQMRS6DrZsxGZHTnVw8zVb2N1k+H1psr2YvdYXG40+H6yDdoGA
	 HYca0zZuGYqGCDqnvDEfmZLkW4oBbS7depDLcsbQvqeDgmeyDqfV27dPjus31dNr20
	 z/mHXHfv30zQppYlooej54sE+cUihYMw5ckLuK78IWKeeLT6oN+tJASTLbgVlpGw/j
	 6j/Jp3g/wBvnvZ/YYn5aEq2XSB2T28yv6zP53ZtOBA4PZV06AP64qt957OVBJK+Zir
	 1FUWnLCtGo880zVsquEeUgAk0savxgk1oBzDGAIMODIv93IHD5TZs7OSRFTAYpVdkU
	 FWZ8GVm5To6yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B7C80DB1;
	Sat, 31 Oct 2026 18:08:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EC2C4E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6088A40699
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zil7z_ESi7mN for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 18:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A15640683
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793470123;
 b=JK1Ck5mMryGgxo0toN1qzyOpOcbshcIMuylj04wRa5yK1xIS2784dRiGmPovRRAJhN5U
 igJedwsOUk+RBZ75c9CqJ5bxEyFd0HwUyzm6ne4EG2tOs1nBAZk9MwynbMGsh2d4/l7AV
 ffGzpYLolDaYRjBhDcTWAAeulcV3DkvxtPpII1WIanlFZff7h5uAad83ZBxXQ8+6GUigx
 huKqptjYxG/+tt+hdo1fWpFX6kAvn94M97nzTx17WTTdxznqlUaQ0siF1D8qmCZADIkz4
 LtpOraFkGRcDjrmMzJe9xSNuimSFI+xdKWZ2P6QtSO/FZJfw9w74J6C6bChSQMavwKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793470123;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=PRLQiiH0nq/Lq+S43znktZNHFGLEDYHxDKPBA+WMl68=;
 b=CTNs3nHUPHUHLy0DZ4UzHbggI2ul5884265r759C/KHEJcSMvzwbsWto5WkGuhC8AuQn
 l8JpD7+i9U2iubUzqBqzFqFll2R5Np3hKB5p5HDHqkLXWKV34LSQ1BDlPmDvGe9lnf+/S
 xVUtEuTUDFrOfglYk35a1XgAt1ienZ/tRWUTKrISU2Q+C7Xb624g3W0MAvIyv45Y4Rw95
 dw737YGH1NhzobPnoWr/o0QdYEyCUOrGqbmC1hWQZOfyMyiTgGHc5J2pJ2xT22ie3etT2
 OVrA2olBhQhvoXKaO0gjbaI9Bpl20ib1H51TE7tVsOS0iPAlYDguj223U98W2VwG9LA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=yeluD898; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yeluD898
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A15640683
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:08:43 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-53ec92375d2so887796b6e.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 11:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793470122; x=1794074922; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PRLQiiH0nq/Lq+S43znktZNHFGLEDYHxDKPBA+WMl68=;
 b=yeluD898qYey0RkKVeceSc/sMqVG+MP6KmCbf1uQ2FftDJLmfAtjmOqwd9oSZG9J7y
 An5JovAvAsjUUU28F18/T3TXTHfEc1aE7ImKYHHuOT/Hvd5UNsdyd3WYH9R+4gQq7Uxp
 dn9y9O2po/6ndoTgpW1eZtMDGx5TtdgQIEGO5sJmu1D5KmKUB76Zb6TPyt/Ty42vRsxV
 S93fcKTmelfkBiKTSP2kObfFdJnwMWIIL7t7FDF+ikwmTb3+j2dgMMsyjLjNzL8aqnk9
 UhSFpwFu3iFrYpqrtCxKh8BGsT9GGnJdqfJ2I/JHg3Gg2uZ6EY03q2bzWJUAfpLZTgzu
 T0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793470122; x=1794074922;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PRLQiiH0nq/Lq+S43znktZNHFGLEDYHxDKPBA+WMl68=;
 b=qJEQ/yk7kAsz36izpAocvbGwA86yEdGx5xML7Nn8Y3NsBTVxwRD1G3Max8gte8ii85
 YJRARo3fOgXam64bupCtnrmsAOXw4PV1ux9EoXzg9Nys08a00ADgOpG4cBnee14xv8CG
 EMVmkg1pMexJNtvIP/nWp9H3W246XFnlTPX5Z2e8zepTjIH2mx0HkOsnrMAbf2BLMYkw
 l6vJdVG7SumZ2cEPVS0oktlbQPggsapsVEZDiRyVpbWaY1xK7GEiyV4a+Q98/gdWlm6j
 z/0a5x5JC6IgM1KDMxKUqHXjiatPodb8R5CSszPWLVxDRdgFFbyyAVTBgoBjStI3AAek
 cQRA==
X-Gm-Message-State: AFq9FYKG3uHx2ixbaLGVngZiW2x9CftydD24d6TwVXzzfFs3wH6MPIxD
 Vp9FP+Pmlmzc0RB+Cx4meRIIwtPqFlwElrXZf6QvPy5EsWnOgI7ky+LvQBRXXA==
X-Gm-Gg: AYBFou0Ll3394u5ttLoryeH7XlGKjOjOsgTO4jbJ5ozQq0zByFY8xbEOdBffDEMe2kr
 6TdI72xzAOkxGT6E/qHcyd5DfqEZfOjNya6ZaPN9mZv2LSDL5wmdKGO4jyq63VJRjeoA7qLw+cg
 tYcgmpfHEsGnCFaOYxV0OYURl5Xks73rDzBEnuTt4AdOdOWbHiKGQaWHYmuNBaITkA8dvUCvNGu
 pXyEUzCuOUaphW51tdm4GyM4fo/koTtwZSf8+IOmy8SCNMGSK45a+k6tS2aA42NKr6q2utDEkIE
 lnEPFbeF7RjNc9B4aVdc87YopIYJwMbRl3JeXf94soSou5ZmUNXTZEpCtuVAcxqGUJQB7/9PNRD
 AWunu8w7XNyZbJyagS4nsMyeKlnf2IvSU3KQLmH0eidJeQ5cAlkUjjFEYfhcfcppL8o05meODHx
 eqePGaDLSjfc0M6IfHzxUqsyxAw4xDMjDvDSwLjsisFjQ/WPpF6536oAj2RxIhiQerjMs4YwBLR
 dUIr6L7WoclvQRqVuXhDderlQ+PD66KIkUJ86RtC7VKsRisyaa80yqIRnoYWZBV+RojaMMZpedV
 xc6EV4MbE//cyUjMIC1sj3BG1ZosxbWTRAj69Yh5QaIks57LQ9A27Vlmp3cUdeaYaQPzrHx1Yo8
 NyNa8/wba/LTG5HPXo75T9238FS8KO30HHj9y7rwVU1vO/6hOOQJYQT3mvFg/Gyn6wOnjZlD3UP
 lJfAzK0Lb32TLvOPnHMYT/fUlzgu2HIF0KCgqusP6/cceAiuvnYzhl3+WjwecdWgpNJ2dRcf+S8
 Jykgw8o4+Iwk1Ru6ftXVA==
X-Received: by 2002:a05:6808:1996:b0:4f5:c4b9:dc14 with SMTP id
 5614622812f47-5640dcb744cmr4449010b6e.13.1793470122271; 
 Sat, 31 Oct 2026 11:08:42 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fc49880sm4548195b6e.2.2026.10.31.11.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 11:08:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 12:08:37 -0600
Message-ID: <20261031180838.2738700-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-pydantic-core: security bump
 to version 2.50.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix validation bypasses affecting extra data keys in JSON models and
aliased fields in TypedDict and dataclasses allowing extra data:

- https://github.com/pydantic/pydantic/security/advisories/GHSA-qpmf-fgh3-ff25
- https://github.com/pydantic/pydantic/security/advisories/GHSA-3r8g-cqwr-jr29

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index e06724f3f8..7b87b74c38 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c248df928b1546c10413c88dffe1aa31d44759b7c8a9239c0cfcf125fddd8fe5  python-pydantic-core-2.50.1-cargo6.tar.gz
+sha256  f976a051a732e45c5170d779823d80cc80164ccb2ead1ff35dae81d984e430ce  python-pydantic-core-2.50.2-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 4d22df466c..1da3d2f087 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,10 +6,10 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.50.1
+PYTHON_PYDANTIC_CORE_VERSION = 2.50.2
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/a6/24/af4ec4be49fbc810f35b0bdcacc3d433b56bbfa469fd3bfd4ae116cd9bf1
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/af/8e/23ec1021834e35041fbb2f10946141e6acdfd39379c45cc4d65a4e8a1d98
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
