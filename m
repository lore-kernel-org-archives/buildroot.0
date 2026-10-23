Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C077606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=U5fe52lb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mrMDx8VN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 787A481540;
	Fri, 23 Oct 2026 18:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5tlEOXUUMv7; Fri, 23 Oct 2026 18:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77C6B81384
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779534;
	b=ig/GCQiQMdjG4vd/vhM9wZJ/1Hk9vLLH7I/uYD9flaKIBNhJ0a/bB4w6lVzrn3n5jN/7
	 Fv9GADekpW0qv0a1AXR6Xvlz/peFWFPzv6iFTLGTBZLWHjfxZAJsDLm1BRKejnssehxEF
	 v9O3j5kFV4IjK2U8rvH11Uf1xs+Ubit/blcnPWY1JPQv+0k5ZezDcpm/auGKVQEofIldb
	 CzHUzUSQNrXQDuQ+7NzF6ztQoPzWWY7Cb3utD2jWjuJ2WUm3LfveyRgHcWf0qIMpkE4wx
	 y4+PHU70rUf6utBxP4L7gK54uhCzgAbkClNK57RudygdWjb+0DBUcXbv9Q72psb9FSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779534;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=coRuuIY4y4NdWWWvPT0X6UzDV2HtDXNT564wXRHyVY4=;
	b=jHYcl12b0jtvTu3SO2x16dSaMVvoNoq30W00DOS9QN4vIimfa1Jv8V94BYJj98hF+Ygr
	 s4xG3utcnGfRUxBN17H4fU99oT0g0luGTkCJMvdok9NKfzHg1HAKTSU9j4hI4ywfI7ozC
	 FCijL9UbE2VpxZVO23vCDiIDAs3+61dWCvBtI/iPZlIDvpvcOWQYhMxl+JpUhMX7UMwx/
	 aOAQdu0GF7YC8qmgxrLSbEKWjgpMES6OqPajpV1MuqlibzY+6g2JGQICd8rfobv9MYs2g
	 TzLcELeHFCn7LS9mzHvp783LTjzwsNo/7wGgvRwxvQHgvUhX0lwDVhv9mcOASSMXyUw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779534;
	bh=coRuuIY4y4NdWWWvPT0X6UzDV2HtDXNT564wXRHyVY4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=U5fe52lbsBVnsmr/KENv5tIZsnSfSXNl588i0MFIbCuWWRVxz5rBgaOc6y37x4Dx4
	 n+uOPeWWl47aJFg8aRqEOuDge/UEOe3LzOd/ozN12MzFClzTecL8ZfgbnHDhWwCq/1
	 mjxCmH6ntwTlUERgAxYo60hvXz+9/5Rl219RfmqeU6hCLq3r9fE6ZTxR56QFHZABr5
	 FFDGaT4+B4iQM0nH+5kzsKNQLLkWXiXgDpEVlgFGJvS+Gna8XKtae3nE358Hf54Q3V
	 hhVpzKbc95ttbYT/Ag4yE+FOYAEEoYPrZI/wgVdql6PBYhbHwksOXht7WszfKlvJ8f
	 nibVuGIAGqH6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C6B81384;
	Fri, 23 Oct 2026 18:18:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D849C70E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE7EE403FB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tgVl29aNcbe for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C5A1B403B5
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779525;
 b=n/yRwa6fxHPQlKbi4eCbGoT6HXI70iKXCfaZu6tJ5yo+/ubkXggRi8UvNZqT6c720FZl
 bX+bCg20/FdqJ7NlIrfDLwDto3Iv2hKw7xWHUQgc3bj2+kcCFvRi8qZkxD7/XhGvP4R5M
 VILAEHhK7y1Z4jjc+sWKOEM0YKNApfGTZPgTThzNGEE+Xk8kWXhQ8DDWkbak2XWOHEPzQ
 vgBeErihbj/dg27XJjLrBKx7KvToNmCyb3LJc3YpxStASUvj2BuJRENPP88rtg6Em5tAR
 vvXLwU1Vj2xoAOi+Sc2B2hw/LVu7s9Eg0pFWnwbeYYTPn1iwOt0KwoMsMRrzoprEh/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779525;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=us6SoDCsESC4Bxqw6pkFtuEtKeTWO0jmYH4H9sIMxGQ=;
 b=iYgcl6MO5Tl9BXpzB8NVX92AB0q+105eCO4lPMxf5zePcAHPbWvIOwKV+8qEy4nvVNvN
 /om4bGemdFl8OQ/7jvSzJAQT6TuK7EDN+mfi1L99TYw5zV9XpxBgFXFB4xLlQSD3UBUoy
 K1wER/WxW/WY2dnb9QrnAA15t6+35x2upqEBsIJOy4A8Mx11BL6FOzAHpFRXd4f+wcNuX
 sNsQ2v98nkiuMDRMNaOURH311ei+Z+eh3rSlXBO2VbYWX8pRRQvyNHBVfGyYR6ctE1ZrY
 VweR8EJGDozbg/rqRuft5Foz/theV4Hf2ofn8c/2OlWanPn2OeMlI2HCYrMI9Qcp0+Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mrMDx8VN; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mrMDx8VN
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5A1B403B5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:44 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6f74f6b46abso581179eaf.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779523; x=1793384323; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=us6SoDCsESC4Bxqw6pkFtuEtKeTWO0jmYH4H9sIMxGQ=;
 b=mrMDx8VNyaFXSzO30XcnBJtsQ5h4hoWl1y3DZ/RG7HO8tWsVtFbWXaR6iDmJ4/zIW8
 9TO0KfF33TSLh1dkr50a89KAjrt73cEQXMaHVlvkm2rcnOyTpvhWYVWzs+zN8XF8V9y7
 mKE8FqMZBiuCve/NFQpW0+KY9o7evnnAoU8pTFxjDAXMb37j4xxjhNBba9NtcjMk571x
 bTTirFNN7cGCSRp2U8USUn5n90PinEHvqvr4VtegIRtHo3m5iGgy+7+bxaG8lUBu6YsI
 gcgouV+/ODN5lADlxwP/yPNcK1My5BmjpVaQKa1fJF1V4iH8evcEfBemSsXy3D/Jxx2t
 fi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779523; x=1793384323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=us6SoDCsESC4Bxqw6pkFtuEtKeTWO0jmYH4H9sIMxGQ=;
 b=LlFKoOcIcL4ZxqWumnLUKWWPbK13BeiL/Eyp4pTdC/+j83IyAZnc+1f5gWxYjhOomj
 9Ot6x8ZEEUkXhjrInTkZNuXm6HeR6bGA78dDxX0ZU9w4GdmLbVPwEUztYXhDPX9ExLJB
 ZhkiPKC9c2FLwBTwQ7AfLv72mn6CkeaCsdgGnLhMuyVYtn18XauLKO3RcJGbiPrmRAAh
 KbnMmCGMnKLvLkn6YdnXHtKWOfQgsgEcLNwgliqUkrO2+TY2r9sEo7PmTIBPyRsVHrp+
 d4uuovhCpUYL87K4LeuzozEPNPxicRGbCYdnYBkueq/izTXdqFOUw0ZUqgEccIlThbub
 Z6mg==
X-Gm-Message-State: AFq9FYIaxEIbUSD/Cx0vHCxazket+gGlGH9zdEZCR8j/2mOYXKAXTH2g
 R3fzAD/bJEfkHUnshMdNITVTn/6LCNClE+0mXX8z7AHN/aOz4yyTGq731QOUlw==
X-Gm-Gg: AYBFou0ujxw0DmnQC6sQH972uDLzA/JeSa4TtDPvpoUT28uVyyXxc0+1jAp6H8fWW79
 qUvn60mPxErjhxcVDJHZYemPbBwNdHRPvCrZ0asl4nX1YOjQ1mdMnNtWOE4uQVSf9MJTWHpfCMz
 wMQ1Z9zskzTAtM/hINPYoXb5CBLVcn4DlJFckdk7dmTumTYe/4vqHiNfkySRdgGvu4aCvQsKKBU
 Qn9wKoqdG+PVUGIVhZZqaDXtf37nSZX4ooR1QhJ76cAQCH6YVA8UDDrbScnADk44V7J3PA3Y79+
 +A298aDTkemPGlfhpFE6/zY/RO4jDc3jTRLoqW2Rx4/xTNXiHWXoO/pkrBlDOnGt6/U4OOOGoWR
 RZhqpbSzddaoyyj8ImO5Grg6vN2eYEfFOPILej8brljahx5fDMN7D5v9iE6qRk1Xz3rsJz7po1V
 VER0ReT8RGY7KPJhfk7G3Pv9LRqbh2Ww7jyQuy6LMQ1Xm7wQ/4aWOXGPAWUOeV08lmdAIU/EqZx
 79+0xsLxdsidi9fPSvPzdRJBpZiOgj/96hrbSgcPt52heUoCLuDge23O6cCTiP5OUlD3JaXb2iH
 scrdcqN9fSenolvrv71weX20JVCiuMKpt8ZBAyKi2uZudWEVoB35bwb5ilNmFIT0qTxG3Z4QTIi
 FQZzBfFoG8Z0LDqOZ9laik/GZYZCK2cYmINEsdRWYWnMgMI+2jRGhv/gylSo5AN1pbowr9G+i9m
 U9EYeX299IMQcTKLoL1FFai/w=
X-Received: by 2002:a05:6820:6fd3:b0:709:d804:88e2 with SMTP id
 006d021491bc7-70b88a94c02mr1799848eaf.77.1792779523237; 
 Fri, 23 Oct 2026 11:18:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:32 -0600
Message-ID: <20261023181818.920329-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pycares: bump to version 5.2.1
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
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 14583b122a..6da3a0a6c3 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  b326db41b14da39ba62344fc6ec799cd  pycares-5.2.0.tar.gz
-sha256  90ea74fe26593d2c4e79e1ac4dcdff4a2434b183ec6feef0524e4874a7d307ef  pycares-5.2.0.tar.gz
+md5  ff8d5334568ee3d563836691a1cb3c6c  pycares-5.2.1.tar.gz
+sha256  3e89edc56a3745046676207958bf3dbf2971c5df0d64de9f7a893eba8bf255b4  pycares-5.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 555f2e969e..0cc1cf586e 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 5.2.0
+PYTHON_PYCARES_VERSION = 5.2.1
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/e1/16/66c5e0498934011d36887d69ce116e347253399d06931a6ca900c7cc0899
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/c9/f3/4df974f2f902fdcec81087773f37eaedc7c8308291fb3f15da7ff21a5b88
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
