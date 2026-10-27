Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3C606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=U62N3ghQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=RPVGnmIb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71FA46068B;
	Tue, 27 Oct 2026 21:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 774vX1KOmxwg; Tue, 27 Oct 2026 21:06:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8CCA2606A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793135186;
	b=fWCljfaRnfsaMd4uJhcdZdm3mdio2uqT9gW1+JJi5qvr2nplEBm2UEq3nrnwFtKwUDQV
	 y0etwLypdx9X0jxSwtDiB5AHmHHkbs9f8eVeZ9V0f/rXKJAmeCFi1IhsVGg0H5ARtnHNd
	 iwFIep7GqqHvllsBt5C5n2Wa5JHAryOD1jox6X8PCPIq0UphvLaXVdhsAXEtULb2ZAcKP
	 fITY5OUOgcPRdXWdqeTo9HDL/qkazAyiD6YeYa2Hzw6JbwxX16JoiY0K37peeuHynSQd1
	 1eGqhjSeLC7H/eTzjxfn+8U8DJOr1fl7GxeR7ALIIPjWEpd9HeOKGvE2cIDxxuK4CAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793135186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MlNiHNOlpGFDM+saZEy4JOQitxgMbVxENF8VdPLsKa8=;
	b=TM2dqHfV5liDvaMFZO8Ifh7c3kLJQGo8VM5uVqAVG9N5ycvjrObXReqqeVr5MnEQrmR2
	 nTPZpYXpLPfpUYl3xlRRr9CGbiq/0pfEFkSV4idCfzqbW2Dk4RAiSQe1pdUyxWoSGQx2r
	 EGxarW3STUpZ3dZwOoeY69gYE6OngY0Jo57yzJDAjmafm/pXgyFFEkS+WgECeDyh12zOB
	 z9fQa89Jqm/YxZv+ZcxTx5LvCvVmInc9rfm6+vn3YpvpiSwqHJRFUEDaMW0upjJ2tJf/V
	 Aw//3nSuDXYT891giWJKk6eq9hn1KD+gILOq5xMAcPrsPu+Mufvw1+jT+TRyEXJzQ6g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793135186;
	bh=MlNiHNOlpGFDM+saZEy4JOQitxgMbVxENF8VdPLsKa8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=U62N3ghQvSMvN2o+UWJubGdpnCyykBO+oHlSR4t+VFL0O5D8+4OBq8fyXMAtaMivC
	 Cg5WtY/98OtWRCTqPehv0D8qtkTddXX8FqdrmitmzNZIku3Oz/sWLM+HN5tWcu0AIf
	 1vUv5Pv2+b2epLReeg8D4LaZpXWVt8HpfPultktOQeKbFteTpkHIjpgrojYx2bT4nF
	 8Ta3dsMmxEtnfT66qmHMGj3Gpq6dkIp64BL2h4CB6IZD0uh9dYmM1KNxDpEqZGY0nQ
	 L4joPTomIyd9ORs9xNCEevatcD390ljtSBKnod7MDzS5Gl62n+fet6zVO/e/dMCZ81
	 pRox7qHz6tW0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CCA2606A0;
	Tue, 27 Oct 2026 21:06:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CEF24D1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 21:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2275080A4A
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 21:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJGukpp9UP3N for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 21:06:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F3DE280898
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793135184;
 b=BvUNKHz7jWtZRFtWzjZZxo0PEvpqzLUFYBDYGZauVgIMiT4nZblJYJcK1IT9taKIqqQ3
 m59nkMF09cLLnxh4LrYWarhEn9VCStCT0cMHg6dVV2k9h4N+WZDfJQ6L425biMoUDfd3a
 ueZqn38hlbBF4pbATusJ/3idCFS1jxht6e/sDFnzItjIjHAg659rpsUNtX8BI/Y4worz7
 m2ROPr6KIgOKZ7w9HVfmCmKgg8K+WW9pqKpC2eHybtRlL9DSkUOL1uAjC7AXQFeoF57IU
 L75Zw64XJ0IBGbb2XWY7Z1RAtRCF3WPGVJHypTvsIUuCllx/ZCF2wp5nliTyzuDT1oQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793135184;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=H1vWuBVJpvGT9KQ6rhETg7d+NXui4yVoiFlOq/okMFc=;
 b=OcqUS00ZqbaHKbT9Dg/tzNEWmKIJZScikCF2dh3NCICrXQKx9nO9Dh/8lImPXv5v+GKn
 jSYaCQpd2w94K5vRLkAyGw1VrJsoAH0fRvz98TAW9VAFELSujVTdhvjfyE4HSR7jtrCvo
 C78aHq+ELWw6ZX1cVeSDAAf/onuEoG5Cy3QxrpRQQ4J3zXHlIgCwdAhiceWvZOBbpbErI
 v6Dox2KMbomQ00vvHCiiYBMolZkeP71ZxXap7Jz2VGot7vF4pxmES/9ILWHLNHM7Rt9KV
 8ypurvu5jY4PC0pUXpgIW1yATwiFA4rvBGcdSdP7VL4FB+4SHIjGSFvwuTh1/TxRW2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=RPVGnmIb; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=RPVGnmIb
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3DE280898
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 21:06:23 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b1dae0febeso500375a12.2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793135182; x=1793739982; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=H1vWuBVJpvGT9KQ6rhETg7d+NXui4yVoiFlOq/okMFc=;
 b=RPVGnmIb3OKTY+Qoj1tW5yTuYD+Fk2hsB5wMPoyGSatWqdWyveKbiz6IaAr4HJXiu6
 yAG9pVNVnUCmoFhYLrmMwi+bT6n5HHU9L/TkZ6NH7MB+SuqSmB/HQcnOI6E4uu5Xa/cy
 gpBmcAoWk18Z/b/B9A4a4YRP3swCHy++e659l74wZDs9Jm6yGnKrrOlDwPqlPthgNS6m
 0pll3I/9Mxu0NJ73WAK7Bi8zYIew/dmTZIGrOvWAL10GgcbG9V2t6xuvTe92MhoKE49A
 5+cPoWBYXG5sVNtZRirKIB07m+00V70vQiKi0b8BoyDIqTwcD+lcdWLirDr0xrWnSh9V
 5LOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793135182; x=1793739982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H1vWuBVJpvGT9KQ6rhETg7d+NXui4yVoiFlOq/okMFc=;
 b=aaULBmthWsCcnqxxilGjt4ZeIW03+hLXA6KofiwPgrlXej7ukTKmy7MBnAbV4d5rOm
 5pPCZJRbiO+z8TzWuIkby9pSN7vPcQbVkN4etXkF3T3mc3DNuqqpMKcnJ6rLSTL4SnvZ
 KOZWngZrzBh+aG2H+YAtEueop7s2AhydPKTztLXWAJf33Gg8tg6gLCnFp6G0RxKwSxyI
 whcQwHx1Kt7MKrfiNy3DqjD2kOpiv/GRQuGE1MIs5KQ2n8piJtbZ3TWoqMlxerTfZbDu
 ejlHs+Pt+IVoUUmsxJledCbWM6MO1Q2DcnO/hfpBOVc64yrtfFXYX2PKFCSEFLQGML2H
 2QEw==
X-Gm-Message-State: AFq9FYIJVfZzXoqG0S1/YuZ5VR3LcIYrjJZgH2gsMTFKKl3Gxrz33VzQ
 KLa1DQc6m5s5ItvtZgi5KTeSGvnw1kvOd/c/wvqQC4po/MCANFxoNrRrlUSCHg==
X-Gm-Gg: AYBFou0OcXqOW1XUlwmkYEXaUBpmydRNJBGp5hjsAu2NDg9B8C9vdivvIWta6sciQ/p
 9ep0I9AoDQMtQKbseyF1KTnIomnNDogehGtGNuJWECftV4J4u746epqjqmDdnD229D3U/MkO3wV
 4BhSSAU5LYDj+2m/2nsvjfqhJ8BJyw5n4IZmfZonHSOiUZ7FgrAKgPXo9rVrBATwDnzL++8i7FY
 Td8LHfzJ9p+saJzPWIzD05P5KkwGzx0F1HKQfzZYPMwINCF4zDHTQkHvA1sdABcPBhY3wMi2uJb
 ZbEKJZK3W5O+rl+1LMbx9K53B72FXqh+hsjo4zXazr1KMAHi40EQrSYo3RUgLMMUTPgHRreLDW3
 FfJx0vOZ5WNV7ZDIQnTnoKkXaWE0GN7sjosgn9S59EmJneuUlrPQcYCBv0qpPvtvmfqN3C5Nf9v
 Xg9u8GHrRRnHe/gUKtz3TPK8v6giVsHhc+aPFpCANTEBUnlBEDvJ/u0R3azi7gElOdMTV4ZzZRO
 PzcpcN1Pw1gn0998VYpzcJnNqMj/t9JdGmuVRcp7a0x7gpE1HEGns7BRQMnDfH+Hs+FYUWuyiXJ
 XXQv3aOsZNRfy0dXXSq9QUiMGOacGr5seF0=
X-Received: by 2002:a05:6402:27c9:b0:6b1:dd07:8e64 with SMTP id
 4fb4d7f45d1cf-6b49cb4f99cmr117969a12.5.1793135181676; 
 Tue, 27 Oct 2026 14:06:21 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4964601f2sm544651a12.37.2026.10.27.14.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 14:06:21 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 22:06:20 +0100
Message-Id: <20261027210620.2197343-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/bird: update download site
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The BIRD project moved to https://bird.nic.cz/, and the old download
location now returns 403 Forbidden:

HTTP ERROR response 403 Forbidden [https://bird.network.cz/download/bird-2.15.1.tar.gz]

The new "Get BIRD" page links to https://bird.nic.cz/download/, which
redirects older releases to https://pkg.labs.nic.cz/archive/bird/. The
tarball is identical (same sha256), so just update BIRD_SITE, and the
URL in the help text.

This is not caused by a Buildroot commit: the package has downloaded
from bird.network.cz since it was added, and all maintenance branches
use the same version and URL, so this should be backported to all of
them.

Fixes:
https://autobuild.buildroot.org/results/4406a09011725469abee4c3b83729a457a244aa6

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/bird/Config.in | 2 +-
 package/bird/bird.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index 5e32194c2f..dd957a6de6 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_BIRD
 	  use configuration interface and powerful route filtering
 	  language
 
-	  http://bird.network.cz/
+	  https://bird.nic.cz/
 
 if BR2_PACKAGE_BIRD
 
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 34d7912954..c4cc620b82 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BIRD_VERSION = 2.15.1
-BIRD_SITE = https://bird.network.cz/download
+BIRD_SITE = https://bird.nic.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
 BIRD_CPE_ID_VENDOR = nic
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
