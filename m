Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E85C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 19:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84C378414E;
	Thu,  7 Apr 2022 19:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUmwQ43gL34p; Thu,  7 Apr 2022 19:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F03C8411F;
	Thu,  7 Apr 2022 19:07:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 427331BF282
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EF9860E26
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJA7SZIW094k for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 19:07:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2CC860DF0
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 19:07:25 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id d7so7509918edn.11
 for <buildroot@buildroot.org>; Thu, 07 Apr 2022 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OeNoybPIR1kXlqxEllTLjPtJ/HJS2XhfAevXb4Vhh0w=;
 b=hPTzODJPEE1gaJDB5PWEefNWA1EfwvyzExfst27Hz6FZSe2vliXmraa2Ll+wBv+o8z
 yT/x1UhyNYx++Eb+x/G/rxvMOLVVAUAJQ1lSF4rF2qyAPo692VxHGGtaazFPMyr+ru7W
 nw6xRXpzlWlgnISI+gOoM6iYJuhXx5AZIlLzlyKeNTWvanrWteIl1SSx9InEoisNKzDo
 Dja4hf5NvUQO1GGcdpbSvL+xM1e0e5zsiB7pPnhHK4uijzGn8qW20mQqvwy7UKYDRqIg
 8qGSGRr//s+abMg9/J9uAb5CDBKtXGI/xW6U926kzcCYO9c3KcURqfRKhPJLtAo7roro
 /rVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OeNoybPIR1kXlqxEllTLjPtJ/HJS2XhfAevXb4Vhh0w=;
 b=1td7ZvA67jB6RsBFOgfvXqElmpBVf65+/RFfW9EmUMCGmP2X772bzIVKxXM305rNwd
 JgC4yMUE+uiyZQDR/e0XAHtmJrCM0QhLt3BhtDNkiJT6Gb6hh3mx5uusbfyEivBcBCkl
 IKLDOjeB3JzkQ9BPMq+OVpl2hGWfvZ0Uwf2C/Bztetr9B92KJOuUf8LqrZpaEG96b6qv
 IBMM+RQattbhEOZyZUToTWHHgf/3Siyh9E7lOEjofA4R5dvsAF/l8+Fz8/2s9QHfe9F0
 uOvbUKV3K9K6V3zYcp9VhM4J9ST7IstSfm0F/dK2G0jF0sgrUV+dUaJhbk8hMk282h9y
 ntAw==
X-Gm-Message-State: AOAM530XLI1N5/UgIpdIXKnBLmIisdCyoj1zHciLLVm5+lXsY+0KswVl
 mNM45Y1hkxkNVs2m7ACkdgeMoHlIUv6BJg==
X-Google-Smtp-Source: ABdhPJwWFNZHpYIBY0aEyRb+ekcGmGlQoXHupeQ9Kcs3/FkDM+ZyVMS3gm2wbWGijTW9o5qMV7rdRQ==
X-Received: by 2002:a05:6402:4254:b0:419:245b:8051 with SMTP id
 g20-20020a056402425400b00419245b8051mr15751851edb.295.1649358443816; 
 Thu, 07 Apr 2022 12:07:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a056402359100b0041926ea1e12sm9863909edc.53.2022.04.07.12.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 12:07:23 -0700 (PDT)
Message-ID: <ac60936d-08a5-cfaa-054f-21591bac5257@mind.be>
Date: Thu, 7 Apr 2022 21:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
References: <20220329205136.32435-1-vincent.stehle@laposte.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220329205136.32435-1-vincent.stehle@laposte.net>
Subject: Re: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_nommu: use busybox
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOS8wMy8yMDIyIDIyOjUxLCBWaW5jZW50IFN0ZWhsw6kgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBVcGRhdGUgdGhlIHFlbXVfeHRlbnNhX2x4NjBfbm9tbXVfZGVmY29uZmlnIHRvIHVzZSB0
aGUKPiBidXN5Ym94LW1pbmltYWwuY29uZmlnLCB0byBtYWtlIGl0IG1vcmUgY29uc2lzdGVudCB3
aXRoIHRoZSBvdGhlciBuby1NTVUKPiBkZWZjb25maWdzLgo+IAo+IEFmdGVyIGNvbW1pdCAzZGU0
ODZmOGIwNTIgKCJwYWNrYWdlL2J1c3lib3g6IGZpeCB1ZGhjcGMgb3B0aW9ucyBpbiBtaW5pbWFs
Cj4gY29uZmlnIiksIHRoaXMgaGFzIHRoZSBiZW5lZml0IG9mIGZpeGluZyB0aGUgZm9sbG93aW5n
IG5ldHdvcmsKPiBpbml0aWFsaXphdGlvbiBmYWlsdXJlOgo+IAo+ICAgIHVkaGNwYzogaW52YWxp
ZCBvcHRpb24gLS0gYgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2Vu
dC5zdGVobGVAbGFwb3N0ZS5uZXQ+Cj4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdt
YWlsLmNvbT4KPiBDYzogR2Vyb21lIEJ1cmxhdHMgPGdlcm9tZS5idXJsYXRzQHNtaWxlLmZyPgoK
ICBBcyBwcm9taXNlZDogYXBwbGllZCB0byBtYXN0ZXIgd2l0aCBhbiBleHRlbmRlZCBjb21taXQg
bWVzc2FnZS4KCiAgSG93ZXZlciwgdGhlIHByb3BlciBhcHByb2FjaCB3b3VsZCBiZSB0byByZXZl
cnQgYm90aCB0aGlzIGFuZCAzZGU0ODZmOGIwNTIsIAphbmQgaW5zdGVhZCBhZGQgYSBjb25maWcg
Zml4dXAgdG8gYnVzeWJveC5tayB0aGF0IHJlbW92ZXMgdGhlIC1iIG9wdGlvbiBmcm9tIApDT05G
SUdfSUZVUERPV05fVURIQ1BDX0NNRF9PUFRJT05TIG9uIE5PTU1VLiBUaGUgcmVnZXggdG8gbWF0
Y2ggaXQgaXMgZ29pbmcgdG8gCmJlIHRyaWNreSB0byB3cml0ZSB0aG91Z2guLi4gKC9DT05GSUdf
SUZVUERPV05fVURIQ1BDX0NNRF9PUFRJT05TPSItYlxiLyB3b3JrcyAKZm9yIG91ciBjb25maWcs
IGJ1dCB3ZSBhbHNvIHdhbnQgdG8gcmVtb3ZlIGl0IGZyb20gYSB1c2VyLXN1cHBsaWVkIGNvbmZp
ZyB3aGVyZSAKLWIgbWF5IG5vdCBiZSB0aGUgZmlyc3Qgb3B0aW9uKS4KCiAgU28gaW4gb3JkZXIg
dG8gZ2V0IHRoaXMgZml4ZWQgZXhwZWRpZW50bHksIEkgYXBwbGllZCB0aGlzIHBhdGNoLgoKICBS
ZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIGNvbmZpZ3MvcWVtdV94dGVuc2FfbHg2MF9ub21t
dV9kZWZjb25maWcgfCAzICsrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL3FlbXVfeHRlbnNhX2x4NjBfbm9tbXVfZGVmY29uZmln
IGIvY29uZmlncy9xZW11X3h0ZW5zYV9seDYwX25vbW11X2RlZmNvbmZpZwo+IGluZGV4IGM0NDcz
ZmIzMmEuLjQ0ZmI4MWJkNzQgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9xZW11X3h0ZW5zYV9seDYw
X25vbW11X2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvcWVtdV94dGVuc2FfbHg2MF9ub21tdV9k
ZWZjb25maWcKPiBAQCAtNyw2ICs3LDkgQEAgQlIyX1hURU5TQV9PVkVSTEFZX0ZJTEU9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9qY212YmtiYy94dGVuc2EtdG9vbGNoYWluLWJ1aWxkL3Jhdy8KPiAgIEJS
Ml9QQUNLQUdFX0hPU1RfRUxGMkZMVD15Cj4gICAjIEJSMl9VU0VfTU1VIGlzIG5vdCBzZXQKPiAg
IAo+ICsjIFVzZSBtaW5pbWFsIGJ1c3lib3ggd2l0aCBodXNoIGFuZCBuZXR3b3JraW5nIHRvb2xz
Cj4gK0JSMl9QQUNLQUdFX0JVU1lCT1hfQ09ORklHPSJwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1t
aW5pbWFsLmNvbmZpZyIKPiArCj4gICAjIFN5c3RlbQo+ICAgQlIyX1NZU1RFTV9ESENQPSJldGgw
Igo+ICAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eVMwIgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
