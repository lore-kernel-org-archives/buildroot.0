Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B82C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5047984276;
	Tue, 15 Mar 2022 21:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9U-6E3hmRiSa; Tue, 15 Mar 2022 21:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B42FE8420A;
	Tue, 15 Mar 2022 21:13:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73BAB1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F76340359
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvV08mCQwjnk for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:13:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C82040103
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:13:19 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id d10so234584eje.10
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vvPvZCoQ4dYXSoCrpS0QvhAKeCoavEBnnQmghXbUGKo=;
 b=Yly79gk1COmCUOmJcSzT/07mL0PdghL4x1qlM8IFmGVA3B5r9F0O3MNftXtG+ufvfO
 mEKS8fwtXCJj4EXjpLz8xgwur7wzH9QPM2l10NBJe/mtJkNoUntb0sLWCeQ1Df27wjFC
 3442AmewnK+2RkFLAuM/AW9chf1aZTI6vrAjzyf8fE79fNObBV3Oc/QdHrn6b416JcmF
 QXFEpyCkZ9ka/fADqjTg1rUZybwK7kk44lLZGxf5dszJ1c9XGAfERn89v+iH7bZFpVYY
 bD8pnrwNhrb6BVE67xpJCpB7WpeH2cwaXMACxQ8n8YoLRECph5zAa4k3EbOlWVuqc0ne
 GfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vvPvZCoQ4dYXSoCrpS0QvhAKeCoavEBnnQmghXbUGKo=;
 b=HoGTOzHPj+XjVmUHP8SZKzdkS2oNo9aRgvQPkoyIBMiGHQUUdwNs5ENKji/hVHJ8iV
 qNkBlsr/ryz7lF6ir9cCIOm6r+hmENsKDrgxuhS/1phvB9NNwUPFi1l0hPU/5Bs6Ad/o
 cty+OqHXeIvgc0DcA7nFUedyHzxETdFE07kkJgOjsLG+Pvl6yyW82xin23haKIgx4Rld
 xHXmc0ZDObtlaS9NvBIRo1hpb+7No8QVNcckwXaqXlZ2mqFuo7/HF4JHFJ+CkLSQSV0M
 ybzOY1w96BSJSABQ2qDKxyTbBTF5CFa6aTzSlKU5dDZnaqFXfDrMeieG41gFXjLdnDR2
 A/sg==
X-Gm-Message-State: AOAM533fOjoVlxooF/x4cpkSYCcA6P865ZpTrPNrcAgBn/exLqkl1uxK
 vhaQHekgPw5bF6Gc1cn5MC3/rg==
X-Google-Smtp-Source: ABdhPJy0mQXhq2/zs0FT34+teWBIHkIibDsEkmBLfuHBeeYENuaOlRI7Zx70zhfP9170lnPkDZyjMA==
X-Received: by 2002:a17:906:7210:b0:6d6:7881:1483 with SMTP id
 m16-20020a170906721000b006d678811483mr24004544ejk.227.1647378797948; 
 Tue, 15 Mar 2022 14:13:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a170906859600b006daa190edb6sm51346ejx.224.2022.03.15.14.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:13:17 -0700 (PDT)
Message-ID: <3897f71d-5622-b118-09a7-b23da8eb87c7@mind.be>
Date: Tue, 15 Mar 2022 22:13:16 +0100
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
PgoKIMKgVGhpcyBpbnRyb2R1Y2VkIGEgZmV3IGZsYWtlOCBlcnJvcnMsIHdoaWNoIEkgZml4ZWQg
bm93LiBJbiB0aGUgZnV0dXJlOiBydW4gCmZsYWtlOCEgKEkgYWxzbyBhbHdheXMgZm9yZ2V0IDot
KSkKCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgo+IC0tLQo+IHYyOiBubyBjaGFuZ2VzCj4gLS0t
Cj4gICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3J1c3QucHkgfCA0OCArKy0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3J1c3QucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3J1
c3QucHkKPiBpbmRleCA4ODRiNDBhNGEzLi5hMWFiZDIwYzA5IDEwMDY0NAo+IC0tLSBhL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcnVzdC5weQo+ICsrKyBiL3N1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcnVzdC5weQo+IEBAIC04LDkgKzgsNiBAQCBpbXBvcnQg
aW5mcmEuYmFzZXRlc3QKPiAgIAo+ICAgY2xhc3MgVGVzdFJ1c3RCYXNlKGluZnJhLmJhc2V0ZXN0
LkJSVGVzdCk6Cj4gICAKPiAtICAgIHRhcmdldCA9ICdhcm12Ny11bmtub3duLWxpbnV4LWdudWVh
YmloZicKPiAtICAgIGNyYXRlID0gJ2hlbGxvLXdvcmxkJwo+IC0KPiAgICAgICBkZWYgbG9naW4o
c2VsZik6Cj4gICAgICAgICAgIGltZyA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1h
Z2VzIiwgInJvb3Rmcy5jcGlvIikKPiAgICAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9
ImFybXY3IiwKPiBAQCAtMTgsNDMgKzE1LDYgQEAgY2xhc3MgVGVzdFJ1c3RCYXNlKGluZnJhLmJh
c2V0ZXN0LkJSVGVzdCk6Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRpb25zPVsi
LWluaXRyZCIsIGltZ10pCj4gICAgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQo+ICAgCj4g
LSAgICBkZWYgYnVpbGRfdGVzdF9wcm9nKHNlbGYpOgo+IC0gICAgICAgIGhvc3RkaXIgPSBvcy5w
YXRoLmpvaW4oc2VsZi5idWlsZGRpciwgJ2hvc3QnKQo+IC0gICAgICAgIGVudiA9IG9zLmVudmly
b24uY29weSgpCj4gLSAgICAgICAgZW52WyJVU0VSIl0gPSAiYnItdXNlciIKPiAtICAgICAgICBl
bnZbIlBBVEgiXSA9ICJ7fToiLmZvcm1hdChvcy5wYXRoLmpvaW4oaG9zdGRpciwgJ2JpbicpKSAr
IGVudlsiUEFUSCJdCj4gLSAgICAgICAgZW52WyJDQVJHT19IT01FIl0gPSBvcy5wYXRoLmpvaW4o
aG9zdGRpciwgJ3VzcicsICdzaGFyZScsICdjYXJnbycpCj4gLSAgICAgICAgZW52WyJSVVNUX1RB
UkdFVF9QQVRIIl0gPSBvcy5wYXRoLmpvaW4oaG9zdGRpciwgJ2V0YycsICdydXN0YycpCj4gLSAg
ICAgICAgY2FyZ28gPSBvcy5wYXRoLmpvaW4oaG9zdGRpciwgJ2JpbicsICdjYXJnbycpCj4gLSAg
ICAgICAgd29ya2RpciA9IG9zLnBhdGguam9pbih0ZW1wZmlsZS5ta2R0ZW1wKHN1ZmZpeD0nLWJy
Mi10ZXN0aW5nLXJ1c3QnKSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlbGYu
Y3JhdGUpCj4gLSAgICAgICAgbWFuaWZlc3QgPSBvcy5wYXRoLmpvaW4od29ya2RpciwgJ0Nhcmdv
LnRvbWwnKQo+IC0gICAgICAgIHByb2cgPSBvcy5wYXRoLmpvaW4od29ya2RpciwgJ3RhcmdldCcs
IHNlbGYudGFyZ2V0LCAnZGVidWcnLCBzZWxmLmNyYXRlKQo+IC0KPiAtICAgICAgICBjbWQgPSBb
Y2FyZ28sICdpbml0JywgJy0tYmluJywgJy0tdmNzJywgJ25vbmUnLCAnLXZ2Jywgd29ya2Rpcl0K
PiAtICAgICAgICByZXQgPSBzdWJwcm9jZXNzLmNhbGwoY21kLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdGRvdXQ9c2VsZi5iLmxvZ2ZpbGUsCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0ZGVycj1zZWxmLmIubG9nZmlsZSwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZW52PWVudikKPiAtICAgICAgICBpZiByZXQgIT0gMDoKPiAtICAgICAgICAg
ICAgcmFpc2UgU3lzdGVtRXJyb3IoIkNhcmdvIGluaXQgZmFpbGVkIikKPiAtCj4gLSAgICAgICAg
Y21kID0gWwo+IC0gICAgICAgICAgICBjYXJnbywgJ2J1aWxkJywgJy12dicsICctLXRhcmdldCcs
IHNlbGYudGFyZ2V0LAo+IC0gICAgICAgICAgICAnLS1tYW5pZmVzdC1wYXRoJywgbWFuaWZlc3QK
PiAtICAgICAgICBdCj4gLSAgICAgICAgcmV0ID0gc3VicHJvY2Vzcy5jYWxsKGNtZCwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Rkb3V0PXNlbGYuYi5sb2dmaWxlLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdGRlcnI9c2VsZi5iLmxvZ2ZpbGUsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVudj1lbnYpCj4gLSAgICAgICAgaWYgcmV0ICE9IDA6
Cj4gLSAgICAgICAgICAgIHJhaXNlIFN5c3RlbUVycm9yKCJDYXJnbyBidWlsZCBmYWlsZWQiKQo+
IC0KPiAtICAgICAgICBzaHV0aWwuY29weShwcm9nLCBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRp
ciwgJ3RhcmdldCcsICd1c3InLCAnYmluJykpCj4gLSAgICAgICAgc2VsZi5iLmJ1aWxkKCkKPiAt
ICAgICAgICBzaHV0aWwucm10cmVlKHdvcmtkaXIpCj4gLQo+IC0KPiAgIGNsYXNzIFRlc3RSdXN0
QmluKFRlc3RSdXN0QmFzZSk6Cj4gICAgICAgY29uZmlnID0gXAo+ICAgICAgICAgICAiIiIKPiBA
QCAtNjgsMTIgKzI4LDEyIEBAIGNsYXNzIFRlc3RSdXN0QmluKFRlc3RSdXN0QmFzZSk6Cj4gICAg
ICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQo+ICAgICAgICAgICAjIEJSMl9UQVJHRVRf
Uk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gICAgICAgICAgIEJSMl9QQUNLQUdFX0hPU1RfUlVTVEM9
eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX1JJUEdSRVA9eQo+ICAgICAgICAgICAiIiIKPiAgIAo+
ICAgICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKPiAtICAgICAgICBzZWxmLmJ1aWxkX3Rlc3RfcHJv
ZygpCj4gICAgICAgICAgIHNlbGYubG9naW4oKQo+IC0gICAgICAgIHNlbGYuYXNzZXJ0UnVuT2so
c2VsZi5jcmF0ZSkKPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJyZyBCdWlsZHJvb3QgL2V0
Yy9pc3N1ZSIpCj4gICAKPiAgIAo+ICAgY2xhc3MgVGVzdFJ1c3QoVGVzdFJ1c3RCYXNlKToKPiBA
QCAtOTAsOSArNTAsOSBAQCBjbGFzcyBUZXN0UnVzdChUZXN0UnVzdEJhc2UpOgo+ICAgICAgICAg
ICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gICAgICAgICAgIEJSMl9QQUNL
QUdFX0hPU1RfUlVTVEM9eQo+ICAgICAgICAgICBCUjJfUEFDS0FHRV9IT1NUX1JVU1Q9eQo+ICsg
ICAgICAgIEJSMl9QQUNLQUdFX1JJUEdSRVA9eQo+ICAgICAgICAgICAiIiIKPiAgIAo+ICAgICAg
IGRlZiB0ZXN0X3J1bihzZWxmKToKPiAtICAgICAgICBzZWxmLmJ1aWxkX3Rlc3RfcHJvZygpCj4g
ICAgICAgICAgIHNlbGYubG9naW4oKQo+IC0gICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soc2VsZi5j
cmF0ZSkKPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJyZyBCdWlsZHJvb3QgL2V0Yy9pc3N1
ZSIpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
