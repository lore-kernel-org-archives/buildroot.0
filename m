Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028E6C79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 12:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77EDB406DF;
	Wed,  9 Sep 2026 12:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCKf1GPdRrhf; Wed,  9 Sep 2026 12:35:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 771C6406E1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788957307;
	b=Y2TIfQjQdk/4bwXuvBGvUJuld4oX1GbuUZsFaRyRWbQ9Ft8pr+L7e/0pRKHiXZqabJDt
	 hwKUDx8PYakzOghK0kgDJ6x9Mnidr16vfRCABhSZmMLHv/5MT1BQdidfdHod03dqgGAML
	 quEwmldeTsboV344sq8CaWU8gucw+jAUexs3Z7acgozV9fA449notW4jwn1FLf5TjmRR1
	 SbtAbrHMHUU6ZqZZcMAORIfO+aBTHq919aNWuHMZ9c4dnop96wy9DEenLnsfxSjmRHNPK
	 GEb5K1McGZAwyfFGeTooPurdEAsUy6SvNsBEG5tpdxy7GTqM5nxyhbW5j8/ZelZpasg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788957307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RPm5XzlXK8zKVcEOiqtVDowYQFkvZBEvRqgTM9tMtT0=;
	b=sjOn/MfJNRUme0kaASsl7cmHPCAZkFUp5WFF9fIwkN7az/JFPk364jZlzHCMBJJZ7V9h
	 mA7RaAnB0rrLWYNTb8S7iRnekh+PkNLaSj9Vz058NEQVTxB64NgYF9Et5WT1EOWB67xAN
	 D3zCQOQLfbFhOP1FS6FmPQlpRUNOpAasnO+4/qhBSP+RKxZXTr3gZ8I0HoL9iv+k9eS5M
	 rHFxT8m4AxSVqWUtjvCCGleRRnp/8MXcJit++81bYIMDFpdw5j1Lh82bTIvBksZkn4T3q
	 bvEakBoe5AZS/mOkYXUdOJSMNrWGT7LJjJfyW6PL+I36CT1/wHEUjRZVKAz0ZFDFRtA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788957307;
	bh=RPm5XzlXK8zKVcEOiqtVDowYQFkvZBEvRqgTM9tMtT0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=TQW740kjzgwGyZ4WXaS6hz27obNJvHMnR2KOuIXnNiYEQNP1pwSdm4iioYPeWXqTd
	 5WP8KnW0+WyMuHKI9XXhTnpQWgXi9vxWUy5Sj8jGAbazTUqJpxy2gVrUkK7mUA1nRu
	 0WhE02/R9gkOX0rMpeKC7E4ijwBlYBdIOwh4vwZZx/yRXw0LfDtuLwpCLvVPTqdAvU
	 9I3e2itS6lVgD+P47bWZThfvlIJAB0jR8isd2aCOkAel3pyG0xfi49gnE0eKF8O+7z
	 OktYRk9cqMqNqgHx1FqwoUDZMY82TCm8DU+0I22w2HbyLdp5Irpm80f8EaowZ/crRw
	 ckmYk+L//39wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771C6406E1;
	Wed,  9 Sep 2026 12:35:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1F602E3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F63940085
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_Alc4L5RqE0 for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 12:35:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 057E740026
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788957304;
 b=L0eJizy/d/dmVpSmWCyLO2PmEd9EmULDlonJMlhVOCc2XpUuFlZ8E/MhU7Yk1Pozb94v
 2lWWyHWNX/qMuADF66hReDK31/nFYH9K0w+UE7ISG7NLdI1wL0WRQ+A/24ea+iPsa4d4V
 Debq71f2bjPX5gTFH6/mkE4Ev9HG1aoTNcESpwsbiu45LMJZVlIT2yfcCoL4cUBYbvP1P
 nR+Ijwj1DNISi4r8FfX0x39+JjsebBsUayede3QsMIgo5txNEk7N6lYfsyyI1qHX3qjEv
 aW8Yev0lIv6VVPfae/p/0bcEY65pz+VcGx/DCddRsf5yG7WTS7WgsFB6CRRc2A36+Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788957304;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yyCPBJ9AoumSNYmFA+ng6FYVuIsBOevtDeF7IOUwdlo=;
 b=be8m/ISoVYJWK7W9+LtEgo8iuUWBDe0yjfUsJuAK35OwDY7yipOrtXqYyxqH8UjZFHkX
 p6JgZc5e18lDlirWGgAvusYL5WtlmrYphF/sjPKuIC33h0K/rTgP8mgcR/vf7Fy/Ml66u
 8w7kQvOmMvLpYK5/gc/evnL+Cpttcv6OG4lStFfXIQx7Yywt2rDuL2hSrzMWHODNfOFkO
 /ct1QmyL23D9knCdT7ybFa4iqpB1nJafUdabRJujUuC3Jh1XiiSnPfDjQWzsRIltHxNBr
 EMiXB25pR4EVdaQM/J8gdiqp8kvuLd8Z2yvSAlbYM+nl2BSPWRdefhaCQAFspcAiokQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b="BXY/1KO4"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 057E740026
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:35:03 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d37b6so5313505e9.0
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 05:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788957301; x=1789562101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yyCPBJ9AoumSNYmFA+ng6FYVuIsBOevtDeF7IOUwdlo=;
 b=kWQ2LD0C359EpkqzFfoifUJ7OikZvXgEz5pD4TXmybsXdFDclJFhDG+aJJhGej2tma
 RXskyjCSZ3ZtzLN/zYU24noXlzuInSopIP0bpd8LO5h8If5TM8g4wOulS4nIz7ixkzr7
 vajF2jZT0x4O/R48fkV6jH1mbIbZI/hv+BRv6kVnDhZc1SQ5L8i9/gj4eVm+YG0vXNWW
 6b3od9FDUgE4EL8qfuHAkWApDAQuPpSLhDRV+aGhSESJsd7Ci+9DgdVs0fVhkJvvqr9O
 Q/j7UK3gwuN89nd3tZiX3mDvkypkRobfP4x5uGSRJRd59badYgqs9EEOow9gjjdHHgHo
 P/gQ==
X-Gm-Message-State: AFuF++n/VNpQluCvkEnbbW/Jry6bPnaxXWNWXqcu4RCF3exySyJcezyz
 2AlCd7OTSNnyIwevF+WCEghDSWBsTYtC8qYaAilJT7rmt7qXULlxZt3nWbMTHTPCkAn/Lm5faTg
 u4vlQ7NQ=
X-Gm-Gg: AYBFou3BPrbfByuGPHYLClkUJTvaV9v3DA/L4h7G0AaXsHm1iMImu16hqg+/n2CQgwW
 I2wCG/GRqYtKGvd3jsHNKgv5+b78+TwpzWCDeRfN+Ol7Oogksr7W54BiGmmdaDDgiEiT5Rdt/Mt
 WA+lX7YaOeuzYBhK0gBlbc63L9orKynIwhRd5E+t01HTSjUikwpdJ2CMk2PQqdXEZnxt+1DGJ3m
 TK21XrOIyz3e4s1K+LL939uEJJoc86SDTOEYoZguEJrCOyKtQYUgy4iitWjN6xWEFov4C88mYIx
 RK6avk8SnKMcecxWeLNwo+0RBOSZ8CP8q3Xr2A7WmiIOibj7zI/RAdduVPxDDR6ZMApAao5ZQjd
 CQKZw05mEr5uOAhDMxwnGDtfedvlZi7wu9uwOb0Zyr3yJUo8+27713zHExck6IX7A1Z4ho4uF8d
 ptLyE3AbuiTMHsVhqmtWG2IwJV0H5P996MnK6LzG3MV6VytYehlqQ88tsOkdEuHmGRDbWxLnvbH
 aqvsAQV3KVsYx0aWfJLx86KMKqmPft45qAoflEIMNYRzLR+NmCTKiBMCDrWcWA=
X-Received: by 2002:a05:600c:3b1f:b0:49d:5ff:f408 with SMTP id
 5b1f17b1804b1-49d1f37bb1bmr95485815e9.15.1788957301230; 
 Wed, 09 Sep 2026 05:35:01 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20fce7a7sm114003645e9.4.2026.09.09.05.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 05:34:58 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  9 Sep 2026 14:34:51 +0200
Message-ID: <20260909123451.1995875-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] docs/website/sponsors.html: announce Smile as
 sponsor for the February 2026 Buildroot meeting
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thank Smile for sponsoring the Buildroot Developers Meeting of
February 2026 by providing the meeting room.

https://elinux.org/Buildroot:DeveloperDaysFOSDEM2026

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 docs/website/sponsors.html | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 1facb3c2d9..02622babec 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -136,8 +136,8 @@
 	      <div class="sponsor-body">
 		<a href="http://www.smile.eu">Smile</a> is sponsoring the
 		Buildroot project by hosting
-		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025">Buildroot
-		Developers Meeting of February 2025</a> in Brussels,
+		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2026">Buildroot
+		Developers Meeting of February 2026</a> in Brussels,
 		after the FOSDEM
 		<a href="https://www.fosdem.org">conference</a>.
 	      </div>
@@ -218,7 +218,7 @@
 	      <div class="sponsor-body">
 	        <a href="https://www.smile.eu">Smile</a> provided the
 	        meeting location Buildroot Developers days after
-	        FOSDEM 2023, 2024 and 2025, for the
+	        FOSDEM each year since 2023, for the
 		<a href="https://elinux.org/Buildroot:DeveloperDaysELCE2019">ELCE
 		2019</a> meeting and sponsored the Buildroot Summer
 		Camp 2016: Smile sponsored the participation of Romain
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
