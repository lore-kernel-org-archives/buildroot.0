Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAE1C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4132B41370;
	Fri, 12 Jul 2024 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYajwSOnRQca; Fri, 12 Jul 2024 20:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6DC7413B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6DC7413B8;
	Fri, 12 Jul 2024 20:31:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3312B1BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F112413B8
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fj6PigjIF0vq for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93D9441370
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D9441370
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93D9441370
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:31:56 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ee910d6aaeso31212961fa.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720816314; x=1721421114;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lrR5Z8SBEW3VhzF6t4Q9aqMGryFzLJe3dL6Jau4j/yk=;
 b=tqHXY4XTe/HBPk0iA9/u2X6sXUun1XWvMHDGl6vituMhJz7+syj0roEedCel9GElN9
 wgdTIjvzAARjMiw1UfM3f+xYDfWb9Trye0BN1BBbWF8oPvnzgnR+LKoZAl1ndnslWhiC
 fRscuPe8V8nGeR0M24QECEen4NNSOR8oDYwmZm4lcL38DbVJM45jWs4eVDeyEyeY64sc
 T6uUjtRvCOgirGIsTbo2MhLA5Gf5Cmq5FtAkW5fJlLGpp52j6gBAgvgzYwFkuGw+6NJi
 XflSLErDWAkBgi3lUXwn1SXD0gJq8WnMs5GihIHRGugoAzln4Vj80nRIMx1ceFGUIy+c
 /wLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfydSgM4FF7LUCW+RvYYHnU2t7BT5KPv/zFAfLS/XMLiTHCLtr6YY5h4RRvDdesuIrn2nobHufp9UmvtznmDUEi4qx0O2gQA==
X-Gm-Message-State: AOJu0Yz4CjLMregs5yZ09hWkp4Zd6hOoNJZritMDIL7I48IQS5WPBd9Z
 PzADwnhfCc85VDEnbAWrkkO03tiBWTKDUDC+fxoFP0SJVFS5QfpWtwqGP3Yux6q1Ckx9kjxYxV9
 x
X-Google-Smtp-Source: AGHT+IEzg9QbKE3oPsIYa6mTSCbvbEWcwNerJPcbuKWvAmQ6xtXubDKCAbYy+M0PIhYMg3L4sQDOgw==
X-Received: by 2002:a2e:a367:0:b0:2ee:7bcd:a3f with SMTP id
 38308e7fff4ca-2eeb30eb72amr76635091fa.22.1720816314166; 
 Fri, 12 Jul 2024 13:31:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a14d32e8sm25093325e9.17.2024.07.12.13.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:31:53 -0700 (PDT)
Message-ID: <31bafcff-e7c2-4b0c-9fd1-8d5283269eb0@smile.fr>
Date: Fri, 12 Jul 2024 22:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240705011114.1313589-1-james.hilliard1@gmail.com>
Content-Language: fr
In-Reply-To: <20240705011114.1313589-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720816314; x=1721421114; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lrR5Z8SBEW3VhzF6t4Q9aqMGryFzLJe3dL6Jau4j/yk=;
 b=DJvA6if063D2H6sXvAQToJ1kvd45ttddJhBC7A+MWNvLvW6Gmat27sPffqGG4ZBNVF
 gyA+OdAVb1ZqyPqVk1e6pJJFHR38OT0+ixUGP5FUR9kG5Zy4t95DI8uSvHder3VdVm2r
 IKnZOHcDZVUwrksCJE19NmXsXARe2Ahp+pmi0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=DJvA6if0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/systemd: enable required
 oomd kernel options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAwNS8wNy8yMDI0IMOgIDAzOjExLCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IEluIG9yZGVyIGZvciBzeXN0ZW1kLW9vbWQgdG8gcnVuIENPTkZJR19QU0kgYW5k
IENPTkZJR19NRU1DRyBtdXN0IGJlCj4gZW5hYmxlZCBpbiB0aGUga2VybmVsIGNvbmZpZy4KPiAK
PiBTZWU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9jb21taXQvZTdiM2Yx
YTZjMzU4ZGQzZWFmMGI1MDU0N2JkNTIxMzBhZDQxMjZhZQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9z
eXN0ZW1kL3N5c3RlbWQvY29tbWl0L2FhMzI5Yjg5MjIzYTc5NzkzY2RlODI4OGIxYmM2ZTkzZGIx
NzQ5MzgKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gYWRkIGxpbmtzIHRvIHJlYWRt
ZSBjb21taXRzCj4gLS0tCj4gIHBhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIHwgNiArKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3N5c3RlbWQvc3lzdGVtZC5tayBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gaW5k
ZXggNmIzNTUzNzIzYy4uNTJmYTM0NDgwNyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQv
c3lzdGVtZC5tawo+ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gQEAgLTQ4MCw2
ICs0ODAsMTAgQEAgZW5kaWYKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9TWVNURU1EX09PTUQpLHkp
Cj4gIFNZU1RFTURfQ09ORl9PUFRTICs9IC1Eb29tZD10cnVlCj4gIFNZU1RFTURfT09NRF9VU0VS
ID0gc3lzdGVtZC1vb20gLTEgc3lzdGVtZC1vb20gLTEgKiAtIC0gLSBzeXN0ZW1kIFVzZXJzcGFj
ZSBPT00gS2lsbGVyCj4gK2RlZmluZSBTWVNURU1EX09PTURfTElOVVhfQ09ORklHX0ZJWFVQUwo+
ICsJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfUFNJKQo+ICsJJChjYWxsIEtDT05G
SUdfRU5BQkxFX09QVCxDT05GSUdfTUVNQ0cpCj4gK2VuZGVmCj4gIGVsc2UKPiAgU1lTVEVNRF9D
T05GX09QVFMgKz0gLURvb21kPWZhbHNlCj4gIGVuZGlmCj4gQEAgLTgwNCw2ICs4MDgsOCBAQCBk
ZWZpbmUgU1lTVEVNRF9MSU5VWF9DT05GSUdfRklYVVBTCj4gIAkkKGNhbGwgS0NPTkZJR19FTkFC
TEVfT1BULENPTkZJR19BVVRPRlM0X0ZTKQo+ICAJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxD
T05GSUdfVE1QRlNfUE9TSVhfQUNMKQo+ICAJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05G
SUdfVE1QRlNfWEFUVFIpCj4gKwo+ICsJJChTWVNURU1EX09PTURfTElOVVhfQ09ORklHX0ZJWFVQ
UykKPiAgZW5kZWYKPiAgCj4gICMgV2UgbmVlZCBhIHZlcnkgbWluaW1hbCBob3N0IHZhcmlhbnQs
IHNvIHdlIGRpc2FibGUgYXMgbXVjaCBhcyBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
