Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0C6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 109E060BAD;
	Wed, 27 Apr 2022 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LO50LXZAAWX8; Wed, 27 Apr 2022 19:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18BE260A75;
	Wed, 27 Apr 2022 19:40:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 697FF1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 576934010D
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7X80WUXHkMG for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:40:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45F8E400BA
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:40:29 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id l7so5456980ejn.2
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FWKY4Bx/SHNkF7yhj+Lp4BawbJJ7fuytJHoTU0vId7M=;
 b=YROVFYab51+VU4MwhNWDuJePN0QVwnBTqGEyawtlz6tWi2DbxJOkEUtCfafkqRg0Xa
 nLjjrRVZ1G8NYLzjuayud1AxmT4qlud5m+Nqna1OEdbAw3wh0SuiBKu9F5567G3RwA/9
 N2zRNn3HZXamUqfhsIxLYnV+ImY5cDUXS8TnKIUO4YSg3kxZ0kPFFu40ErEe7KD3p26p
 4wN6PaSUtQiZU6RF5Z27hrABFKA/CV/YQITJuTH4vws/EmaAmWZVai4+z1Mwx+vM3YEg
 /2UOYxNTFIler3myD8FeKNjhvUpRAkW39mE0a4jCsRKaVLnNCu+WCK1Q1CPLqIqstwfS
 D7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FWKY4Bx/SHNkF7yhj+Lp4BawbJJ7fuytJHoTU0vId7M=;
 b=cyC+lJWFRwnGDvpwb+sN5S7W/NNLhZIerF4qU++I5DYBrdRjNNgulxdi9STumyfR1B
 OoNCVVmSIjB5O2vlnb3n3Rz0CZRQGtXAEMfS5ZiSWPi9XERLTkMGzLvpPxQaLmRrRR+t
 sMov+9FKRWpqnD8VZeKcz0e/gdxsV0CUHOLro+5aPQCmRiVEU8SwRGsRQUnSBB4P+or8
 iH45mJqnBE6vDE2eDjLmIv6kc2PxGQRho2iIg17cJu8ErX9Enic7shoDCBUd8zaq4hGA
 lm0IZfXGem+zay+nFkgcIog1Wio/lQm+Or0Ag3fOSmn7iXdvQfh8+1x4HH5fEo5n1HRY
 8fQQ==
X-Gm-Message-State: AOAM533ewaEoX4eRU6QUznk4bC6P0MIrlh0QR+jLy2NqakJcEDBrhRRE
 lXuDVGYbSsE1+MFv/fnP5Tq4bQ==
X-Google-Smtp-Source: ABdhPJxnEXkhXSGhqcrR3xcAFVUP+oSlML2gXk32PJnwv2B4St91ry1QiINhkJ7S/PxT6WhI2ML05A==
X-Received: by 2002:a17:907:9803:b0:6db:ab21:738e with SMTP id
 ji3-20020a170907980300b006dbab21738emr27592023ejc.112.1651088427597; 
 Wed, 27 Apr 2022 12:40:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a170906380a00b006a68610908asm7174616ejc.24.2022.04.27.12.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:40:27 -0700 (PDT)
Message-ID: <af12efc9-608b-74e6-46a7-6ea242c7d88f@mind.be>
Date: Wed, 27 Apr 2022 21:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
References: <20220427094608.16698-1-etienne.carriere@linaro.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427094608.16698-1-etienne.carriere@linaro.org>
Subject: Re: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.17.0
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
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8wNC8yMDIyIDExOjQ1LCBFdGllbm5lIENhcnJpZXJlIHdyb3RlOgo+IEJ1bXAgT1At
VEVFIE9TIHBhY2thZ2UgdmVyc2lvbiB0byBPUC1URUUgcmVsZWFzZSAzLjE3LjAuCj4gCj4gQ2M6
IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFyby5vcmc+CgogIEFw
cGxpZWQgc2VyaWVzIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAt
LS0KPiAgIGJvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluICAgICB8IDQgKystLQo+ICAgYm9vdC9vcHRl
ZS1vcy9vcHRlZS1vcy5oYXNoIHwgNCArKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9D
b25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+IGluZGV4IDMwYjZmNjI0MzQuLmZi
OGExODlhNzUgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KPiArKysgYi9i
b290L29wdGVlLW9zL0NvbmZpZy5pbgo+IEBAIC0xOCw3ICsxOCw3IEBAIGNob2ljZQo+ICAgCSAg
U2VsZWN0IHRoZSB2ZXJzaW9uIG9mIE9QLVRFRSBPUyB5b3Ugd2FudCB0byB1c2UKPiAgIAo+ICAg
Y29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNUCj4gLQlib29sICIzLjE2LjAiCj4gKwli
b29sICIzLjE3LjAiCj4gICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX0FSQ0hf
U1VQUE9SVFMKPiAgIAlzZWxlY3QgQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZ
UFRPR1JBUEhZCj4gICAJaGVscAo+IEBAIC01Miw3ICs1Miw3IEBAIGVuZGlmCj4gICAKPiAgIGNv
bmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX1ZFUlNJT04KPiAgIAlzdHJpbmcKPiAtCWRlZmF1bHQg
IjMuMTYuMCIJaWYgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QKPiArCWRlZmF1bHQgIjMuMTcu
MCIJaWYgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QKPiAgIAlkZWZhdWx0IEJSMl9UQVJHRVRf
T1BURUVfT1NfQ1VTVE9NX1JFUE9fVkVSU0lPTiBcCj4gICAJCQkJaWYgQlIyX1RBUkdFVF9PUFRF
RV9PU19DVVNUT01fR0lUCj4gICAKPiBkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1v
cy5oYXNoIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoCj4gaW5kZXggZDNhMjYzN2E0ZS4u
NWMxMDQ3YmFjMyAxMDA2NDQKPiAtLS0gYS9ib290L29wdGVlLW9zL29wdGVlLW9zLmhhc2gKPiAr
KysgYi9ib290L29wdGVlLW9zL29wdGVlLW9zLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBG
cm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvYXJjaGl2ZS8zLjE2LjAvb3B0
ZWUtb3MtMy4xNi4wLnRhci5nego+IC1zaGEyNTYgIGViYzhlMThhZDIwMzllZTk3YzM0Zjc0YTc1
NDZkZTkxMTllMjZmMDRjMzY4YjZjN2ZkMGM1NWY5M2QzM2QyZDYgIG9wdGVlLW9zLTMuMTYuMC50
YXIuZ3oKPiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvYXJjaGl2
ZS8zLjE3LjAvb3B0ZWUtb3MtMy4xNi4wLnRhci5nego+ICtzaGEyNTYgIDVkNWEzYmRhODNhYmRk
ZmViNWVlNzY1YTE1NTI1ZjIzYWRmMjcwOWJhMjQ3NWEwNWUwYzVmMjU3OTBjMTg4M2YgIG9wdGVl
LW9zLTMuMTcuMC50YXIuZ3oKPiAgICMgTG9jYWxseSBjb21wdXRlZAo+ICAgc2hhMjU2ICAxMjQ3
ZWU5MDg1OGY0MDM3YjZjYWM2M2NiZmZkZGZlZDQzNWQwZDczYzYzMWIzN2Q3OGMxZTZlNmFiM2U1
ZDFhICBMSUNFTlNFCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
