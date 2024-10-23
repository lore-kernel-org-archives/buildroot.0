Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1610D0BB46
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 00:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CFE081088;
	Thu, 24 Oct 2024 00:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05iUxOixaFfp; Wed, 23 Oct 2024 23:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DFE081089
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DFE081089;
	Wed, 23 Oct 2024 23:59:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFA4C27ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 23:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F41740544
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 23:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ou-1gWzpSxQs for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 23:59:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83F8040520
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F8040520
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83F8040520
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 23:59:56 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83a9ca86049so13842939f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729727995; x=1730332795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cAqpsnBoUQ67W6UePKy+Ir91eMIiHKEW7/jdRPjn/QE=;
 b=hEfQBoQ0KFpziXV8bn16tsaFRTXDQRmOD404nZEWSmbWvdjVX7/zWcqOGs0b7XQoPR
 STv68Qx9uwqgCq8wuwykasg3aoKKj9cxJ0RaDq28z8ki7EMuemqkBFbwA2DRq0GOiAIT
 honthwtR07pP3B0247r/LxxhbjHwAObJF+g+Rb4XUqPtJueTj36w+Ru7b4GI35o26qEy
 YSmjs6Nw2jZMl/S2CYg1OuQV0mUT2KsaeSWhLrUnyurThVbDVtBb7moErEI1M/YzLkfj
 YugAtjXlIhjGHCRQYnnosvhQHoq+7FGvXHqjfYLnW0WK4oRNpdK+vqK9QmF/If7yXzWn
 M5eQ==
X-Gm-Message-State: AOJu0YwF+T9Ts2Mqv+NEYu1kwlsXO99lj1hyGJEp5gDlsthk9A1J38sd
 WCHRxefxR4uGxU22Nt7tz7wF0TBddiIH8m07ZARDHInjbU9uPPApZeqm/Q==
X-Google-Smtp-Source: AGHT+IGDCcbYVhyU8GifKCEv24Bp2qvH0E2RVZM6GgACflwgNTThmjvg7AjjKddvG4A0kDBS5Cflqw==
X-Received: by 2002:a05:6602:14c6:b0:835:4d27:edf6 with SMTP id
 ca18e2360f4ac-83b04030199mr23154039f.7.1729727995193; 
 Wed, 23 Oct 2024 16:59:55 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83ad1c6474fsm254264139f.24.2024.10.23.16.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 16:59:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 17:59:52 -0600
Message-Id: <20241023235952.3352400-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729727995; x=1730332795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cAqpsnBoUQ67W6UePKy+Ir91eMIiHKEW7/jdRPjn/QE=;
 b=g0IeOzDEZ2drAlB/S1KfxrG5uBqjfxRIhu+AopSH+i4q0w257n7cHvpF+1e172Kh8h
 PXG0jj1s2QZLCozsKGSJ9LFsbewjQo5SAyYD8sYXtoAXjL5s4VCOGaB7CkBFdMQqvDj4
 R7yl0mqH2Q3sCqQNpRJEuOZK0lnw3pvjNRfwi3EbSJItH8VLk1Cr+vKigXtUvCx/vytu
 O9jxLgQbRK+Hj0c24f6pe/Md4hX26xjKT+TUwYvEcjucYiOtPIWUBNu9x3bGufz8bJhi
 EURccnFOY6R4wkdJdY+myOfwSGfaI1khx+VFkhqZInaMgWXjCcbRkYf9bSPiXcn+z2pg
 uG6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g0IeOzDE
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: use hatch setup
 type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-argon2-cffi/python-argon2-cffi.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index 238271f5f7..13559075b2 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -7,11 +7,10 @@
 PYTHON_ARGON2_CFFI_VERSION = 23.1.0
 PYTHON_ARGON2_CFFI_SOURCE = argon2_cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
 PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/31/fa/57ec2c6d16ecd2ba0cf15f3c7d1c3c2e7b5fcb83555ff56d7ab10888ec8f
-PYTHON_ARGON2_CFFI_SETUP_TYPE = pep517
+PYTHON_ARGON2_CFFI_SETUP_TYPE = hatch
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
 PYTHON_ARGON2_CFFI_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
