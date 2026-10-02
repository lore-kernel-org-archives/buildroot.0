Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FC5CA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 05:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE47240B30;
	Fri,  2 Oct 2026 05:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxkkv9V1DMvr; Fri,  2 Oct 2026 05:42:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F132F40B34
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790919776;
	b=PgOzCZMHlWAHFbOCGV5xI2C+UbncJjkHdT/TyR/aBitNQ7SWLc73fnktvquwaRzdmyax
	 BN3H6m/OVO3fnof1ECWKCmtuAMekguHT2lJBeqrbus8BKtnF9mZqk6T2V1Qgy3MqgORNd
	 iubSuOb0rVRQV6+E6sp3xYm6YT/xOUMJO6eb3i/9jZp0le+QggPo1gatHA/Ea5WchbYOF
	 jocpaTN+TlO50eEqC4T+hwJgpQ0FmWD2ugprOibEz37KNgvue5x9pi4q5XykIf5Fmpm09
	 jyHpCTWzbLP14MkMbxP0iPr14596Hw+//gU7y6zM1QRKC3H1VLFWjoDfmjnr8/uIxmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790919776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dLQZDBq40/DnNj+XZ0eA3Fp/eagM3EhYiP10DSs/kjk=;
	b=DuwRDgA42EkshItbYszeXLTQo95I3GWQfNo28/1Pb+0SAHZr3sG9v5tdsuXV6w3iaXES
	 P95EXQzsanotVB66mscnXVHsPKn6MFK+wIGnlmzLmBd274LT53IxfcMEs4ZeMG1OdM45U
	 bhSjpNGLD9Yob4odlWwFx+RRui5kotrQhUUZ1tgy9cF97J6mQj1DBlV0kEy6scZXc0Z0D
	 hU8KN2WFadgp6c6B6JXLU5eeQ72R8Wl88OGDqjn4A4DE4DoGBNKaPjW8V5HWikcvTp20n
	 raCfeGY93Fb38z1QYGSmEImnZP/zoMVFggmaL+ro7QiFof4FZArKhQxBpjXpu6yU5kg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790919776;
	bh=dLQZDBq40/DnNj+XZ0eA3Fp/eagM3EhYiP10DSs/kjk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iWIQGP/GVK9hrazTXZt9MalxMg5NP1Dq0vXL2yncdPEFk5jIdqzn0iOf9aaIBcK9o
	 sED+ct97QN6j7onoW0RbPvdPRPrNfMA1H42Q54KHT/tnq65Mvue4r6sVeiyVVnYpED
	 T+7KtLOFxTM3SZT79Cr2OcHm6GDc8YCBwtYa2060Pq3LHqflZU7Gx4vB+SYMat0q5i
	 /3cXNi8ksH/nmWZfhgIGcMAmqNFI4QOQj57zorH7ngnuiL1fa//OsPDWDKImir5kt7
	 Di3wxZ1mZe3B2moRLb5++O59p5iLK5rzw1+qK5CHKpVA17K0PzpQFyFbFiVL+8Ng1z
	 nwUxReSFBpXRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F132F40B34;
	Fri,  2 Oct 2026 05:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A98124D9F
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 05:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B02C80FF9
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 05:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtl_FjogLcWE for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 05:42:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6CD7280EE3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790919773;
 b=I4xDyKRhXQw4r2bmMQ1SI9K2j/cTSR0gmdS2TbfY2wOLp1FJYP2HlRQBIEKbFbRMrqEH
 9WRVUdNR9+xMybi/feTeRaEPvIPwhi2zSj7GBE2F4Bu4PhNS54GNhM3eFuooPCXuhJvyr
 nolHuAV4YjLkT/4+jvU4LSCg1CVOEoWnrVbVbfe8trLSHBeo+BHFGXAIyO7GGQWkQR2UQ
 LFT4LF0qUMEHFz7Jn2V1kyIsGVOY8xC1BDwgPvkQD6dXmnfj8nOLwjo+39XgO/AFdri4n
 OIZDDKLjkJFoP2v/o7LNFZgY61DG+7EODOuge9cHUoSfcAvGrtacOIDLfq2nyEhxH5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790919773;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=wQrHItRmgQI+d8tPCoBjEKueri3EdIjCy745bY+43pE=;
 b=U+QzzpBKyVs0p01FLuxq65ALa4lDxgcmvHB38Ej8ztk4kIWdoiYYa7n8R6dpH5fPlor3
 ySYXc+ZpOCxUg5yFHMIDptjClC/f54LIOVptF/GrSREqMSwSjOwVYqZZtwWXGDRZFQoyh
 DA6nY0GCNmliW+P+ecZjw6Q/mNZpviJOhHnq4P00u0TBKBoVwIdvupCg34cfMJqk8Gp8h
 z4blk5enYlSaLaQV2IUX/NKTDI1J2m60mERw1CpOEtdXzOzj9ieT9kCOqvfFNhxQ4lGJz
 wZ1CinQah9wAdgKgrOw1PZwL87rPNZ5oxGfp8s1OfDE/EwdYTLmMSwG4BnAjlBatvig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dYJjaUMk; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dYJjaUMk
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CD7280EE3
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 05:42:52 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e79a408deso45308945e9.2
 for <buildroot@busybox.net>; Thu, 01 Oct 2026 22:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790919771; x=1791524571; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wQrHItRmgQI+d8tPCoBjEKueri3EdIjCy745bY+43pE=;
 b=dYJjaUMkAoMaDnCsFbJI4HX21pxJWvQ7iP2OhZUT795pFBLnCvDnhwvTaexQTneAvP
 s3fF89XPAKS8+1GuGFuBNEZeNw+fujHekPsLgCSDoVD3j1E6xr6eKFBswds3ckTkDzPt
 YYgaFZlB6xjim8tirGyUbJsaE62+TY4DsOnXg97eZLae+W6BquL95YA5rPylwO3q2KBz
 lxv4sehc/8e2QOTcRfIAvUeQSX66+vQkJVUNikg6/opAPor6DNzPSOiDjIRyoe20W6KT
 gFJzhtvqZLQF0Eeos1sunMl2SoG0CoMFl5lM3IQjpd4N886ztsM8xDl0ks/j47YttLNT
 l2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790919771; x=1791524571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wQrHItRmgQI+d8tPCoBjEKueri3EdIjCy745bY+43pE=;
 b=W3d+0qtlExKAs3X3i/L55GWRUlZJP+0vn/5ebUrVWGlsIH+s4vfwVJQc8t3LMaE9Id
 gVGpJDCJWh8e+Py4n2Ifrq53D25HucPPX8bQJDct1HYljGbw1BW451lKCL1h2OgYqd7X
 fcF+pYLfxs9P6A9KW/iusELCT/ZzACLEkr1zMPTcLNwfgoC6N2ksOgxVgCLGn+b4jRPU
 6EL2XDggjZXVAbHKKzehXdaEgg6ImWJRlm/9YKzVy/RQtwuwkmpqbvt/jAaJzVCek8UE
 /jmg3tNVzcBXJcR048yEK4RNjzxXPc6I3A+sdbQl8D/AWtzOZijWQn3+hN/BnWYxLZkz
 0mSw==
X-Gm-Message-State: AFuF++meYB0AZROr9Uhvwhe4ZnccZ+UbddRlM1Zp/8NCyWup64teUBBr
 5/uqtMIZuTJiHZVjA58/TjoIZEcDo5pJByDrjoWR9Q6hD2NH2Fbt/VmBJFo/lg==
X-Gm-Gg: AYBFou1eiUn/n/zUtIgro8RzZ/fcoP9Be+1zPeicCR2OTQrOzyvTS1jd0zyAJdPsDdZ
 4P4nVJIsjAvJqP5jih0dTvt9sW+TSeMe9KfMhPJ0enSKgRs/+YOevo1zcZdnI9Mt8rmFH18EzJD
 NkmWY2o1LSwXN6zeHNNmwzT3OQxtwwLu0TFFtycshZ7w6ENyhzI4ZS9ep4aXccZjIJf5ZSFVDir
 lepQlTWHrTv0qWVftJ2cGape03pEh72IegI6Am8KDXYaWVqr7FFU368Y1roWtFr+3euv3Q3UUrZ
 Jjcu7VQoQB02OcXRPhySWS00xEu8hNOjL1xqUTWJl0Pb0tytt9X12KdneSDo6YgTTLik4LqivUt
 9haCslk40SK562AYxNSep+eQfjud1c7R47KcA1mN+fgg6nsZ5sKKjYlSNTZO6Es21TRT0GR9ZPE
 bXTqyCVCFjmnUBmxgUeQk3uZJTh2oQkpbQoNr5nQgMtUzonoOCu9gJg7twqY23eX5QvWSKIjJBr
 Uvf+FJTWuODj3HqlMexoArw8mtcOoSQT75eUj4N
X-Received: by 2002:a05:600c:1d15:b0:49f:e427:e88f with SMTP id
 5b1f17b1804b1-4a027564ddemr28939215e9.21.1790919770631; 
 Thu, 01 Oct 2026 22:42:50 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280bfafasm50614065e9.8.2026.10.01.22.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 22:42:50 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  2 Oct 2026 07:42:47 +0200
Message-ID: <20261002054247.51494-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gawk: bump to version 5.4.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 35524c774..45c0ea38c 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.4.0.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.4.1.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1  gawk-5.4.0.tar.xz
+sha256  07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37  gawk-5.4.1.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 10ca33684..dd465a40f 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.4.0
+GAWK_VERSION = 5.4.1
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
