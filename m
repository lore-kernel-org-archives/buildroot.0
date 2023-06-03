Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780DDC7EE24
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06D9C42058;
	Sat,  3 Jun 2023 19:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D9C42058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eF21aZEyOQtW; Sat,  3 Jun 2023 19:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C603E4203B;
	Sat,  3 Jun 2023 19:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C603E4203B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB66C1BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B11EC611E0
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B11EC611E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDZlZ2L5y4Ef for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:12:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D7EC60F0F
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D7EC60F0F
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:12:03 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso526676866b.1
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 12:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685819522; x=1688411522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dTQnE1U0w0BTRYqFwYfLlJoVGnswm2sAKXgz3xyZ2Xw=;
 b=Zm8vNLFx71VQtjVfOveT/9+SafmnAyDAllv9qHUjTZky6VFdfFVxGtYIC/Tcu2e4ui
 urMxE+u25Nkyv+4hLyBAjrEK22Hd3Pq10DvSa30MciAqM+JTU+zf8pQfpPWcuqrXkfY8
 PU+zayc6vrHCYdOSWbASEi25qeEw2rrJZuRWkXpX1wKC77hfJQYj0JJeZZp7fTATYPY3
 +HdgYGSOWxv0ne1HGYv6OSFzNjnFwJCCjCChhuGNUlUOBUYDJfTlcIs5eq3FGVROqts2
 lU6Rt4CPMXMXRbdjHzPm1a2YR1gOUw8p5QREMR9DkV4RQ3zPb6ZfalAP3NqMO54KO9B1
 9u8A==
X-Gm-Message-State: AC+VfDyc+Dh1mxdjA/ME3jNFAqaaXQW4IMqkn7ij86HgsOgOF7OqlNqb
 Pp2M5f6WVA5NfbuH8fNvcwgjcQ==
X-Google-Smtp-Source: ACHHUZ54HOk2yaXOEI6BtTJd+TTppVMmBrLbN3lDyRTgDaSbeayIT8ABuU6urMsmGSQkEx6a0grNtg==
X-Received: by 2002:a17:907:3182:b0:974:216f:dc36 with SMTP id
 xe2-20020a170907318200b00974216fdc36mr2294925ejb.17.1685819521754; 
 Sat, 03 Jun 2023 12:12:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a170906851500b00965e9a23f2bsm2229901ejx.134.2023.06.03.12.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:12:00 -0700 (PDT)
Message-ID: <c1f13436-793b-ac61-07ff-335ca5c43a7b@mind.be>
Date: Sat, 3 Jun 2023 21:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>,
 Peter Korsgaard <peter@korsgaard.com>, Romain Naour <romain.naour@gmail.com>
References: <20230527211144.2136991-1-romain.naour@gmail.com>
 <87v8gctidk.fsf@dell.be.48ers.dk>
 <9ef183c1-d6cf-5bbf-af7a-da7911195aa7@smile.fr>
In-Reply-To: <9ef183c1-d6cf-5bbf-af7a-da7911195aa7@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685819522; x=1688411522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dTQnE1U0w0BTRYqFwYfLlJoVGnswm2sAKXgz3xyZ2Xw=;
 b=gBe78aIaqzhFflRHFlLsJmo6CVGLt4dKX64ua5HPu5zbxh0n9TbY2F+jhkel+apL/X
 uC5tndvJvhOZpA7argU2yCj3DE2ycCzXX1C/l6Afv6KtnkqCo2PnKyVM8Ae6+opnpaiv
 cw0wGdpbx31nvpZRa5CeO9lHN/VkoetmSaCTZ1uzNhkAAFPiZSca5eASMql74WPGg3sl
 7mHfYzoI7EbCLUXqp4Q2crQzHcF7zBydDy2aX3JnPoll6k07HAUK7U/qoruh9KE+DqSN
 MXTDQirIneMN9cgcg4UFd0FrceSXdifr3uWyMGJdn63rUXPlFzZwKXhXOjl/iHZXdVqu
 ryKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gBe78aIa
Subject: Re: [Buildroot] [PATCH] support/dependencies: requires cmake >= 3.19
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMS8wNS8yMDIzIDE4OjIxLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gUGV0ZXIs
Cj4gCj4gTGUgMjgvMDUvMjAyMyDDoCAyMDozNCwgUGV0ZXIgS29yc2dhYXJkIGEgw6ljcml0wqA6
Cj4+Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29t
PiB3cml0ZXM6Cj4+Cj4+ICAgPiBsaWJqeGwgcmVxdWlyZXMgY21ha2UgMy4xOSBzaW5jZSB2ZXJz
aW9uIHYwLjcgZHVlIHRvIHRoZQo+PiAgID4gbmV3IGJlaGF2aW9yIG9mIGNtYWtlIFsxXS4KPj4K
Pj4gICA+IC0tIENvbmZpZ3VyaW5nIGRvbmUKPj4gICA+IENNYWtlIEVycm9yIGF0IGNtYWtlL0Zp
bmRMQ01TMi5jbWFrZTo0MCAoYWRkX2xpYnJhcnkpOgo+PiAgID4gICBJTlRFUkZBQ0VfTElCUkFS
WSB0YXJnZXRzIG1heSBvbmx5IGhhdmUgd2hpdGVsaXN0ZWQgcHJvcGVydGllcy4gIFRoZQo+PiAg
ID4gICBwcm9wZXJ0eSAiSU5DTFVERV9ESVJFQ1RPUklFUyIgaXMgbm90IGFsbG93ZWQuCj4+ICAg
PiBDYWxsIFN0YWNrIChtb3N0IHJlY2VudCBjYWxsIGZpcnN0KToKPj4gICA+ICAgdGhpcmRfcGFy
dHkvQ01ha2VMaXN0cy50eHQ6MTE0IChmaW5kX3BhY2thZ2UpCj4+Cj4+ICAgPiBUaGUgcG9ydGFi
aWxpdHkgaXNzdWUgaGFzIGFscmVhZHkgYmVlbiByZXBvcnRlZCB1cHN0cmVhbSBbMl0uCj4+Cj4+
ICAgPiBGaXhlczoKPj4gICA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2pvYnMvNDMyMjgxOTA5NQo+Pgo+PiAgID4gWzFdIGh0dHBzOi8vZ2l0bGFiLmtpdHdh
cmUuY29tL2NtYWtlL2NtYWtlLy0vY29tbWl0L2FmYjk5ODcwNGU2N2QzZDNjZTViMjRjMTEyY2Iw
NmU3NzBmY2E3OGQKPj4gICA+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vbGlianhsL2xpYmp4bC9p
c3N1ZXMvMTQyNQo+Pgo+PiAgID4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4u
bmFvdXJAZ21haWwuY29tPgo+PiAgID4gQ2M6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+
Cj4+ICAgPiAtLS0KPj4gICA+IFRoaXMgd2lsbCBpbmNyZWFzZSB0aGUgYnVpbGQgdGltZSBpbiBn
aXRsYWItY2kgc2luY2UKPj4gICA+IG91ciBkb2NrZXIgaW1hZ2UgcHJvdmlkZSBjbWFrZSAzLjE4
LgoKICBXZSBjb3VsZCBnZXQgY21ha2UgMy4yNSBmcm9tIGJ1bGxzZXllLWJhY2twb3J0cy4KCgo+
PiBOb3Qgb25seSB0aGF0LCBhbHNvIHVzZXJzIG9uIEUuRy4gRGViaWFuIHN0YWJsZS4gTGlianhs
IHdhcyBhZGRlZCBiYWNrCj4+IGluIE5vdmVtYmVyLCBzbyB3ZSB3aWxsIGFsc28gbmVlZCB0byBi
YWNrcG9ydCB0aGlzIHRvIDIwMjMuMDIueCA6Lwo+Pgo+PiBEbyB3ZSBoYXZlIGFueSBhbHRlcm5h
dGl2ZXM/Cj4+Cj4gCj4gTWF5YmUgd2UgaGF2ZSB0byBjaGFuZ2UgdGhlIHJ1bGUgdG8gdXBkYXRl
IHRoZSBjbWFrZSBtaW5pbXVtIHZlcnNpb24uCj4gCj4gV2UgdXBkYXRlZCB0aGUgY21ha2UgbWlu
aW11bSB3aGVuIGF0IGxlYXN0IG9uZSBwYWNrYWdlIHJlcXVpcmVkIGEgbmV3IGNtYWtlIHZlcnNp
b246Cj4gCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29t
bWl0L2VlODYwY2UzZGMzZGFkYTRlZTRhZjQxZGQwZDBlZWU3YzA0ODlhMjgKPiAKPiBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvM2FiOGFlZmE4N2Y5
ZTZiYzQ1MWU5OGI4OWQ2M2QwMThmYWM2MDNkZgo+IAo+IEluIHN1cHBvcnQvZGVwZW5kZW5jaWVz
L2NoZWNrLWhvc3QtY21ha2UubWsgd2UgY2FuIGRvIHNvbWV0aGluZyBsaWtlCj4gKHNpbXBsZSBi
dXQgbm90IGdyZWF0Li4uKToKPiAKPiBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQkpYTCkseSkKPiBC
UjJfQ01BS0VfVkVSU0lPTl9NSU4gPSAzLjE5Cj4gZWxzZQo+IEJSMl9DTUFLRV9WRVJTSU9OX01J
TiA9IDMuMTgKPiBlbmRpZgo+IAo+IG9yIGFkZCBhIG5ldyBLY29uZmlnIEJSMl9IT1NUX0NNQUtF
X0FUX0xFQVNUXzMuMTkgYW5kIG1ha2UgQlIyX0NNQUtFX1ZFUlNJT05fTUlOCj4gY29uZmlndXJh
YmxlIChub3QgZ3JlYXQgZWl0aGVyKS4KCiAgSSBob25lc3RseSB0aGluayB0aGF0IHN1Y2ggYW4g
b3B0aW9uIHdvdWxkbid0IGJlIGEgYmFkIGlkZWEuIEl0IHdvdWxkIGFsbG93IHVzIAp0byBsb3dl
ciB0aGUgYWJzb2x1dGUgbWluaW11bSB2ZXJzaW9uIGFnYWluIChhdCBsZWFzdCBhIGJpdCwgYmFz
ZWQgb24gdGhlIGxhc3QgCnVwZGF0ZSBvciB0d28pLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
