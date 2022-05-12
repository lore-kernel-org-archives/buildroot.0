Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB2CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 21:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EF5F4109E;
	Thu, 12 May 2022 21:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7kcdOKK3a8NJ; Thu, 12 May 2022 21:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F49402EF;
	Thu, 12 May 2022 21:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD8A1BF3D4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19ABB4027C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7g6OlxHb29j for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 21:57:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFA2D4025E
 for <buildroot@buildroot.org>; Thu, 12 May 2022 21:57:19 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id a21so7854034edb.1
 for <buildroot@buildroot.org>; Thu, 12 May 2022 14:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kVTNR+gQtsxvmWIVQUcSkQRkx5oY4csEEK6zG2WJQPU=;
 b=RpYa//I5WTgeo3Ef3WHC4R7vMzipKA/hALLM9HqCeN3gDuZXTu5NGoNgWo9ISUuBnZ
 9Zlw8HHa+sy2a5jKeMlIv9eayWHkWzJOvjXOHy9G6NCXqf866gM1KrDMVH3SsfoNCYYx
 YZOM13a29sc9kj4Z7bhyw59TOk+WoitE1+SnWPFTvL32z0F5ncPGHG+06SNiRkfePRtq
 yuBUJEP7X36IOlaCgxOLulSeMtT0MLfTQjDrNLpBIHCQWdgwoJ1LZqz949xQvv/22ZQe
 HcWchp1m7azUdqNIIrCYLAGMC0WX0v8L42r/It+YBqNhRLiyr+Fd3Cqd+bQn5AIvwwxg
 3Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kVTNR+gQtsxvmWIVQUcSkQRkx5oY4csEEK6zG2WJQPU=;
 b=Y79Fby8llCzNTj1mRLJnYZFzgrFAyRtobne17nxZMvO1Ptu5gd1Mt5+bh4ws1rp73V
 XZHEjlpAm2nKlzlhlKGAbLUO1BOVyhlGAM353xg4isr/iEsmXC1oNc3HdxbMsgPUqLry
 z6OkI3NiFDdf+4x/0ovpeUl4EJxYnowqg/tsZ1z5zIYFnw2acIY9HMRYdcgT1opxm5hs
 RXnGmb41ctNPUW5K+E995faOTRykbrILMduMa9+asZKnt/TRClPi6irzQbROlWTaZUk5
 Ss6fQL4jgZpxx+tQveTsKobockn7RRLVANqJL142XGKIro4N9BA1IjVG0exDs6l/t3tr
 Istw==
X-Gm-Message-State: AOAM530kOixErgKnqZZrAa3sH+2dzyNAHkFcHCoJa3amvwIAOIDhoLkB
 kGG3BwhI3YX7d57Xhtb1TVzIbQ==
X-Google-Smtp-Source: ABdhPJxrxvyXF0upuQhgdpejc3Hg7uXzCHq27Gt3YHLaMQHPhP9ruZ8EGbApoisq2A8DQrp2ekYbGQ==
X-Received: by 2002:a50:c31e:0:b0:425:e127:2901 with SMTP id
 a30-20020a50c31e000000b00425e1272901mr36716792edb.134.1652392638021; 
 Thu, 12 May 2022 14:57:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ay7-20020a056402202700b0042617ba63cesm111473edb.88.2022.05.12.14.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 14:57:17 -0700 (PDT)
Message-ID: <e7ca5854-27eb-a416-1783-15193b0e898b@mind.be>
Date: Thu, 12 May 2022 23:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: =?UTF-8?Q?Noah_H=c3=bctter?= <noahhuetter@gmail.com>,
 Alistair Francis <alistair23@gmail.com>
References: <20220427131400.223113-1-noahhuetter@gmail.com>
 <CAKmqyKPcAFNmd5tz=JTZZVcUKKZeTpQsockEDL66pfjJM2FhKQ@mail.gmail.com>
 <04ff514d-0de7-279f-f443-0339fad4865f@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <04ff514d-0de7-279f-f443-0339fad4865f@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
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
Cc: Alistair Francis <alistair@alistair23.me>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wNS8yMDIyIDA4OjUwLCBOb2FoIEjDvHR0ZXIgd3JvdGU6Cj4gSGkgQWxpc3RhaXIs
Cj4gCj4gSXMgdGhlcmUgYW55IGFjdGlvbiBuZWVkZWQgZnJvbSBteSBzaWRlIHRvIGdldCB0aGlz
IGNvbW1pdHRlZD8KCiAgSXQncyBqdXN0IG9uZSBvZiB0aGUgKy0yMDAgcGVuZGluZyBwYXRjaGVz
IHRoYXQgYXJlIG5vdCB0cml2aWFsLgoKPiAKPiBOb2FoCj4gCj4gT24gNC8yOC8yMiAwMDo1NSwg
QWxpc3RhaXIgRnJhbmNpcyB3cm90ZToKPj4gT24gV2VkLCBBcHIgMjcsIDIwMjIgYXQgMTE6MTQg
UE0gTm9haCBIdWV0dGVyIDxub2FoaHVldHRlckBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IE5vYWggSHVldHRlciA8bm9haGh1ZXR0ZXJAZ21haWwuY29tPgo+Pgo+PiBS
ZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgo+
Pgo+PiBBbGlzdGFpcgo+Pgo+Pj4gLS0tCj4+PiDCoCBib290L29wZW5zYmkvQ29uZmlnLmluwqAg
fCA2ICsrKysrKwo+Pj4gwqAgYm9vdC9vcGVuc2JpL29wZW5zYmkubWsgfCAzICsrLQo+Pj4gwqAg
MiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvYm9vdC9vcGVuc2JpL0NvbmZpZy5pbiBiL2Jvb3Qvb3BlbnNiaS9Db25maWcu
aW4KPj4+IGluZGV4IGYxNDQzNDk4ZDkuLmZmMDk1ZWE4MDAgMTAwNjQ0Cj4+PiAtLS0gYS9ib290
L29wZW5zYmkvQ29uZmlnLmluCj4+PiArKysgYi9ib290L29wZW5zYmkvQ29uZmlnLmluCj4+PiBA
QCAtMTE5LDQgKzExOSwxMCBAQCBjb25maWcgQlIyX1RBUkdFVF9PUEVOU0JJX0ZXX0ZEVF9QQVRI
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdXN0IGJlIHNldCBpbiB0aGUgVS1Cb290IGNvbmZp
Z3VyYXRpb24gZm9yIHRoaXMgZmlsZSB0byBiZQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJv
ZHVjZWQuCj4+Pgo+Pj4gK2NvbmZpZyBCUjJfVEFSR0VUX09QRU5TQklfQ1VTVE9NX01BS0VPUFRT
Cj4+PiArwqDCoMKgwqDCoMKgIHN0cmluZyAiQ3VzdG9tIG1ha2Ugb3B0aW9ucyIKPj4+ICvCoMKg
wqDCoMKgwqAgaGVscAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgTGlzdCBvZiBjdXN0b20gbWFrZSBv
cHRpb25zIHBhc3NlZCBhdCBidWlsZCB0aW1lLiBDYW4gYmUKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
IHVzZWQgZm9yIGV4YW1wbGUgdG8gcGFzcyBhIEJVSUxEX0lORk89IHZhbHVlLgoKICBJbiB0aGlz
IGNhc2UsIGl0J3Mgbm90IHRyaXZpYWwgYmVjYXVzZSB0aGUgdXNlIGNhc2UgaXMgbm90IGNsZWFy
LiBBbG1vc3QgZXZlcnkgCnBhY2thZ2UgaGFzIHNvbWUgcmFuZG9tIG1ha2UsIGNtYWtlLCBtZXNv
biBvciB3aGF0ZXZlciBvcHRpb25zIHRoYXQgeW91IGNvdWxkIApwYXNzIHRvIGl0LiBXaGF0IG1h
a2VzIE9wZW5TQkkgc28gc3BlY2lhbCB0aGF0IHlvdSBuZWVkIHRvIHBhc3MgYSBmcmVlZm9ybSBs
aXN0IApvZiBhZGRpdGlvbmFsIG9wdGlvbnM/CgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPj4+ICsK
Pj4+IMKgIGVuZGlmCj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC9vcGVuc2JpL29wZW5zYmkubWsgYi9i
b290L29wZW5zYmkvb3BlbnNiaS5tawo+Pj4gaW5kZXggOGUwNTU2MzNhOC4uZDAwN2FlMTI5OSAx
MDA2NDQKPj4+IC0tLSBhL2Jvb3Qvb3BlbnNiaS9vcGVuc2JpLm1rCj4+PiArKysgYi9ib290L29w
ZW5zYmkvb3BlbnNiaS5tawo+Pj4gQEAgLTMxLDcgKzMxLDggQEAgQlJfTk9fQ0hFQ0tfSEFTSF9G
T1IgKz0gJChPUEVOU0JJX1NPVVJDRSkKPj4+IMKgIGVuZGlmCj4+Pgo+Pj4gwqAgT1BFTlNCSV9N
QUtFX0VOViA9IFwKPj4+IC3CoMKgwqDCoMKgwqAgQ1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9T
UykKPj4+ICvCoMKgwqDCoMKgwqAgQ1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9TUykgXAo+Pj4g
K8KgwqDCoMKgwqDCoCAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9PUEVOU0JJX0NVU1RPTV9N
QUtFT1BUUykpCj4+Pgo+Pj4gwqAgT1BFTlNCSV9QTEFUID0gJChjYWxsIHFzdHJpcCwkKEJSMl9U
QVJHRVRfT1BFTlNCSV9QTEFUKSkKPj4+IMKgIGlmbmVxICgkKE9QRU5TQklfUExBVCksKQo+Pj4g
LS0gCj4+PiAyLjM1LjEKPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
