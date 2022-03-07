Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D335C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28D2860F16;
	Mon,  7 Mar 2022 22:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsuzylO6w4go; Mon,  7 Mar 2022 22:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE1B60F13;
	Mon,  7 Mar 2022 22:33:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC971BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8908E40734
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0X3YATlt2S5 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:33:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82B95404F3
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:33:13 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y12so8463349edt.9
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+XxczdiOA9NmJE73J+5+HonBxC5Cg2AfPuCO3bQUjgM=;
 b=JAeIFJYC6Q1ZjmdCkd6cUJ36gwdtK29YdnYfDx3xiDB9DNenQ87FNwfcayompErndy
 y7lWTqPox/LfiNsnpTLASD6JhI1Ld50wDO1xqFq06PbbS6O1jOK0iNoopERM5j47b+ip
 1g+/1V4GgaW4fWPi4p2HGXxWMjVIcgb72K21mKiJ6NzKkPhJA5FZoZ9u8BpmTu8/EG6F
 h5BuDSheJ863GQshjRcCasHFQi9gmBjFi8Ff/MonGyQW6T52rv5USnqa2dEn9/YeTVxv
 b2YDJB7dXxWAUuVWNOyBPNtpr1nK6TwqAXN1ZKbKdkFxXDK/zGqHEft6KNBaAtoAjvaa
 2tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+XxczdiOA9NmJE73J+5+HonBxC5Cg2AfPuCO3bQUjgM=;
 b=JgESUj7lvWYIfjsnJb3ItmG1lN5tkUr6HbKOK5yJ46bNtkthstTNERBVQI5+S8eVPA
 MSxKlkHvUAs3xNXH+MtcVicI+cclpqRQN488Y2nT742LcGIfl1OmfzwQTBUaDqe7I++A
 M0M/2Bj/6SuJyBRSa5lwv8FS0GP5ZNJK0iBfbMy+BosmaXocUtdM1ToleWDkRy6iFRkO
 YdmuPDVHpZ+xAcb8I5DLgYywJcjDnkT7gIwzhQvdcgUKX/s4/aEQfJkGCigEj2Qb2hTp
 vvw7+w3rvisRuKBSHYICTLos4xRS7+bCOzKO2Il7OE5rujDd+K4rhucU8K489DzTbBN0
 ONzw==
X-Gm-Message-State: AOAM5333lMqfrnDA/3QkfBWcNNIOPSMeDA3HzAeuU8G4YDH9ZlEaAVWo
 PDXbRlg5BH4mfsTynpmSrulVGVGQY5ljfA==
X-Google-Smtp-Source: ABdhPJzihYTPwoHmUfcIrhmVRK7p2Jhp7fsCGKkfsweobjRqPidTkGDfGHM1+VtM4ugtws+g4nnyDg==
X-Received: by 2002:a05:6402:d7:b0:413:673:ba2f with SMTP id
 i23-20020a05640200d700b004130673ba2fmr13025221edu.29.1646692391636; 
 Mon, 07 Mar 2022 14:33:11 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a056402060400b00415a1f9a4dasm6777796edv.91.2022.03.07.14.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:33:11 -0800 (PST)
Message-ID: <813a014c-8aae-990e-cd76-f961a9be9bf7@mind.be>
Date: Mon, 7 Mar 2022 23:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>,
 Peter Korsgaard <peter@korsgaard.com>
References: <20220225171148.701977-1-romain.naour@gmail.com>
 <87zgm15yir.fsf@dell.be.48ers.dk>
 <d2685b34-a9d7-3196-ef38-68c59be02d9d@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <d2685b34-a9d7-3196-ef38-68c59be02d9d@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/Makefile.in: year2038 makes time_t
 64-bit for glibc toolchains
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
Cc: Christophe Blaess <christophe.blaess@logilin.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wMy8yMDIyIDIyOjQ5LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gUGV0ZXIs
Cj4gCj4gTGUgMDcvMDMvMjAyMiDDoCAyMDo1NCwgUGV0ZXIgS29yc2dhYXJkIGEgw6ljcml0wqA6
Cj4+Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29t
PiB3cml0ZXM6Cj4+Cj4+ICAgPiBUbyB1c2UgdGltZV90IDY0LWJpdCBmb3IgZ2xpYmMgPj0gMi4z
NCB0b29sY2hhaW5zIHdlIGhhdmUgdG8gc2V0IGJvdGgKPj4gICA+IF9GSUxFX09GRlNFVF9CSVRT
PTY0IGFuZCBfVElNRV9CSVRTPTY0IGZvciBnbGliYyB0b29sY2hhaW5zLiBCdWlsZHJvb3QKPj4g
ICA+IGFscmVhZHkgZGVmaW5lIF9GSUxFX09GRlNFVF9CSVRTPTY0IHNpbmNlIDIwMDggWzFdIGJl
Zm9yZSB0aGUgZmlyc3QKPj4gICA+IHJlbGVhc2UgdGFnIDIwMDkuMDIuCj4+Cj4+ICAgPiBfVElN
RV9CSVRTIGlzIG5vdCBuZWVkZWQgZm9yIG11c2wgbGliYyBzaW5jZSBpdCBhbHJlYWR5IHllYXIy
MDM4Cj4+ICAgPiByZWFkeSBbMl0uCj4+Cj4+ICAgPiBUaGUgdWNsaWJjLW5nIGxpYmMgb25seSBz
dXBwb3J0IHRpbWVfdCAzMi1iaXQgKGxvbmcgaW50KSBzbyBpdCB3aWxsIGJlCj4+ICAgPiBhZmZl
Y3RlZCBieSB0aGUgeWVhcjIwMzggaXNzdWUgWzNdLgo+Pgo+PiAgID4gRml4ZXMgKGluIEZyZW5j
aCwgY2hhcHRlciBCdWlsZHJvb3QgMjAyMiBhbmQgR2xpYkMpOgo+PiAgID4gaHR0cHM6Ly93d3cu
YmxhZXNzLmZyL2NocmlzdG9waGUvMjAzOAo+Pgo+PiAgID4gUnVudGltZSB0ZXN0ZWQgd2l0aCBx
ZW11X2FybV92ZXhwcmVzc19kZWZjb25maWcgYW5kIHRoZSBCb290bGluIGdsaWJjCj4+ICAgPiBi
bGVlZGluZy1lZGdlIDIwMjEuMTEtMSB0b29sY2hhaW4uCj4+Cj4+ICAgPiBCZWZvcmU6Cj4+ICAg
PiAgIyBkYXRlCj4+ICAgPiAgVHVlIEphbiAxOSAwMzoxNDowNyBVVEMgMjAzOAo+PiAgID4gICMg
ZGF0ZQo+PiAgID4gIFRodSBKYW4gIDEgMDA6MDA6MDAgVVRDIDE5NzAKPj4KPj4gICA+IEFmdGVy
Ogo+PiAgID4gICMgZGF0ZQo+PiAgID4gIFR1ZSBKYW4gMTkgMDM6MTQ6MDcgVVRDIDIwMzgKPj4g
ICA+ICAjIGRhdGUKPj4gICA+ICBUdWUgSmFuIDE5IDAzOjE0OjA4IFVUQyAyMDM4Cj4+ICAgPiAg
IyBkYXRlCj4+ICAgPiAgVHVlIEphbiAxOSAwMzoxNDowOSBVVEMgMjAzOAo+Pgo+PiBBaGgsIGdv
b2QgY2F0Y2guIE1heWJlIHNvbWV0aGluZyB0byBhZGQgYSBydW50aW1lIHRlc3QgZm9yPwo+Pgo+
PiBDb21taXR0ZWQsIHRoYW5rcy4KPiAKPiBTb3JyeSBidXQgSSBndWVzcyB0aGlzIHBhdGNoIG5l
ZWRzIG1vcmUgdGVzdGluZy4KPiAKPj4KPj4gICA+IFsxXSA2MGI1ZWVlNzZlZGZhMTUzZWYxMThk
Mjc4OGM3NGFjOGRhMTQ5N2EwCj4+ICAgPiBbMl0gaHR0cHM6Ly9naXQubXVzbC1saWJjLm9yZy9j
Z2l0L211c2wvdHJlZS9pbmNsdWRlL2FsbHR5cGVzLmguaW4/aD12MS4yLjIjbjMKPj4gICA+IFsz
XSBodHRwczovL2NnaXQudWNsaWJjLW5nLm9yZy9jZ2kvY2dpdC91Y2xpYmMtbmcuZ2l0L3RyZWUv
aW5jbHVkZS90aW1lLmg/aD12MS4wLjQwI243NQo+PiAgID4gICAgIGh0dHBzOi8vY2dpdC51Y2xp
YmMtbmcub3JnL2NnaS9jZ2l0L3VjbGliYy1uZy5naXQvdHJlZS9saWJjL3N5c2RlcHMvbGludXgv
Y29tbW9uL2JpdHMvdHlwZXMuaD9oPXYxLjAuNDAjbjEwNgo+Pgo+PiAgID4gU2lnbmVkLW9mZi1i
eTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiAgID4gQ2M6IENocmlz
dG9waGUgQmxhZXNzIDxjaHJpc3RvcGhlLmJsYWVzc0Bsb2dpbGluLmZyPgo+PiAgID4gLS0tCj4+
ICAgPiAgcGFja2FnZS9NYWtlZmlsZS5pbiB8IDIgKy0KPj4gICA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gICA+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL01ha2VmaWxlLmluIGIvcGFja2FnZS9NYWtlZmlsZS5pbgo+PiAgID4gaW5kZXggNTA4ZWE3
YzM2Ni4uY2RlMDUwY2E4MiAxMDA2NDQKPj4gICA+IC0tLSBhL3BhY2thZ2UvTWFrZWZpbGUuaW4K
Pj4gICA+ICsrKyBiL3BhY2thZ2UvTWFrZWZpbGUuaW4KPj4gICA+IEBAIC0xNjcsNyArMTY3LDcg
QEAgZWxzZSBpZmVxICgkKEJSMl9GT1JUSUZZX1NPVVJDRV8yKSx5KQo+PiAgID4gIFRBUkdFVF9I
QVJERU5FRCArPSAtRF9GT1JUSUZZX1NPVVJDRT0yCj4+ICAgPiAgZW5kaWYKPj4gICAKPj4gICA+
IC1UQVJHRVRfQ1BQRkxBR1MgKz0gLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9T
T1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NAo+PiAgID4gK1RBUkdFVF9DUFBGTEFHUyArPSAt
RF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9C
SVRTPTY0IC1EX1RJTUVfQklUUz02NAo+IAo+IEkgbm90aWNlZCB0aGF0IGdsaWJjIDIuMzQgc3Rv
cCB0aGUgYnVpbGQgaWYgX1RJTUVfQklUUyBpcyBzZXQgd2l0aG91dAo+IF9GSUxFX09GRlNFVF9C
SVRTLgo+IFdoYXQgaWYgc29tZXRoaW5nIChidWlsZCBzeXN0ZW0pIHVuc2V0IF9GSUxFX09GRlNF
VF9CSVRTID8KCiAgVGhlbiB0aGVyZSdzIHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoYXQgcGFja2Fn
ZSBhbmQgaXQgbmVlZHMgdG8gYmUgZml4ZWQuCgo+IFRoZXJlIGlzIHNvbWV0aGluZyB3ZWlyZCB3
aXRoIGxpYnpsaWIgcGFja2FnZS4KCiAgZ3pndXRzLmggaGFzIHRoaXM6CgojaWZkZWYgX0xBUkdF
RklMRTY0X1NPVVJDRQojICBpZm5kZWYgX0xBUkdFRklMRV9TT1VSQ0UKIyAgICBkZWZpbmUgX0xB
UkdFRklMRV9TT1VSQ0UgMQojICBlbmRpZgojICBpZmRlZiBfRklMRV9PRkZTRVRfQklUUwojICAg
IHVuZGVmIF9GSUxFX09GRlNFVF9CSVRTCiMgIGVuZGlmCiNlbmRpZgoKICBXaHksIEkgaGF2ZSBu
byBpZGVhLi4uCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IEkgc3VnZ2VzdCB0byBhcHBseSBm
b3IgbmV4dCBmaXJzdCBhbmQgYmFja3BvcnQgaXQgbGF0dGVyIHRvIHRoZSBzdGFibGUgYnJhbmNo
Lgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPj4gICA+ICBUQVJHRVRfQ0ZMQUdT
ID0gJChUQVJHRVRfQ1BQRkxBR1MpICQoVEFSR0VUX0FCSSkgJChUQVJHRVRfT1BUSU1JWkFUSU9O
KSAkKFRBUkdFVF9ERUJVR0dJTkcpICQoVEFSR0VUX0hBUkRFTkVEKQo+PiAgID4gIFRBUkdFVF9D
WFhGTEFHUyA9ICQoVEFSR0VUX0NGTEFHUykKPj4gICA+ICBUQVJHRVRfRkNGTEFHUyA9ICQoVEFS
R0VUX0FCSSkgJChUQVJHRVRfT1BUSU1JWkFUSU9OKSAkKFRBUkdFVF9ERUJVR0dJTkcpCj4+ICAg
PiAtLQo+Pgo+PiAgID4gMi4zNS4xCj4+Cj4+ICAgPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiAgID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiAg
ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gICA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Pgo+Pgo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
