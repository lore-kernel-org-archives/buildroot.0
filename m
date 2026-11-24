Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9704606A32C
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EpAMifID;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=C0veBPGJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F1BD6084E;
	Tue, 24 Nov 2026 12:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KJrDdfDfnPZ; Tue, 24 Nov 2026 12:04:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A6FE06084A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795521899;
	b=OxrrjH/EdiOiTX9UqkWtF5MGCTxKY6dX5CMbdPND11cz1iKZKCzlmIdOFtI1jqx2ZP0j
	 a1L4iqYDezlWCBG1vTvjfR+VmbiipaZlndPKnAF3hO/zH5+6BGPXPys2PNX1WNoNfPIC4
	 8WLMDPTxEsK3heDNY3kfkeebQ47Qfq8pH6M//xJbCGKMeU7iougIU3pz5wO5tQJKfJB8B
	 CmYs5Pww7ZL62OrctmTZxIv/jR59pINvolIYHnvdYf++FO+EDJasGTA0az4Bwr8Dm38em
	 K1Txq9k+jDLSsgSEHpsjOLxV0EshMV0QpxgnfQgtAiF1M3h+RQ+f6opWZ5LnlVYDoSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795521899;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=12o0VCJ2LU5x8fkkBqMJ98xmVt7p866h1oFjLSX1DUw=;
	b=KAp5Ve+BY4AWCy4BNPIhN47kEH0DygMfWNvMhFT9HIeLutHjSUApkjGmMclbGCehjR5X
	 OeAub3r55e0ucNVSIN4tU5tQ9G24tv0b+95MInp7E1smNN9b7p5DtS30F0E/vNZJaOzrG
	 nGmI9uLjSIRWCXqDr98+eB+378T+la+DE2Thqhv61yDyg6C2IDh02uct25d9Ei1WQgyJO
	 +C8rv+iG/SAQeDrzJHyC8bf9a5l5taqqRX7xnDDiyXXOfBDMXNGpnqJyHMmgmB5IwVkrx
	 hCCJCVgxYkz+frt26YmPth0u6dvlwxD8HtnZrocQ9/9Q8O34o5j1sAVNPJWjsS+iszw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=C0veBPGJ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795521899;
	bh=12o0VCJ2LU5x8fkkBqMJ98xmVt7p866h1oFjLSX1DUw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EpAMifIDQE0X+DRI5rXkVneiJQZt7P9TFyNDftVmutUAgW943v5HNouFuspTjujgy
	 SLrKK+SW9tojSPKKD8YLXF9b6z4UB5BdM+a5cG4DO7Ft91081Sn9+R0uItjMqThSNE
	 3SHx83Z9RQ6CbsjgbbgbG5w8aQekIXpIZsAbzmDWsyVLBv52BWUf7vqYJhJ1BlmD1v
	 ANCBRATfxwZAVl6T/eq2CFd6WWQ5Md91SL3zvaJtwunwCBly99CV1EsAIoH3ctaJGU
	 84lunG9Bm2Gmxs7ox3EbfeheYKS7f6MCsXuCH6VVL42AStSoE5wjuPa8kl7xejOdop
	 O4q+NOgm3ireQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6FE06084A;
	Tue, 24 Nov 2026 12:04:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5FF23A8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA27E60834
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CC19H50EqgsM for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 12:04:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EDA4760818
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=C0veBPGJ
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDA4760818
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:51 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c50c2be615dso32279766b.0
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795521889; x=1796126689;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iHa1jYYRh332bdpbkN+eenbtrPFg5Zwj3iRz/+Sv8RE=;
 b=C0veBPGJ5aXILuHZPLmfgi+WyHhTHRqFDIq6oVgvoe0giz74pjGnWmxZdp72qS8UnA
 huVnuRHcXNmFDFohUNR8ruLHcVaE0rELZ8wOlWG3OgGEYtPjMORjVclxHJ94KqfpR3D1
 JZylYdmbPjc4QPCZDRY23+76ZlG6H2thzepNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795521889; x=1796126689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iHa1jYYRh332bdpbkN+eenbtrPFg5Zwj3iRz/+Sv8RE=;
 b=cDubAnTHfxgyhb7wOdXFTAllpvInCArA6T+C/tp6lX5FFJPuHpxtE/UWHTZoAnP5yr
 KxYgO4dB9AsHEhmnidijBEb5tI14ElJwgrSjXMA/5QVJzoYDms8EYrl/2QSaNk3HcQYr
 bU8wFBXcXrVDgNMV9DtCltcaRB7oJ9OtfgCNo94b4AsRaQuweyxwej1r74qzZAJtyLLq
 oYwF+3+UOWYhXfnZYLSJ4kFEU+XpEq9JP2vTAfKOOEQNqGtEOGqyyt+btMfyd8EfRB/F
 2sWjXDI72T/7vJnfjQcbD4mD7FeM0GDQge1QAMXr6Kc1sNvfT3Y29SO5aBq42iYimcVn
 Jh0A==
X-Gm-Message-State: APuU4Z8xChQ+uKJNBV+McOO1c8kaUbHMz0RxzQtzNgCNciQS07Mr11pb
 zUx2CByFtGZoJTH201yJNI4TxDRPzF5JaY9NMnlUZzZzvrNbeExBHaj2p/cBt+P1dWAifMR+lu6
 W40ADPno=
X-Gm-Gg: AZFdTZd0TP8e/pchk5BFzrIih2a654/hWMWWAdlBF9QB8MylQCzHhrpB9mbQe9GtXYB
 GsNnbIb7vneMNtBt5DuR1zwJT95gd0CRf02u3ISIsHVWpZa8FYxLtPIjKZoKDX7lGLAdb/cyOyl
 5guvpRxMPfv2N1yvzhpOgGw2lGUmjFcgwVdU5cHTO+YJbB6JBVjEian1FwUFqBKhMSKEUIUcP5I
 4vk6y1z+PGPjbiWQbl3Qk6a8T+hN9arpkVAZxs2DhWY4E6RDgUVuSxRJM+5NbmLXfSftGgm/SUf
 FP3/zxn+oXqpMb8vdJXS6ilUvwiXqGOMF3/XRWw2thfw8vIpYDRc4LD1vgk6imH5t1TQxKQzDPW
 kmPuP+cbPeOJsmIIQ5KA2Onohr7HuCAW5yqe1EDY10xJrANr/Yw0WWsAWwpqIu3KTYPZfefMsYp
 1o03x0EXwbrHnKf3jFc0v/LbuWqLiDLsewlIyWJ+Z17MqADcO7W8eT+0+s3+GD7mmv/m+iE0Xp2
 qbdh59vgzhZ3vXQpuOKZp7tD28smVz2U0EUrXd4vSyz0vjUdJGIgF5gbQ+2utJsPQZTPZRdOZw9
 uYY5dkBaX3MvRdvrFJUBAAyaDszT/dEtAMB6pbPwUFXIYAFSeUc8Of5lwabj3ld5Wbll6r0JWar
 dcT4/I9BgJEpMvHPL+bmHBXD1Y2hcuIwKZ0XT82y7ZgvNgrnZ3XESlsKmiFZOiePW/yGFPZMnnp
 Svfm8egf5N7lK8vNM48iVZa7F4Z3lYKJ5lo1foBcB7G8gqu+I7J/JP4RtdVBSu7sjZVsEy4UJXe
 BAfw/9RGWkpiUUCOb+h3g==
X-Received: by 2002:a17:906:a11a:b0:c42:e6c8:e45a with SMTP id
 a640c23a62f3a-c513a5f7605mr1071879666b.3.1795521889527; 
 Tue, 24 Nov 2026 04:04:49 -0800 (PST)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae67bd3sm499466766b.27.2026.11.24.04.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 04:04:49 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Nov 2026 13:04:41 +0100
Message-ID: <20261124120443.1909297-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/9] package/flutter-pi: bump to version edda7f9a
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Notable upstream changes:
- avoid blocking the raster thread on page flip
- add a pixel ratio override option
- add DRM fd support
- always force zero rotation in KMS planes
- fix text_input escape sequences

Tested with flutter 3.50.1 using
tests.package.test_flutter.TestFlutter.test_run.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index 892aff75f5..b89949ba31 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b30e8b67109a81a7c2a2bbec3d82491b69e827a1eb84c529f3e31691c19671d5  flutter-pi-af8c8d66c5f40a6aaf366882bb9ca525be9c600a-git4.tar.gz
+sha256  0f2e55cac9bc4d80b645532c60fe632a6e6d7322f7536a795658b984796c3ef9  flutter-pi-edda7f9a216a2fd60586ef350aac84ebaa847bb0-git4.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 4444493e61..411f414472 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = af8c8d66c5f40a6aaf366882bb9ca525be9c600a
+FLUTTER_PI_VERSION = edda7f9a216a2fd60586ef350aac84ebaa847bb0
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
