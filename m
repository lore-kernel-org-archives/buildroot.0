Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F267606A31C
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 18:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ml926yM+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zf0pSXcG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B9A40683;
	Sat, 31 Oct 2026 18:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiY9uBEDbknF; Sat, 31 Oct 2026 18:07:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CCC3840699
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793470039;
	b=ew8LVbTPe3JZWZ+ERAwJhIzQHasjJ2Pzi8gZyJlH7y6SGQVn8TfLr7+htL1CX1FNA+uQ
	 cUOZXm/IL2R61tuOa9awCAOZwd8IZcrWJdfDobKtnZ2eXZlfjTSAoptiIRPS4z5sEH+KS
	 SjvP54No0fftZe7nVobaqJR66Qy80+NVava8mjJbOqWEn/Ib8qyhX50gFNByjy7tNkprJ
	 B+IA8wQxaugz9eSrOsPvYTxe/vuSPg6NI6cLbEgRa/xCftaBYMh8ENbJN+8Zx4pND4No9
	 8fTnZ4bK9Un1f34n3hPcI/tmeN2Q9gUIaFiXosGGTt7OLI7v+y5onQGjjG2DRv31j2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793470039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3x5AVwTe15R/6/raGT2r+XgelEPTSZKX/PLulRcMWyo=;
	b=iW61CJRXga/qKrFZyEg40UmKOA+gA1OR+DA2n3nxBHI59htbgFaa7mkvGcL9ofqS/5YB
	 LcPHTEprhzfq8mcKG1fAKHKJs5ltn9zHlyIAgnO+kx6iC4k8UX7duTnDaxjDhq3ucpoQz
	 rwb0A6IK2T7mwA7UEr23t4jOIrpR2cAcX8V0iWSI36H9EkFNvPBRwrdZQuCbrQ+VFoU+J
	 SKJ5IDN5RNupvkV8JCnCTSEkKI4ejuFvGgJGoB82+OGLs5uic9gxlkG6+yT+eGpiHFQgT
	 MXdvHY1jcOP654pVOEZFWPuSfCfy0ddLrW6oM+WZFr+LhxTQA/77arcSUJy5db59+Lw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zf0pSXcG;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793470039;
	bh=3x5AVwTe15R/6/raGT2r+XgelEPTSZKX/PLulRcMWyo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ml926yM+OI4V493FDA+og1jXo8A6gNMpRjLi1VH/ncD0lr5Haerva2/F5PUSvp1aA
	 nYgiUJPmR6I0135RHVvPukzkGd4CfoUk4sVV+sjBjejbOb7LfKfRaCpXz+wp0Mz6rZ
	 c8zy3x10SZSg0HtQdYjN6SeiaNVCsJA28JSlc3uajvXhGt8Q72r6l0nZu1gGhsiIE3
	 s2LBsFELBhIyAikPb2PSPCBBPdRrqeRZZbUELxDIE4LRtVBpjhydqzvrSQCf3h/uCz
	 rE9H1ys9JecPKHbsNv0KJXZxaWTS+QU2viAj7T5Q5OJc20r31WhQ25vJN9Ry/uGy/x
	 sAt5eqIWebvoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC3840699;
	Sat, 31 Oct 2026 18:07:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63CF64E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 493AF40699
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66BXKPcWERA8 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 18:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6348240683
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793470037;
 b=DpFfyyEpV2u6u07x8QZwL+4vBPIKMwDYVN8lrHdSQEUgRkLoyHQ5MMM/NXGrlZeA0Uja
 He/NG2lx5SbfC4A8sCCm6800pCjStfuGhqs9RrcT4v/4+4aDxCnyrekXwzFIu9+f2JsF9
 oiTkOfeyElk5WpwJwgdaSV013YLAuCaDCor6OjjhDnSkGDYSU0QVB2ouR2POltmP5sfOQ
 UBA5ER7m/tF/sTkpUnEDa2OUrLphr3uFsoXlskODy0x4iko1NZ4xp7eX+ZeRLTSPqQXn0
 PJ1k9MEua//3BfSeRX2ozwHsRpjzQVZkrexeJQTtqqW8WA1vAeR7UZAX84fdDWmaAfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793470037;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=do16IWyLPVwisHVYy8etAUHzZZ4Jn2mRdqRCWw0BXd8=;
 b=I7e1BWUrV5IckfKTWiUdDymHqaD7iMKqUcPyXX6snBUkWN88ySVQjGIAV6oAyBJSE7cw
 +FneGTEHt+L5h3sTV8M2o5kgRlBnLuD33kKfBvO8JpLy3vu4La4Ii7fywHxo+27ridBbQ
 Pq1phw7aBtzmH363UOSdyKzBWa01P4yS/Mnuzd17KoOZZpf0uT44mUj2903Pdn7ZLRzqA
 MQVxmspAfiSVM7iCMby3YIM2MFjsNo4iM8MxvqOeVlL9psvl+X4NmJz+cARXjxr+lm4m/
 BJnpdgV5byyzlZbQPBSK4l0zC0PfL+VGf5DBvoaEaql3O6KlhV0dAXkfqLGpF3q822Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=zf0pSXcG; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=zf0pSXcG
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6348240683
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:07:17 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-6b19e291cc6so1769141eaf.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 11:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793470036; x=1794074836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=do16IWyLPVwisHVYy8etAUHzZZ4Jn2mRdqRCWw0BXd8=;
 b=zf0pSXcGzfEWadfYpMPNdvXPRoJaydK/A4+o5rQwuiGz/0QktHQ8NvYE4SvU192reK
 E5La5PTpH/wnuLUrYQDAwopZkmgC5sYAedxl6tZzc4B6U8oVEpfBCRBLvV/1ihpqHaze
 buz1UecClaxmlleFOHlXZ9/8Tz/VU11o37/JzBK0GOd3USbUcn5QVOad7bVv2vdhsC6i
 SUqezFWMIzpZosLmNUTh9t6/IhygbRPrS+a7aHg7OaQ6cOf4im4bEi2AjhmlV035Vqpg
 n1h0XFPH0Q5RYMoyn4QawCWhBS+UN/MO0pOzNcTaDqG0Uv7eSKAhJ+z1Y6kCuG5kS3QR
 KLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793470036; x=1794074836;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=do16IWyLPVwisHVYy8etAUHzZZ4Jn2mRdqRCWw0BXd8=;
 b=FgxZDJU8hK0rOEKrrILlwquGG1ZxLHonkmTsvcO7BCRL+YbSGUY0iXkFPvI1pb+B2j
 r+kLy1o0WO/4JE15jgFJYzH8rEhS6bjVUxI9KF/MD2jDIqgGhN1Qw9dutPGR5PFSo7CN
 OqNtvCO8C44OBbXtP9EM/WWbUIhfRFNXLl+rVljoVeZAaQ3JR2LhUsosh+FeF36S8I4y
 MXJvUYNBR9E/a38FlL3xx3xpMN08PHqe0v2htjaNNvvR7ghJ5KQu1CiqMy6HW3/ldPgw
 vujOoFpZCGjS1NZwba83fvV3CXJpeL0M3AF+tz2aSmaH56YrnmtO6dAHltefxd5KSJrp
 DtCQ==
X-Gm-Message-State: AFq9FYKa902gsehpgRfusVU2vaj7tkCHUIXyW2Osb9+VQ1Ibli9Mj81O
 MZWQ+LWe2w1bvMdPEj3GAxGjjuQY++IbcwUG9f0DEwVLr34oT818zu8wMUvPbw==
X-Gm-Gg: AYBFou1RafCwBGZdstK2z+hRUmR6x+bkZOHPdy82dA1FFVeI4Wta0+D4Z5aAyaJyJnu
 7s+JnB46Dacm+jYIHSThWNDbTsigoA/Qcb5ayI34Gfy+wMPUIf5UAu9NWlMS5Thz83Ih+xpdtMg
 bx7kdRWUV7VFC7wlTS5DwzKSGAOqZq1dmfBMFLhygFfSciuBJvy1lgXx4pFnGb9dkhoPzvitHEG
 amLRJ/4S1LCDprpcw1m5b3kBdWccKjMDgeTKT55+MKrJNpkzN8ISguecJyjhYZr4yzDr7SAzw2F
 dcOy/43195g5oLBFgvQktGsgHZmbzPoEOusIqbF74JSwuVbJdjxMHGVKKlgmfn4C1RX14Zq/1CO
 Ojcr2DhDptvjh/OlykF8zAy171NIh8F7KtcGcP38WzENUlyCiY1URZ8Mix9+103axV92uZe2eJz
 BpnL5l9vbK/+/mxdCJ2PjXcy5C1akDYjDCOtSuadwR/YR2MK/GP1gQq/Nbgga06fQFxBlP6yqtm
 U+WwLm7H5rqej4YOvA1CJidhQqRmqhxOYYNeyEVXcB7ttoWW2n8WJ6KiXzYBbuY/keH3qu1Ke1j
 2hLhDx7d6GsseW7HAkFYz8Me+/Rx/v74wReGNw90FYbgsdUNLfpg/QLFYs1PN++PXzsQzLco+OF
 blUfpYEZXbjNz9Cr+w8oD40k572ALultxj0IoeMzEMgV7szX7CJ/ZOm9zBiXPu39MoOoWHj9iYI
 aTvqhuJlEpjQN+xzcA9t12zMQJEQhW42S0mr9SS6fQo+W9aFcXELZctoQU5RWSMu6k4MUn56ut
X-Received: by 2002:a05:6820:1387:b0:6f8:ab9c:344b with SMTP id
 006d021491bc7-714f290e6d3mr3482809eaf.28.1793470036017; 
 Sat, 31 Oct 2026 11:07:16 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-714f2a84854sm4935744eaf.2.2026.10.31.11.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 11:07:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 12:07:10 -0600
Message-ID: <20261031180711.2738509-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-grpcio: bump to version
 1.85.1
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index c230f68918..dc3c9edf65 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  1c5d46ea8d18b15a69b59a4f9dcd70e9  grpcio-1.84.1.tar.gz
-sha256  446e7876b9b991fa124c1d414899fa7cf95f89a3e71237ea0161863dc0b2c09f  grpcio-1.84.1.tar.gz
+md5  377e93eb40a0f013f7a892f18a319710  grpcio-1.85.1.tar.gz
+sha256  5f530287d5de5f7f66089ead81de44f6787162944dab3922efa65dfdff108a1d  grpcio-1.85.1.tar.gz
 # Locally computed sha256 checksums
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index fcd6503199..9a2e1a2103 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.84.1
+PYTHON_GRPCIO_VERSION = 1.85.1
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/c0/3a/5c8e0eea2af3d30cb20d33ac325a98d9b799c069d63101ca4da20bcc776a
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/f0/03/f9e805772d4d01da2a1754a5f63c58601eacaf8f1e878729217188de7d16
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
