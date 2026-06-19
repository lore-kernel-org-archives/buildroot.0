Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFD4CD98F6
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59B5385729;
	Fri, 19 Jun 2026 09:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6fVtyFbXY3K; Fri, 19 Jun 2026 09:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2BF385723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781862766;
	bh=0U0jfGrUSWkrurJ0CzZZebxS02Wrz6fh2evdIZrxvYI=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=blDkTZaGc34vdN8bph4a0y/GgIq3WQAS1rrZFIQLyro+PxjF3Qfyc6jg02w38ZMPQ
	 snSbTztL3lY/dAuwV9FhkoQvo6YiHEufMpBzvIz+IVriUnktwux01widzUGbCkDHmm
	 13kHAi9g/AjjwnPs3eapQ6ZenNUzj1rag/6wkh00r4FLNo2AppvwVUJT2S8SMkDVCX
	 stsUL9DYv+961RhcUcBzKcqv+8WAE24oufZG8OcfmPjHwVYMRx6MJBDCWxJ0VQptBg
	 nNJ5FSdQIo1i4kP/TX46ocK1gifu19QZS0igahLxb4kDLbxPhMD3RV30aZNP3aulr2
	 qveXFwzBI7sVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BF385723;
	Fri, 19 Jun 2026 09:52:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E817D279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8F2942E35
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cx721MYtfyLE for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 086DC42D2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086DC42D2D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 086DC42D2D
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:52:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 86BA34E42FC7;
 Fri, 19 Jun 2026 09:52:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5B554601AD;
 Fri, 19 Jun 2026 09:52:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C9F5E106C8938; 
 Fri, 19 Jun 2026 11:52:34 +0200 (CEST)
Date: Fri, 19 Jun 2026 11:52:33 +0200
To: Cherniaev Andrei <dungeonlords789@naver.com>
Message-ID: <20260619115233.01b6546b@kmaincent-XPS-13-7390>
In-Reply-To: <20260611130409.2841176-1-dungeonlords789@naver.com>
References: <20260611130409.2841176-1-dungeonlords789@naver.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1781862759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FCZrK/EEGth9N9QakVjGCBCzF9qJ1/UtlGVWBb3St40=;
 b=gtr4wSST+2Bec7IyGRurOq+SfbGMUicyQCpX+tuZ7/+5ViXaeZaw/LdWj9yO0WPNUdKluH
 1ombAFMj5YmLplHtSu28Wj0AMWt9mOy5bgbpdxOx8iLg+MqmaeoNubhe9uVJinXcQVsfv9
 xfzE4ANZAB6za8EWL0A11Ob4wZZk0dbIjBnHAE6IxB1AsqE7wAiKNlZ7dka2XMYKQnzZqV
 ZEJrEVoqS+935N6qvNR/KJQitZA3cl7d9RuWzAXIMnMyZSi/LtkPpf0cbJtG24V+m6JXuN
 qfNirzr5+qBKVf2k7fXNBVQ+v6GXoqzbjLvl4jskva2o93+LDWTAShUS1As29A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gtr4wSST
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: fix description
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: vincent.stehle@arm.com, buildroot@buildroot.org, jiaxun.yang@flygoat.com,
 fiona.klute@gmx.de, ju.o@free.fr, hi@senzilla.io, romain.naour@gmail.com,
 fancp2007@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxMSBKdW4gMjAyNiAyMjowNDowOSArMDkwMApDaGVybmlhZXYgQW5kcmVpIDxkdW5n
ZW9ubG9yZHM3ODlAbmF2ZXIuY29tPiB3cm90ZToKCj4gMSkgdXN1YWxseSB1c2VyIHNob3VsZCBu
b3QgdHJ5IHRvIGZpbmQgT1ZNRi5mZCBzb21ld2hlcmUgbWFudWFsbHkKPiAyKSBib2FyZC9xZW11
L3g4Nl82NC1lZmkvcmVhZG1lLnR4dCBpcyB0cnlpbmcgdG8gYmUgZHVwbGljYXRlIG9mCj4gYm9h
cmQvcGMvcmVhZG1lLnR4dC4gV2Ugc2hvdWxkIG5vdCBkdXBsaWNhdGUgaW5mbwoKUmV2aWV3ZWQt
Ynk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpUaGFuayB5b3Uh
Ci0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
