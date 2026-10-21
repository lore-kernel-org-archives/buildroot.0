Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15EB606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IggJwG+S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T7uyU5nk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC2E81C26;
	Wed, 21 Oct 2026 20:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmnbS6yjKEGF; Wed, 21 Oct 2026 20:34:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B79638188A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614860;
	b=Vm2MsL1kOI9TQAvNrqPUy+v6oD1gDrS5Srrjvcx5MsN11P8paF/0qer0hOrfsFEjohS3
	 Ot/B2ECAvHQ5B5p0T1+2xceb4xSMQFjGOMfWvAH3vlUJ++GDyzi+W5GYwk6/zeGMr5Yts
	 lC3IuRIrAg5DaF7egrJxpKIwMb44ZFhghWwLI1VHxzkPiIP71hehCOZX3YkOFFr/z95Ry
	 a4PATJH/CsDv65GebmgqAR3+pEaj67UTxT1BOFY3405n66dWbq/7L9VeUxAO8eoMOTVCZ
	 uLo39Pt+KSKWLCs2b8F5AgxAyD1mOhigZjp2UhwsHVlgsIRxdMa+LchTy6VYkwVOUzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=dnNwMAssRjlv9drqGQoR5zaP6iLP26URNmnXK6S3XbA=;
	b=i3ejbg5eOrw7i4Ql71yvIY9BC1JEiCQbvYh8b9MpYT4/nV3vVCFtkHqB3TAkyjR5AYXI
	 1O6QDF7fxw8z8q4tkoSO4ZjMlXY7H1QpMpdLojYqYt2uLpTGsEcmaf45wuh+liEvdpQmX
	 TIhEYlBri7u4yAb104UkZyoC7AMzHalsVD+jGBsbLqeAiGPxOjwgU8idU3MX69t+bIMRP
	 9ptjaOaJ7oHZrALHG8erZqfWDUr7p3zJiXW7TknRMoBEGiA6tpZgasYfAZYxsiw6ncBKK
	 T4ZfJnINKVTUaPXedhbrmxCqhpqhQenFO+IHpyGTJr1yFCO4RoVA6npUPk6mpblrdqQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614860;
	bh=dnNwMAssRjlv9drqGQoR5zaP6iLP26URNmnXK6S3XbA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IggJwG+SAskYE9hLxZVC+8Z7BzyXMRNrfGFkuOpjrzsNA2hv+ea8E4sdXOoWRKxgJ
	 iUg1fwIzoIL8s7PVE/kCcpGOOinmQDwRTlo5/tE/nqNT7ad1Uj3nUG0v4zi9c4OKRB
	 CwGZTplc0DTRyCoky1Ej78/+fmwut45jgZncFtNzY/uZw27rGmAWMqeqdLvnNMPsht
	 vnXXDGesyWW0ZGo+VAVirl3U7FwOYNiDlVtYWaa4wBiK9wcQcrVIdNMxivQ69N1czZ
	 lB5TMoH+axda4qzelC1rSlC24EqJFWjfSoyC50v+kcBWe7u15Vbjeh9iOuSsZG/km7
	 V8tjBdtj5sbpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79638188A;
	Wed, 21 Oct 2026 20:34:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D968D769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB0C161614
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCbrsj1FvzWf for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A7AB61611
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614856;
 b=Gn1LBDNSF2oeYjdY2RuaJlzQFj9ej4BsPdeuelqFFQZ808N9xULdiiWg6/9BZ7sLSUUV
 xgHxI5tNW54ywoOD3Av9ykyDOaSWUCyLIa/ItdTU104oSTQNIc8g0quKa0/PlaDGVdevK
 5g8FkagWE3jJAtcHtVEu9L7EwfGpE7hsTzkCmUGsQj73RH3BU2eRJP/0BfEiKEHhvOUL8
 sba/FIb2Z+LEpdd+Lrx849Z3TpBHxkfLsqeUJdPkPvCgwBac7HUz+gfCtVVsyrg4QaZKq
 gdiuc0shApDzHOdN90YxLXMxmBHCkWz70yFsvLXtNxsedd5kzfjZEkEg2Xm6aoNppHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614856;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XkyZvyK07tsDvEAbvjVsO2Pvh8S43MK4MjAXSd9vtiI=;
 b=EAyWbEsoTGGq5gtCcFizIeigMKTqehKgWQVh0jKDN5Wik6rWIEhqOEhLGPEw3ES4RmdT
 lJ2jZeZj4I+appzOV7JKTvl+siDNpdLzXl2SPd1Va0bBbdG43MwMteKudYffPbBnCDEMU
 AJZH7sYv4wVIDXWIGzF8LSuktyQG9NPdIqQ1VL/v/0Y5yC5xDgDuyUXFgkF36kc7S+21f
 Lz+ySdo/lwREMKUs8mZphjBWxlCuy+gSzXXqtmPruFxupxfoaVyeH2Ii8rpsW9Npalfzk
 LNQKPOaeTG+Elhm+D9S9LnQxJ4LWNEN6pZ9ZoNIGptSo6vZ4/FYsy4HF3mjzkvO1qXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=T7uyU5nk; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=T7uyU5nk
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A7AB61611
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:15 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-4ab8cb2a6e4so739496b6e.0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614855; x=1793219655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XkyZvyK07tsDvEAbvjVsO2Pvh8S43MK4MjAXSd9vtiI=;
 b=T7uyU5nk3DhM8Q25h7oZUcmyDL8C6YRNp2gcaq4gWe35Mq7dOYt1cOiqUC4nphXbjX
 zTgV0fG1LELsxBlkKhWoRQY1/uHB6NFY6MG2P9zzDqxI3Qp8SCLdivuFA+9pdzdPykZK
 KJGgkcE4h6p3z79e90v41YmWSLGMnWsmrsuwAZ/up65Wn9EF+6E5ep9O7qEUuP1/399s
 ZoK+k6rBP7FJvyOiQwvBTWmfvbXdqWQO24iCigG1USqABi6Yjv3wjq5EXs8J7CS2qYkp
 vwQ7RXAT/zqdXd3Z52niHA0E+vb8IUMyTXBB8tSON38yYSyFWJLozRqd+seWljVzEUj6
 uh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614855; x=1793219655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XkyZvyK07tsDvEAbvjVsO2Pvh8S43MK4MjAXSd9vtiI=;
 b=NikrYtdb5PMxySgQlfaTkzv9FitzMOC6f3n/nCP6UDWNYErV1J7PbhcN4qdspoajs0
 w2HUwGbFtKRHN79rmkzqTJue0DXiQ8VKwRXDCPvMC9Ip4GbplM3feSF45N0Z7AIhDlCI
 FONGloS/g92oKvenB7PhqZ4HJgwWB1Sw2PTqSFHti2ltNB26xZWwVeDDAqFqMZSMfN3K
 ZDBJHUvWAuy+EoPxwEaZjgEOnyQxJu4k6nrkTkQeYl7e5PZD+nZhSI135BIyw9KBTIzI
 /f3Pfo3ItkGvUBZaz4g4wkmRVuCiwOWB5AKVsnG05fmdW/oIOCqPaKWpkNxejYIjmGXU
 6N3w==
X-Gm-Message-State: AFq9FYIzg4mo00N3OhbZNlBmOwI5lKG565odQJ65+1B4BuNajvLAaJgY
 Hbwv317dzq0Tl2GJMIIs1iNVoWyeNsTKSUYJuKuDtgNsKdXQZ7RpdnaLxo/pSw==
X-Gm-Gg: AYBFou1AOCKJSMVgGO05nw1FfHa5xKz9mS/gKgTvE1Fa4tKU52hJjL3vvqJCYdwJBb2
 Ei+BDsega5Yzk/CXm1nUwUT4w7R40pndNFSGrjuLVayp63cnJ70/jRokXAQVq+NOJI4eF7UTZDS
 4xXwcobtP1oeJF7D5JKBjWBupMZ5OmpmUNZB1BbVSxxtaQmf94s4b/2JKnfET0KA5o7vvrBMp1i
 1abgMsQVuX++lL9oLnavmSs7e1RpDGWTDJmInc4YUh9NJl0ynm/FBkJJ8fubOJxT41lEBbAzRzD
 wJjCX3nNpGFoTUr7WeNXNUr1LaHM2OJsS6cXVacJPllwCYpLHYlLPVueGEqOwcIqd+Tg56AKDij
 9yuRmEoQ45jPu4Mt0/Tj/C7ALQ+8+rlh3Snn8JtWCNS/M6JHXmyo7Pp6HEVDVBK05E8knzJ8HvC
 tIBNi9NXY3hpn9TaUaO08LiRe6BxPHrqt7vUCASBYQRhaJpMiZrM0BRsWMz6POBd834K6/KyU4x
 O/E+Gi3EH2PG3zhFw+2l8Ur7UnpdqeZbMcTClUTHVOuv8nRNcPJeTe9yHart1O9O7HmbbbIh8p6
 gXz1B9jJrgSj5vgO8X/aVSyCuVY7L0SCk6106264DKrQ1jHDKZXR+46edB7J1TAImdIUCIwPofZ
 4GfvznKTmRIoOamh2qJa4+yYFOw/JaPsfttaB3PpWLefWagLNSeBJFLfcX3iTuQJfz06oAUkY86
 hAeBCUOhtdyGQqiR0uMtXZYL2+N9KqVUvFaRkgcHWYRTxC
X-Received: by 2002:a05:6808:309b:b0:4f5:eaac:517a with SMTP id
 5614622812f47-5534c58314dmr2598735b6e.1.1792614854758; 
 Wed, 21 Oct 2026 13:34:14 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:33:57 -0600
Message-ID: <20261021203410.3114473-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 03/16] package/python-jaraco-context: add
 host variant
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
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable a host variant for host-python-jaraco-text and carry over its
build dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-context/python-jaraco-context.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index f812cec8f1..dff0d21910 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -13,5 +13,9 @@ PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
 	host-python-coherent-licensed \
 	host-python-setuptools-scm
+HOST_PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
