Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A05CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D65160810;
	Tue, 13 Oct 2026 16:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kg6WrDhkFv2; Tue, 13 Oct 2026 16:44:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3F4CF607B7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909843;
	b=NMJUVI7cGUf27cjHlJN95HZnTjteAHiCSCxf0QfHyv0bcMUkmaNC4JpbMyKjA1ICZc6W
	 chkV8wQSxa6Xp8Taz8hOcyr8IXCgUUbKjfs0HDe7G4TtkGkswuw7dBIHJYPjsiLRwomkx
	 hz8rplXYYWsWrM8Rive37IXUzVN6M9seASzYNpYB01Cpk6B91vuTiHXUpkC33oWB8E4nN
	 gTKhf+iEkGhkxck7BqiN+RU3+ijwAt0uf1Kxvbm6ZBScCZ1cRzB7rYaMR73Dw4E/hkTzJ
	 oKlJnrZ2RgRuNySwMV3GttzyU2ruaUUpwb5Zt+xJwLN7AbRx69BYbTZmrjD8Htgbp8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909843;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JBoTjSX3MNX2J2zZH6Ke+WI0Z9FUESndQzPwxMb0qVI=;
	b=ICr7xyvNAEDYjzT7kBO9WLTDD5i4DKSwJ7u7s0+R3IugV5u9kToJp8xrWpYdiTXPThwP
	 miAXkNgOKIhedFNhHzyB+tTx6BQ8UMFBNvI/raUN7/Xb4hGXACb2mUTZys9Aml3XO7Rr0
	 yxZ4SR4J8/4eMGBgDcTCs1tzzy9APsmLhCvAd167G+5D57i/wpr/wlh+71NechNnRmgE6
	 OtQH+bl5GaImMqUua4db+fKFMzaTjFU1TNI0gDdF4d9UD+PzzU0hfVqzkN0n7rSFa2HMk
	 bZi4Xs78HQGfz9kA4zCvqHFNQRQPHsEmFfFvoGZDs0UQxXRrweK8JSpXRWZK6VKSdgw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909843;
	bh=JBoTjSX3MNX2J2zZH6Ke+WI0Z9FUESndQzPwxMb0qVI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Qna8lSs+XhX84syXuu4d+QO9wyM1TM8aearSul3G69cfVv53s7YjrmfdGuUzNEHB1
	 a1NI71uRKMAjiTkaQ9/zH072dChOs/oUWG1c2q07FtsBBpHijqKlKJgXKK+632wjib
	 3LXUWs9RWwDqsaUVcsCqx59VvO2e2J8VKxDb5bdJi/kaIa1AxEp3cT+hA+g94Xbr1J
	 cmza95bo58cNiWQ/SVHcU/PwcOUC4e3AAHljgubeLthVghaMivLPx0bEeKF8MUPEVV
	 U53YjFpzNx5zEVS1WDkQQ9jkxXNfnkM7X5gumOoXtln2AWZOn3StJUIw9vv201kgaC
	 kLfll347+chXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F4CF607B7;
	Tue, 13 Oct 2026 16:44:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFB671DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D196540049
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8H4XUZKcufdd for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F0D0C4007D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909836;
 b=BatDNApKHAyKPE+qB+lr82KaNFm82OGStbrMtw5ELvFVlaHQ5SAUEyPg01sKH1MQHyJs
 y7quvg4L2L4exAXHbK6gYH7AQFcU+AniGThASTGP8D0CmvuzXohZIUq87wPNN3MUTPQfK
 riG5f4+38KewCwRzSPDoGu/+7es+FnnzawVCZaTRMh8NjY3btQHDwCJ6otYPCZp4QMbV+
 p9NI04aWDyL+44A96pGtDe3l34gBWlh7+09rVQEqlfd3mkWxikeCfSVExoPi9m0eUXLtI
 i21RnU9ea8zkdziTrMZhwyt2Urq41OMFBw0EjZt5FPOcCUGbCBaqFwjmgqw3a/HvMkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909836;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=TLhpBuV9/qJfnqSmj8ZG2m3IW/tIg/gvX6gmZrMO9/U=;
 b=PlVQ2kBnUM3EGFvufmJhbnyi6mHN95ietNRXevlSt3W7Xi6QsOuyT+YpfxYqXJr8xkfQ
 Y399GKjokEijr1DdaY6FG8bXeQqS11g5EHJMroM3H5zFpTghx+f7XsBMXQOtT/zhn1rFU
 bx3aJcxf50Dmhl0sFSF9BP3tnzMiDAYf+o6swMx051x95F0jgxVJXIAwtGfJzgYm96eCj
 hvTx67786iGe9fvOCHw+fWVIrAivZSXxqbodF+ETgsYj5GOCQvj70Q4+FjGn6yaIw4Sxx
 7I9ake5TAttcJHaNS61tJN1Uhc9p01mUB8FS5CPDzCGqcpfmInfHofboBuhjNaUwE3w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PId7GQyr; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PId7GQyr
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0D0C4007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:55 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-451a49abd8aso2877703fac.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909835; x=1792514635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TLhpBuV9/qJfnqSmj8ZG2m3IW/tIg/gvX6gmZrMO9/U=;
 b=PId7GQyrLJA4/PXNw8pIdNFZzZ1+hjnla4oxZl5To7JIkqsli6icoHz4IC2waOqaIm
 h0TqxZAjmGAVhjXxJHl5eSZZsxIIoMz1OTtDaK7aP+VWmCwDwPl9eiBMGjQca4EIxj4Z
 Jrvp3O6WUvHRJUZnNxBRyXdx8qq2ExOoHp1AVivYjh9ipILaQGfekKKJAtGjPxoF6/cA
 6nD8kYMG8iM4/gNJikaVEn8J3k9JH71GODa3ymnaK5x9fqYcGWGjacuSMHvFDX7wg7wY
 qZyjC7IoEl0/t3/lw7UeX9KD2g9SWK8isK8NmpxDKlwxKjQf9OWxBXhG/tD75gJiBTWu
 92MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909835; x=1792514635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TLhpBuV9/qJfnqSmj8ZG2m3IW/tIg/gvX6gmZrMO9/U=;
 b=Z2U8BK4d2uON2+Z3eATpCe2bcBQsPfGFPTdA78DMDOzc/bbnYj8JyViSX9rzsGEowV
 b12Mqy8b2HB3C8onNbt1UWHvzPJSLuB+8yu62dbg4/p5ASojGo618OYIax1Q8V63Lu1Q
 Ow0yvFebf7FgASCak74lvSH13k1crfj4pyF7T8bZn+7Lurn1Xqr77S67pczL1FyoRic7
 A7cfQYMmGLMJhictFW6WTkeEX66bjpT7qv+dQVSRBShv15VzOmoIm2X5FXaFyC5k/GNk
 0aZ2eDUbr6Z4dtfC1d99FV4zi4Zwkoqlt0QXyP7VWa+RVAuS2vOOySn4EP/pEFcZ9KHF
 XLrA==
X-Gm-Message-State: AFq9FYKUmWzJX4T/q3dbQ2oWiHFO5IN9ZSGgBpa/ZgVdhc9aKcyQPxhX
 gVJkWJfz4Y9eTdlhXl50F4G+/JG00NOJaOPNH4IkZmD0ob7W0Dsm9LbHwPcPew==
X-Gm-Gg: AYBFou1X1mtzBONpAXt5XSeJ4QqcrARJyRteZKKVdmbteinM0NK+zNmowzj9lscmNym
 3LErYu9sRxY4vCndrLmAeIjE+EQwQmjajvB8rm1h3F3Zcx31wJ2ONsTAF71hznikC0H87T9+Uuw
 nBcQ01fLTQonF8n/8JNrXVzOtaC/Vb0/xId5E4y0ibn34QP2JYAryY147AtDt3dL6XekjEob3yD
 vMGJGn6tBRSkFG9WpJ37Ez+vCUVRoEhDgRu9js0qOjCU3KVzumDQGm2vRyRTUe+GbU959E7jCdf
 I/CABw+ZjS+7IUQSLE64rJ84l19LKP0rnbnGAANkmZ35uyAuscla9Ntqb5RC/gUE/Sl6HddrttX
 AoAkFyg0Qdzth6tMxc4wRwyyGbh8w/IsPRprXh6Cp0SA6jGp8JQXN8AhkU95nOYq9ec7OtuY6HH
 lEnQft9cWgTmhbJwKrQC8TNctWq3FTKhkIdJgc63egljzM59uoQ6ae/3t4LJcxPcVWhueTL3Xw7
 ETeIqd8fUB1kEnCgWblBkJXOiOp7l/eghdQyYyAHOn76sfgAFOVAS6eEXKeHtHk/xE1p0lMhQmt
 V41aVIbs+2ZqLuwkQiS/5zedYj59AfAHT1fgGhNgm1zZwLj46Cy9/q93U+ij713XG1wwbR/o2hN
 D3knuBsejJi5R9q528yEleYIZDSrm49jZfPHrYWj3CpbE
X-Received: by 2002:a05:6870:d14d:b0:48f:e0e5:a1f8 with SMTP id
 586e51a60fabf-4a2a8a993e4mr10197195fac.44.1791909834682; 
 Tue, 13 Oct 2026 09:43:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:22 -0600
Message-ID: <20261013164254.1476592-36-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-wcwidth: bump to version 0.9.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wcwidth/python-wcwidth.hash | 4 ++--
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index db635d2a1b..a0aa0d902a 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  326db5f3f49128f6b69d967ee633c44b  wcwidth-0.9.1.tar.gz
-sha256  5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be8459f27031bef0af5  wcwidth-0.9.1.tar.gz
+md5  114dfecbe7ccc3aced0243ce93b04daa  wcwidth-0.9.2.tar.gz
+sha256  ae0ef90b90f6af38b54f1fe6d58662ec33b3cb4b8391958a62416d654231727b  wcwidth-0.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 32acf28e93..260f150a58 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.9.1
+PYTHON_WCWIDTH_VERSION = 0.9.2
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/dc/ac/3a943d2792c9bb368aaa8b50121c0f778460ba2d7fbdc0a0366201d9e761
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/f0/b4/7830542634bb2d3e62aa3b586a72d5b3b6c91c3168929e7000ef3fed041d
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
