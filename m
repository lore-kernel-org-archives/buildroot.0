Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5CDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15FFE8264A;
	Sat, 12 Mar 2022 20:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtOaB6XWBoFD; Sat, 12 Mar 2022 20:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20D3182612;
	Sat, 12 Mar 2022 20:30:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48A661BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 452DA60E67
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id itu2BIT6dc7Y for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:30:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0325060E63
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:30:26 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dr20so25818664ejc.6
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XeR3w5jy/zmjUdldI43i7V9KNl7RBEzvFUk5HN8pjXk=;
 b=b8nMY5WOHWVsQJ6Mfj5FgEXot1ANZbISVu6r8p7fEfWdgZF9Jik2fvdYwFj8PU1qsU
 VZM2+tEtgvU0yxMaUkDXt2hb5CuA3V34nBPbUUgtKCCDTydJNXGC+4Z+gkcE3kfdEX1W
 mUQL4ovWbml5GjRBzqBxDLYGgQOHHVmf3gUFdzVlP70rKIyoUC4kZcFX4/14685TpHB4
 6VSums1aqxM0GkCoTErj5IWPsjQqYbgX9Y99VgVU+dk0U7jrewhCAbRT3NGTI+gOs96g
 okmM+srlLDOkcYhaStcuM11xi+6ydEvadENus3fcD7ZJDJjayUZceRbp4tRTFAZUBJwj
 1RCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XeR3w5jy/zmjUdldI43i7V9KNl7RBEzvFUk5HN8pjXk=;
 b=Y88t6HQSE1sHmef4121LF2xIxL+a6whFXsMMPEemWWwRupBDtP5p3cUI7mdIj5VcTs
 Yam3cjpXUs0Al2fPdMhpnKLLMEs42zjRBj3EMyh1XbZhOCBL5gcI9WJN5+J6TsguuzBa
 9aIqz+oZ7+9M3flphUFoE4UmN1cB5p6j8KI/kPQ2LavPI9k8pJZ1FRjcJ6GdMKqOprCJ
 zIT7LUDYDvVf7dag1+PQlBXwCO8YNnzVZFcDYh7n7eiSkhuVlD9GQbL1rPisIrJ2oikB
 gQ/1qz3aaVizdq64Sm1JQddMwTPfFsDJ2eVgPzRxNcXB/XKzFqOGktLZj5wbXELnMOuQ
 Hnew==
X-Gm-Message-State: AOAM533EAIACADWdotrZhf1gTpkmUlMZTSSJtlSy4fDmPYjf/++vjjVt
 nyH17fiBdb+8eu6ZD2lUOyXWPg==
X-Google-Smtp-Source: ABdhPJxV5LzOEBMK/CeoumQFmVo9/wdKMGjHtB3ZmMnn2/vOiuMg6WrNTsuyVpvg+ezD11NhRFbjSA==
X-Received: by 2002:a17:907:3f9b:b0:6da:6f2b:4b1c with SMTP id
 hr27-20020a1709073f9b00b006da6f2b4b1cmr13136036ejc.765.1647117025036; 
 Sat, 12 Mar 2022 12:30:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a056402518f00b00416a3194924sm4643069edd.75.2022.03.12.12.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:30:24 -0800 (PST)
Message-ID: <a10d0556-3de3-1981-b8d3-adda49a8d4e5@mind.be>
Date: Sat, 12 Mar 2022 21:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220224154513.220976-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220224154513.220976-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCHv2 1/2] support/testing: TestRust{Bin} use
 ripgrep package for testing
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI0LzAyLzIwMjIgMTY6NDUsIFJvbWFpbiBOYW91ciB3cm90ZToKPiBUZXN0UnVzdCBhbmQg
VGVzdFJ1c3RCaW4gaGFzIGJlZW4gaW50cm9kdWNlZCBhdCB0aGUgdGltZSB3aGVuIHRoZXJlIHdh
cwo+IG5vIGNhcmdvIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgb3IgYW55IHBhY2thZ2UgdXNpbmcg
cnVzdCBjb21waWxlcgo+IChCdWlsZHJvb3QgMjAxOC4wMikuCj4KPiBTaW5jZSB0aGVuIHRoZSBy
aXBncmVwIHBhY2thZ2UgaGFzIGJlZW4gaW50cm9kdWNlZCwgaW5pdGlhbGx5IHVzaW5nCj4gdGhl
IGdlbmVyaWMgcGFja2FnZSBpbmZyYXN0cnVjdHVyZSBhbmQgY29udmVydGVkIGxhdGVyIHRvIHRo
ZSBjYXJnbwo+IHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUuCj4KPiBEdWUgYSByZWNlbnQgY2hhbmdl
IGluIHJ1c3QvY2FyZ28gcmVtb3ZpbmcgdGhlIGNhcmdvIGNvbmZpZyBmaWxlIFsxXQo+IHRoZSB0
ZXN0IFRlc3RSdXN0IGFuZCBUZXN0UnVzdEJpbiBub3cgZmFpbCB0byBjb21waWxlIHNpbmNlIHRo
ZXkgYnVpbGQKPiBhbiBoZWxsby13b3JsZCBjcmF0ZSBvdXRzaWRlIG9mIHRoZSBjYXJnbyBwYWNr
YWdlIGluZnJhc3RydWN0dXJlCj4gd2l0aG91dCB0aGUgY29ycmVjdCBlbnZpcm9ubWVudCBmb3Ig
Y3Jvc3MtY29tcGlsaW5nLgo+Cj4gUmVwbGFjZSB0aGUgJ2hlbGxvLXdvcmxkJyBjcmF0ZSBieSBy
aXBncmVwIHBhY2thZ2UgYW5kIGNoZWNrIGlmIGl0Cj4gY2FuIHJ1biBwcm9wZXJseSBpbiBRZW11
Lgo+Cj4gRml4ZXMgdGVzdHMucGFja2FnZS50ZXN0X3J1c3QuVGVzdFJ1c3RCaW46Cj4gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8yMTE2MjAyNTQ1Cj4K
PiBCdXQgZG9lc24ndCBmaXhlcyB0ZXN0cy5wYWNrYWdlLnRlc3RfcnVzdC5UZXN0UnVzdCBkdWUg
YW5vdGhlciBidWc6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy8yMTE2MjAyNTQ0Cj4KPiBbMV0gYjYzNzg2MzFjMjYwOTc0MjM4Mjk4NGY2ZjdiOTNj
MWQ5ZDJjZGI3OAo+Cj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgo+IENjOiBFcmljIExlIEJpaGFuIDxlcmljLmxlLmJpaGFuLmRldkBmcmVlLmZy
Pgo+IC0tLQo+IHYyOiBubyBjaGFuZ2VzCj4gLS0tCj4gICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X3J1c3QucHkgfCA0OCArKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3J1c3QucHkgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3J1c3QucHkKPiBpbmRleCA4ODRiNDBhNGEzLi5h
MWFiZDIwYzA5IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfcnVzdC5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcnVz
dC5weQo+IEBAIC04LDkgKzgsNiBAQCBpbXBvcnQgaW5mcmEuYmFzZXRlc3QKPiAgIAo+ICAgY2xh
c3MgVGVzdFJ1c3RCYXNlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gICAKPiAtICAgIHRhcmdl
dCA9ICdhcm12Ny11bmtub3duLWxpbnV4LWdudWVhYmloZicKPiAtICAgIGNyYXRlID0gJ2hlbGxv
LXdvcmxkJwo+IC0KPiAgICAgICBkZWYgbG9naW4oc2VsZik6Cj4gICAgICAgICAgIGltZyA9IG9z
LnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvIikKPiAgICAg
ICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFybXY3IiwKPiBAQCAtMTgsNDMgKzE1LDYg
QEAgY2xhc3MgVGVzdFJ1c3RCYXNlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBvcHRpb25zPVsiLWluaXRyZCIsIGltZ10pCj4gICAgICAgICAg
IHNlbGYuZW11bGF0b3IubG9naW4oKQo+ICAgCj4gLSAgICBkZWYgYnVpbGRfdGVzdF9wcm9nKHNl
bGYpOgo+IC0gICAgICAgIGhvc3RkaXIgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgJ2hv
c3QnKQo+IC0gICAgICAgIGVudiA9IG9zLmVudmlyb24uY29weSgpCj4gLSAgICAgICAgZW52WyJV
U0VSIl0gPSAiYnItdXNlciIKPiAtICAgICAgICBlbnZbIlBBVEgiXSA9ICJ7fToiLmZvcm1hdChv
cy5wYXRoLmpvaW4oaG9zdGRpciwgJ2JpbicpKSArIGVudlsiUEFUSCJdCj4gLSAgICAgICAgZW52
WyJDQVJHT19IT01FIl0gPSBvcy5wYXRoLmpvaW4oaG9zdGRpciwgJ3VzcicsICdzaGFyZScsICdj
YXJnbycpCj4gLSAgICAgICAgZW52WyJSVVNUX1RBUkdFVF9QQVRIIl0gPSBvcy5wYXRoLmpvaW4o
aG9zdGRpciwgJ2V0YycsICdydXN0YycpCj4gLSAgICAgICAgY2FyZ28gPSBvcy5wYXRoLmpvaW4o
aG9zdGRpciwgJ2JpbicsICdjYXJnbycpCj4gLSAgICAgICAgd29ya2RpciA9IG9zLnBhdGguam9p
bih0ZW1wZmlsZS5ta2R0ZW1wKHN1ZmZpeD0nLWJyMi10ZXN0aW5nLXJ1c3QnKSwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNlbGYuY3JhdGUpCj4gLSAgICAgICAgbWFuaWZlc3Qg
PSBvcy5wYXRoLmpvaW4od29ya2RpciwgJ0NhcmdvLnRvbWwnKQo+IC0gICAgICAgIHByb2cgPSBv
cy5wYXRoLmpvaW4od29ya2RpciwgJ3RhcmdldCcsIHNlbGYudGFyZ2V0LCAnZGVidWcnLCBzZWxm
LmNyYXRlKQo+IC0KPiAtICAgICAgICBjbWQgPSBbY2FyZ28sICdpbml0JywgJy0tYmluJywgJy0t
dmNzJywgJ25vbmUnLCAnLXZ2Jywgd29ya2Rpcl0KPiAtICAgICAgICByZXQgPSBzdWJwcm9jZXNz
LmNhbGwoY21kLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGRvdXQ9c2VsZi5i
LmxvZ2ZpbGUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0ZGVycj1zZWxmLmIu
bG9nZmlsZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW52PWVudikKPiAtICAg
ICAgICBpZiByZXQgIT0gMDoKPiAtICAgICAgICAgICAgcmFpc2UgU3lzdGVtRXJyb3IoIkNhcmdv
IGluaXQgZmFpbGVkIikKPiAtCj4gLSAgICAgICAgY21kID0gWwo+IC0gICAgICAgICAgICBjYXJn
bywgJ2J1aWxkJywgJy12dicsICctLXRhcmdldCcsIHNlbGYudGFyZ2V0LAo+IC0gICAgICAgICAg
ICAnLS1tYW5pZmVzdC1wYXRoJywgbWFuaWZlc3QKPiAtICAgICAgICBdCj4gLSAgICAgICAgcmV0
ID0gc3VicHJvY2Vzcy5jYWxsKGNtZCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3Rkb3V0PXNlbGYuYi5sb2dmaWxlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dGRlcnI9c2VsZi5iLmxvZ2ZpbGUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVu
dj1lbnYpCj4gLSAgICAgICAgaWYgcmV0ICE9IDA6Cj4gLSAgICAgICAgICAgIHJhaXNlIFN5c3Rl
bUVycm9yKCJDYXJnbyBidWlsZCBmYWlsZWQiKQo+IC0KPiAtICAgICAgICBzaHV0aWwuY29weShw
cm9nLCBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgJ3RhcmdldCcsICd1c3InLCAnYmluJykp
Cj4gLSAgICAgICAgc2VsZi5iLmJ1aWxkKCkKPiAtICAgICAgICBzaHV0aWwucm10cmVlKHdvcmtk
aXIpCj4gLQo+IC0KPiAgIGNsYXNzIFRlc3RSdXN0QmluKFRlc3RSdXN0QmFzZSk6Cj4gICAgICAg
Y29uZmlnID0gXAo+ICAgICAgICAgICAiIiIKPiBAQCAtNjgsMTIgKzI4LDEyIEBAIGNsYXNzIFRl
c3RSdXN0QmluKFRlc3RSdXN0QmFzZSk6Cj4gICAgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQ
SU89eQo+ICAgICAgICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gICAg
ICAgICAgIEJSMl9QQUNLQUdFX0hPU1RfUlVTVEM9eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX1JJ
UEdSRVA9eQo+ICAgICAgICAgICAiIiIKPiAgIAo+ICAgICAgIGRlZiB0ZXN0X3J1bihzZWxmKToK
PiAtICAgICAgICBzZWxmLmJ1aWxkX3Rlc3RfcHJvZygpCj4gICAgICAgICAgIHNlbGYubG9naW4o
KQo+IC0gICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soc2VsZi5jcmF0ZSkKPiArICAgICAgICBzZWxm
LmFzc2VydFJ1bk9rKCJyZyBCdWlsZHJvb3QgL2V0Yy9pc3N1ZSIpCgogwqBJdCBub3cgbG9va3Mg
bW9yZSBsaWtlIHRlc3RfcmlwZ3JlcCB0aGFuIHRlc3RfcnVzdCwgYnV0IE9LLCB3ZSBzdGlsbCBo
YXZlIHRoZSAKcnVzdC1iaW4gYW5kIGZ1bGwgcnVzdCB2YXJpYW50cy4KCgogwqBBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+ICAgCj4gICAKPiAgIGNs
YXNzIFRlc3RSdXN0KFRlc3RSdXN0QmFzZSk6Cj4gQEAgLTkwLDkgKzUwLDkgQEAgY2xhc3MgVGVz
dFJ1c3QoVGVzdFJ1c3RCYXNlKToKPiAgICAgICAgICAgIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIg
aXMgbm90IHNldAo+ICAgICAgICAgICBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDPXkKPiAgICAgICAg
ICAgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9SSVBHUkVQ
PXkKPiAgICAgICAgICAgIiIiCj4gICAKPiAgICAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4gLSAg
ICAgICAgc2VsZi5idWlsZF90ZXN0X3Byb2coKQo+ICAgICAgICAgICBzZWxmLmxvZ2luKCkKPiAt
ICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKHNlbGYuY3JhdGUpCj4gKyAgICAgICAgc2VsZi5hc3Nl
cnRSdW5PaygicmcgQnVpbGRyb290IC9ldGMvaXNzdWUiKQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
