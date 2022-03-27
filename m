Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5019EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF41440A05;
	Sun, 27 Mar 2022 16:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nr0y4JNLAxfS; Sun, 27 Mar 2022 16:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A9DF4099D;
	Sun, 27 Mar 2022 16:07:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B39F01BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A303260BB2
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXCvX969QxQr for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:07:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE77A60B9D
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:07:50 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id r13so24071496ejd.5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=fx+Jd4ddogOeK0bDiqf4ZV9srUYPCM2DdtEkW23pKYM=;
 b=POaJ2TWXCRR4s+iCOaTNr005kEFYjgmEKIGTzPNvheNLC5hmvOLgB4EgHKIa5LquR7
 9t1YB5QUl4NC7E7oNbTfR/4aABcMwYlKdQYVgj0vJ8JGk6/lCDDKTL12fmoWPXWhaCSc
 uRC0UBXpUWjE2JCpLdAXfCq4XJZ0CA3MTuUfwUG+KeKN4VPCR0eLn4Etx5d0Evt4F1Qh
 4b5kYYGa2vKdhHIZkEQb5U7SB10QO+XrpcuTwm4Zl/7F+PSdrRPHXpsgP18C0hOPPBN5
 VJcSayjBIzrFJPIn91PHgjgib+FvazlnLNXeMHTtFSw2LwdQFBt4MXJy/jbU6MpJczb6
 omEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fx+Jd4ddogOeK0bDiqf4ZV9srUYPCM2DdtEkW23pKYM=;
 b=kIUoSRTyetpm46rR+yd4JZDKBMlUZ67zfaWAwAyByGWAKEhpi8gR3yjK8lxEkjuh+q
 i2xfo53e2m1Lali/Mz6FPbrAe+FI7gqgfJyate7ns/TLakl3vE2nXNBzLT+9Pvj9Tlxe
 usZyIvXNiHusS/q6THFcLWbY6M/pQ19w73359LfGp/aCuvLf7clHP0/zkkNdRbHVUaFT
 ywoIMC7UuAcOeD4s+qxOVAIM8k/LVng4zRrI9xKh1RE2+bkDgftsrK2jfg4Gc4CkzKfT
 sKQo/6UuIrKrwTKoDmcQ3wAqsRJmNpVIy8gXYyiLesPWFRRnnHOVOVSDI2NeJWlDhhse
 2vQg==
X-Gm-Message-State: AOAM5302j1Ttt73Ui8dWEDeWm5/T1RKLcpQe71Jbr3dlKVykz/WzC+0X
 WjrlcTL3PpTh1g0ZHjSlZF3o+w==
X-Google-Smtp-Source: ABdhPJyJ95fKnCTIymxGBuHqscINtVJaAi/V/MczovsZQ1W3VxzqCEtbX+fmXOXadzCeBwHkjJeylQ==
X-Received: by 2002:a17:907:7e88:b0:6db:ad88:2294 with SMTP id
 qb8-20020a1709077e8800b006dbad882294mr22155832ejc.371.1648397269045; 
 Sun, 27 Mar 2022 09:07:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a509d02000000b00412d53177a6sm5944297ede.20.2022.03.27.09.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:07:48 -0700 (PDT)
Message-ID: <3615aca5-6be5-5cee-a4b2-172ee3505fa1@mind.be>
Date: Sun, 27 Mar 2022 18:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
References: <20220321145322.23881-1-vincent.stehle@laposte.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220321145322.23881-1-vincent.stehle@laposte.net>
Subject: Re: [Buildroot] [PATCH] package/busybox: fix udhcpc options in
 minimal config
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMS8wMy8yMDIyIDE1OjUzLCBWaW5jZW50IFN0ZWhsw6kgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBUaGUgYnVzeWJveC1taW5pbWFsLmNvbmZpZywgd2hpY2ggaXMgdXNlZCBieSBzeXN0ZW1z
IHdpdGhvdXQgYW4gTU1VLCBzcGVjaWZpZXMKPiB0aGUgIi1iIiBjb21tYW5kIGxpbmUgb3B0aW9u
IGZvciB1ZGhjcGMuIEhvd2V2ZXIsIHRoaXMgb3B0aW9uIGlzIG5vdCBzdXBwb3J0ZWQKPiBieSBC
dXN5Qm94IHVkaGNwYyBhbnltb3JlIHNpbmNlIHZlcnNpb24gMS4yNy4wIHdoZW4gYnVpbGRpbmcg
Zm9yIHN5c3RlbXMKPiB3aXRob3V0IGFuIE1NVS4KPiAKPiBSZW1vdmUgdGhlICItYiIgb3B0aW9u
IGZyb20gYnVzeWJveC1taW5pbWFsLmNvbmZpZyB0byByZXBhaXIgbmV0d29yawo+IGluaXRpYWxp
emF0aW9uIG9uIHN5c3RlbXMgd2l0aG91dCBhbiBNTVUuCj4gCj4gVGhpcyBmaXhlcyB0aGUgZm9s
bG93aW5nIG5ldHdvcmsgaW5pdGlhbGl6YXRpb24gZmFpbHVyZToKPiAKPiAgICB1ZGhjcGM6IGlu
dmFsaWQgb3B0aW9uIC0tIGIKPiAgICBGQUlMCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBT
dGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KCiAgQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gCj4gCj4gSGksCj4gCj4gSSBo
YXZlIHZlcmlmaWVkIG9uIHFlbXUgdGhhdCB0aGlzIHBhdGNoIGRvZXMgZml4IHRoZSBuZXR3b3Jr
IGluaXRpYWxpemF0aW9uIGZvcgo+IHFlbXVfYXJtX3ZlcnNhdGlsZV9ub21tdV9kZWZjb25maWcg
YW5kIHFlbXVfbTY4a19tY2Y1MjA4X2RlZmNvbmZpZy4KPiAKPiBJIGNvdWxkIG9ubHkgdmVyaWZ5
IHRoZSBidWlsZCBmb3Igc3RtMzJmNDI5X2Rpc2NvX3hpcF9kZWZjb25maWcsCj4gc3RtMzJmNDY5
X2Rpc2NvX3NkX2RlZmNvbmZpZyBhbmQgc3RtMzJmNDY5X2Rpc2NvX3hpcF9kZWZjb25maWcuCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IFZpbmNlbnQuCj4gCj4gCj4gICBwYWNrYWdlL2J1c3lib3gvYnVz
eWJveC1taW5pbWFsLmNvbmZpZyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2J1c3lib3gvYnVz
eWJveC1taW5pbWFsLmNvbmZpZyBiL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94LW1pbmltYWwuY29u
ZmlnCj4gaW5kZXggOWVhZTBmNTFmNC4uMWZiNGUzOWUyMSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZpZwo+ICsrKyBiL3BhY2thZ2UvYnVzeWJveC9i
dXN5Ym94LW1pbmltYWwuY29uZmlnCj4gQEAgLTEwMTgsNyArMTAxOCw3IEBAIENPTkZJR19VREhD
UF9ERUJVRz05Cj4gICBDT05GSUdfVURIQ1BDX1NMQUNLX0ZPUl9CVUdHWV9TRVJWRVJTPTgwCj4g
ICAjIENPTkZJR19GRUFUVVJFX1VESENQX1JGQzMzOTcgaXMgbm90IHNldAo+ICAgIyBDT05GSUdf
RkVBVFVSRV9VREhDUF84MDIxUSBpcyBub3Qgc2V0Cj4gLUNPTkZJR19JRlVQRE9XTl9VREhDUENf
Q01EX09QVElPTlM9Ii1iIC1SIgo+ICtDT05GSUdfSUZVUERPV05fVURIQ1BDX0NNRF9PUFRJT05T
PSItUiIKPiAgIAo+ICAgIwo+ICAgIyBQcmludCBVdGlsaXRpZXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
