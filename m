Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XHaE+wwx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ViDR7sJR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF4260608;
	Fri, 23 Oct 2026 18:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojEK6Mr-TL-4; Fri, 23 Oct 2026 18:18:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 21B1560628
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779538;
	b=QOWb0p5bZsVC8rNdis8KmRJWj49kDPJ8OQQ0yPpN24YMtUqyAPRsCv18N5B/Le9Xq3rS
	 qMvIFuYcn8tVuHOxkecaj8Z3cjvCDrTZNgL7Wrk/NjP/rn+e+dDNr8E2T+F/5FBEcrqmM
	 dGP39Z/06BWQRWELAA1HC8XNC/cwqn/U2T/cq1HtXsvRnB5ixdXBf2IwdZM7AWYFPSc3l
	 TiNAeSDHWS7q+uqWsP4JYlfyEiu55Bl8mE9ExDdwfjKyJmHn7yp3d+kgW8ITVyBGzqo9C
	 Nh2PI4PorVj/lYz1d5LRSV5VCuzRAFHxsw+HeyeurJuibqMr9xNGT9oqilakl1sWiiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779538;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3n/+OZbdjZD6Gkma7VV+DSVVZ21hbEozm+opU5rUDn8=;
	b=UIXyib7Ttdz1PVFuxXzFInwvkpui9CUjmhbTI+VNyYtVV7TIHDxNYjHc4kYMp4/FBjNa
	 TkzabKAY6p4eovkZJXr0BuxGxQ08G89FYZUBr8J6dtXw8HZYAiX3dKdPL/lppzv/pBrhR
	 lWWC2ZBzgdoPRaX5H/vIw8pMVpFRLHWGmd3qzPjHBJ0NDazLwvz518OMTuGX6NNfN6p2/
	 sxK2R9wQKp8A9tcR4M3CIKN++LG0fU/HtJA25YL4kRh7N44EvK/pdjPRYWXVr6aCViq0m
	 0aAW9KcPvxY9Rdk/xAOTbv8vYDaNKFqcOAFhQE3+pwLf6EOjG+f/LW3WkmCIbHCGuCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779538;
	bh=3n/+OZbdjZD6Gkma7VV+DSVVZ21hbEozm+opU5rUDn8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XHaE+wwxAXNF7xjeMHF7EpP2NiF97y97C6ZQZFfjV8pLM4PuAET1+NqVGxpX8LjEb
	 LpHe0L8TrDsRoPVuiYb/1R8ZibOjTvpx4V3EU48d7HNFhOc/b6lqtgBvpXQGmRmNtG
	 QBQOgqUXV7EB0XfIeCk1j+kuc+RRyqrFgJcBZfuihZ0M2Lh3Ueo9P7CfPvH50kxiFu
	 RDck9njzSVS2U2FuutuuoGbInOXID5cLTAFee5HWpeBR9MYJWPA5t83Fh+TGxrRgAt
	 QK20TxcmZfdOu+Qo/cXmfopkPjyeXBwmURCLb00LRJjjHOgq1y5c1UTY44NPPyudMj
	 Wq2UZWCBz+nXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B1560628;
	Fri, 23 Oct 2026 18:18:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8D0712C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE998404A2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wT7RmyTvQdui for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BDAED40483
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779527;
 b=qO8RmMW5txirHlzNC1BcbZQuCksZB0/LI2pOZX8h8uDLunwtYh1n1TUwn2me0Vn4NLUm
 EW/GaNTUtO1b4uQcceIWX8b40VqBHI4SW+jOvVeu9z4tZzvK3xmAD8vIu0z1EnQvySg/A
 S0XP36rn0v4sSfDoQUw8rU71y0SaVwSUJGCwP+t0HAL5Gop1Hy8wq0L+EL3zf4jyIuL6D
 BnqNGKiyRhP/MkrLTqKuanSBQWGSKWjJTJtVfPO9na12YMRpIHxTDKmN9EQHVqvRxIUOi
 FJLYUjyVZdZeW53KPZlqm5/2zyPqyWKjtPCG7BcX7Ak0cA+kRlSjtHkGQqIaVV4jlkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779527;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=v6Je20Tc+3hQ7UnWd6v42Wj5wrsTrTZCrfw3kvImodQ=;
 b=IzlUfN5gfv0TkyWjkKmbDscpm/CzCn5I7gN39hn9UKj1HweFSHmehdvbhvO75P0mLL2+
 v1Jhh2+BcBBQxwpAHTwHFJ6J577dG8IyWQFw+I9zCvTCT00a3IoQw8m1HIFQC+Lfq/7Wg
 HNXjAnS2D2LsoTwSzQw6kGPSv1IVv95TaL6n6chL8W1voeMg1WvQFRTJKhnazxhOePs/9
 mQ7mMCRxnRekQ6k0A4xCJOwIFAyFXy8+/w9XNn5yaBKUpfxgfHu/aiL5psIyLLTAwG/Av
 WHTSwlQWRHsUXQeItbWi6D4eKryYd+S/Wv2q351vA/WBtLtQb7soZ/4x4oF63dzmQqQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ViDR7sJR; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ViDR7sJR
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDAED40483
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:47 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-6fe4372c5f3so830920eaf.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779526; x=1793384326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=v6Je20Tc+3hQ7UnWd6v42Wj5wrsTrTZCrfw3kvImodQ=;
 b=ViDR7sJR3VTesTygAYL+lvmMnLq9qLn9kIIFWHBup4Yj6CmG0NJaJ6AM+qhNnv7bSk
 ib7+ebiCZya075CfOGdtsJDnsusnsW/9HZCZX264zY2spATZSe81cXZU4gOs2N1WwSJ6
 psKfG5JGDj0pT5vj/UELScQTFEm76+/0T8eji52kRTFf2ysDiK7RPZLTdWJxmaeTghOE
 1ZuNh/rqoQdFSWM1TsQJN/IFDKgGwNq0ttB3XtY5MKrkujFG649ONOxOBMmPIiHn+veP
 dvcTI2flqJ0I5IDpElfT5YUHd4pRedUn3uP8MKAYgSwuNHaGkoD7US8i3BnfhSdeQsNG
 m77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779526; x=1793384326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v6Je20Tc+3hQ7UnWd6v42Wj5wrsTrTZCrfw3kvImodQ=;
 b=No+tTbiXoNw5o0L0Pp0EFuxpphPvHYIPhiF5FPb/8Uesq0mWzsqf0NcuGv8pPzOqsG
 d6JZqGJYErmiRi1KI86mXAr7rOIThimge/s+RrcMHJ7lQrxRchtO6VxhC+93OY9ceJl8
 XBU4WKK3hpIJ51XYJ598R9MOvJBK2WkOmWfu41zoBDCj2zRd/lVgUe8Em80QHqe27VKo
 +lhfq9Y8qAp/sdIdrcwwPxXyZ8R6NeG6J1HSmeYM+5O8PdlD6xHZrcGqKhwWAUCeVrEU
 T+0oUAlXR4p6QjiE6EGxLLi91gsWTm+j4dKXkXg6LS5PoARTsJ6ifjlsRiury3vWLltu
 6qBg==
X-Gm-Message-State: AFq9FYJIMwGdKwtWwrOii+b85+t4++v6lCI+jecrtq28jkQ+kPZJ/aSm
 sXcKdPBATcPtx/Udr0xAa+l7QIYwrfip9h9vU83fmoF2sbOd7ZnZK1RHMkRbdPFX
X-Gm-Gg: AYBFou3CkhHyuolfzyc1EFCPAgeQVZEF6IKFoLgHV0jYKU8uVfQEifouK+YtdNpktFE
 ERsBKO1vdDKzh42wRaM1LMgCRvLNiGtLfaNqRMLgzui2Eo/cqGGvUc7NI+oLN/+4mMlQax0BPR4
 i4WMc6kabfdM92tewCuSN6Gn0wvY4fOm91d/KkOEKs8/tCxNGk9mtcr0Ar5OWZmpbJ5k5gT/wUa
 cxl8YgcrOy8jz/Bhd0SjbIoUgJllwgmxc76/1FKG4Fa0tUCFAwyTl+rNtEgNrymBt8f8D8QGb4M
 trQIszoqVzQeS2mCyduB0Gaz4VsYIJorA6lXJYKtuBPcUyylqCa/TvSkQInaJTj0evJmaHRiQpc
 VTCh6hDusyVBwVphO2k5Mxa1yNdPx+S7gpe9omflnJ2NNvZQF27TsFthIfoTnn8MNUAwP2m6ZXC
 TeZ54bW13Vv9LdRDAvjwKFguVtRqxWKqQBWc80CHrHEPdU3U+zHETGBl8E07wnFbwDVpF1KnG3K
 5HZ97nQT+rmeYFnTlAJiWuy4gwkwSIydN2ZJecWXGI6fFlSBSi7a6tikPbMtkrs8w6Xvzmx99ai
 nFV5xE4aP8g1xOaZPPZmUppFq/kSQWwiigK3e/53JItIxX9PEovrDQZXMLsFKHwS5kk7uz/IMob
 806mAQtwYlDrk2/U262ShvPcQ1xEH0dHLuLXdEEq0pG4mGtTxT2M/ELNStnC94zwZpkDpoG9XS6
 WExjo4/pt7qHgd/3fs3KJuvd0=
X-Received: by 2002:a05:6820:2ac4:b0:703:4766:16e with SMTP id
 006d021491bc7-70b88a8be28mr1923175eaf.56.1792779526400; 
 Fri, 23 Oct 2026 11:18:46 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:34 -0600
Message-ID: <20261023181818.920329-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pydantic-settings: bump to
 version 2.16.1
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
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 226a923bf1..4ed74fb707 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  68615b705951d9a2de8d8ea29c377580  pydantic_settings-2.16.0.tar.gz
-sha256  5b6c578049ede4db0e2ef3b4eaa4ad4069cfa9211f83fb38df899dfade50a614  pydantic_settings-2.16.0.tar.gz
+md5  c31750bce5209a37412ce332e0b31975  pydantic_settings-2.16.1.tar.gz
+sha256  aff602a1886338c2df3d1e958e2193a8dc33cec75b91f202e83fd98484b4b0da  pydantic_settings-2.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 708b1df045..1d5766dffd 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.1
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/2e/3b/a5d2294799b53b448319978cfb5bd139d5a9d45e862af91661614f14c922
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/05/ca/7817b4bf0c4b15c6a6ab8cdf4cb96c268335a8ca2f525de93b6ebe4c7d28
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
